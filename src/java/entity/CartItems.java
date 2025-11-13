/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author tranh
 */
public class CartItems {

    private int id;
    private int cart_id;
    private int book_id;
    private int quantity;
    private double price;

    public CartItems() {
    }

    public CartItems(int id, int cart_id, int book_id, int quantity, double price) {
        this.id = id;
        this.cart_id = cart_id;
        this.book_id = book_id;
        this.quantity = quantity;
        this.price = price;
    }

    public CartItems(Books book, int quantity) {
        this.book_id = book.getId();    
        this.quantity = quantity;
        this.price = book.getPrice();  
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
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

    @Override
    public String toString() {
        return "CartItems{" + "id=" + id + ", cart_id=" + cart_id + ", book_id=" + book_id + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
