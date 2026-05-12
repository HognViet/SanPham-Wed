/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class CartItem {
    public int cart_item_id;
    public int cart_id;
    public int sanpham_id;
    public int quantity;
    public double price;
    public String ten;
    public String hinh;

    public CartItem() {
    }

    public CartItem(int cart_item_id, int cart_id, int mypham_id, int quantity, double price, String ten, String hinh) {
        this.cart_item_id = cart_item_id;
        this.cart_id = cart_id;
        this.sanpham_id = mypham_id;
        this.quantity = quantity;
        this.price = price;
        this.ten = ten;
        this.hinh = hinh;
    }

    public int getCart_item_id() {
        return cart_item_id;
    }

    public void setCart_item_id(int cart_item_id) {
        this.cart_item_id = cart_item_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getMypham_id() {
        return sanpham_id;
    }

    public void setMypham_id(int mypham_id) {
        this.sanpham_id = mypham_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getHinh() {
        return hinh;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }
    
}
