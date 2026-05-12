/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Cart {
    public int cart_id;
    public int mauser;

    public Cart(int cart_id, int mauser) {
        this.cart_id = cart_id;
        this.mauser = mauser;
    }

    public Cart() {
    }
    
    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getMauser() {
        return mauser;
    }

    public void setMauser(int mauser) {
        this.mauser = mauser;
    }
    
}
