package Controller;

import Model.Mypham;
import Model.MyphamDAO;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

@WebServlet("/AIChat")
public class AIChat extends HttpServlet {

    // Lấy API key tại: https://console.groq.com → API Keys
    private static final String API_KEY = "KEY-API";
    private static final String GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
    private static final String MODEL    = "llama-3.3-70b-versatile";

    private MyphamDAO dao  = new MyphamDAO();
    private Gson      gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        String userMessage = request.getParameter("message");
        if (userMessage == null || userMessage.trim().isEmpty()) {
            response.getWriter().write("Vui lòng nhập câu hỏi");
            return;
        }

        // ── Lấy dữ liệu sản phẩm từ DB ──────────────────────────────────
        List<Mypham> products = dao.getAllProducts();
        StringBuilder productData = new StringBuilder();
        for (Mypham p : products) {
            productData.append("- ").append(p.getTen())
                    .append(" | Giá: ").append(p.getGia())
                    .append(" | Danh mục: ").append(p.getDanhMuc())
                    .append(" | Thương hiệu: ").append(p.getThuongHieu())
                    .append(" | Mô tả: ").append(p.getMoTa())
                    .append("\n");
        }

        // ── Xây dựng prompt ──────────────────────────────────────────────
        String systemPrompt = "Bạn là AI tư vấn mỹ phẩm chuyên nghiệp, thân thiện, nhiệt tình.\n"
                + "Dưới đây là danh sách sản phẩm hiện có:\n\n"
                + productData
                + "\nChỉ tư vấn dựa trên sản phẩm trên. "
                + "Nếu không có sản phẩm phù hợp, hãy trả lời lịch sự bằng tiếng Việt.";

        // ── Build JSON body theo chuẩn OpenAI (Groq dùng chuẩn này) ─────
        JsonObject systemMsg = new JsonObject();
        systemMsg.addProperty("role", "system");
        systemMsg.addProperty("content", systemPrompt);

        JsonObject userMsg = new JsonObject();
        userMsg.addProperty("role", "user");
        userMsg.addProperty("content", userMessage);

        JsonArray messages = new JsonArray();
        messages.add(systemMsg);
        messages.add(userMsg);

        JsonObject body = new JsonObject();
        body.addProperty("model", MODEL);
        body.add("messages", messages);
        body.addProperty("max_tokens", 1024);
        body.addProperty("temperature", 0.7);

        String jsonInput = gson.toJson(body);

        // ── Gọi Groq API ─────────────────────────────────────────────────
        String aiReply = callGroq(jsonInput);

        aiReply = aiReply.replace("\n", "<br>");
        PrintWriter out = response.getWriter();
        out.print(aiReply);
        out.flush();
    }

    private String callGroq(String jsonInput) {
        try {
            URL url = new URL(GROQ_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            // ── Header: Groq dùng Bearer token ───────────────────────────
            conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setDoOutput(true);
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonInput.getBytes("UTF-8"));
            }

            int code = conn.getResponseCode();
            System.out.println("Groq HTTP Status: " + code);

            BufferedReader br;
            if (code == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            StringBuilder result = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) result.append(line);
            br.close();

            String json = result.toString();
            System.out.println("Groq Response: " + json);

            if (code == 429) {
                return "Hệ thống đang bận, vui lòng thử lại sau ít phút nhé! 😊";
            }
            if (code != 200) {
                return "Xin lỗi, có lỗi xảy ra (HTTP " + code + "). Vui lòng thử lại.";
            }

            // ── Parse JSON: Groq → choices[0].message.content ────────────
            JsonObject root     = JsonParser.parseString(json).getAsJsonObject();
            JsonArray  choices  = root.getAsJsonArray("choices");

            if (choices != null && choices.size() > 0) {
                JsonObject firstChoice = choices.get(0).getAsJsonObject();
                JsonObject message     = firstChoice.getAsJsonObject("message");
                return message.get("content").getAsString();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Xin lỗi, không thể kết nối AI lúc này. Vui lòng thử lại sau.";
    }
}