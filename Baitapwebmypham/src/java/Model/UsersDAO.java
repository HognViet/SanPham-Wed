/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Model;
import java.sql.*;
/**
 *
 * @author HongViet
 */
public class UsersDAO {

public boolean isExist(Users u) throws ClassNotFoundException, SQLException {
    Connection cnn = UsersConnection.getConnection();
    if (cnn == null) {
        cnn = UsersConnection.getConnection();
    }

    String sqlCheck = "SELECT * FROM users WHERE accname = ? OR loginname = ?";
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
            ps = cnn.prepareStatement(sqlCheck);
            ps.setString(1, u.accname);
            ps.setString(2, u.loginname);

            rs = ps.executeQuery();

            return rs.next();

        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        }
}

public void AddUser(Users u) throws ClassNotFoundException, SQLException {
    Connection cnn = UsersConnection.getConnection();
    if (cnn == null) {
        cnn = UsersConnection.getConnection();
    }


    String sqlInsert = "INSERT INTO users (accname, loginname, pass, email, phone, address) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = null; 
    try {
            ps = cnn.prepareStatement(sqlInsert);
            ps.setString(1, u.accname);
            ps.setString(2, u.loginname);
            ps.setString(3, u.pass);
            ps.setString(4, u.email);
            ps.setString(5, u.phone);
            ps.setString(6, u.address);

            ps.executeUpdate();

        } finally {
            if (ps != null) ps.close();
        }

    }
}
