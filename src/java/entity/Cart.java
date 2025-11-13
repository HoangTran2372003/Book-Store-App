/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class Cart {

    private int id;
    private int user_id;
    private double total;
    private LocalDateTime create_at;
    private LocalDateTime update_at;

    public Cart() {
    }

    public Cart(int id, int user_id, double total, LocalDateTime create_at, LocalDateTime update_at) {
        this.id = id;
        this.user_id = user_id;
        this.total = total;
        this.create_at = create_at;
        this.update_at = update_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public LocalDateTime getCreate_at() {
        return create_at;
    }

    public void setCreate_at(LocalDateTime create_at) {
        this.create_at = create_at;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }

    private Vector<CartItems> items = new Vector<>();

    public void addItem(CartItems newItem) {
        for (CartItems item : items) {
            if (item.getBook_id() == newItem.getBook_id()) {
                item.setQuantity(item.getQuantity() + newItem.getQuantity());
                return;
            }
        }
        items.add(newItem);
    }

    public void updateQuantity(int BookId, int quantity) {
        for (CartItems item : items) {
            if (item.getBook_id() == BookId) {
                if (quantity > 0) {
                    item.setQuantity(quantity);
                } else {
                    items.remove(item);
                }
                break;
            }
        }
    }

    public void removeItem(int bookId) {
        items.removeIf(item -> item.getBook_id() == bookId);
    }

    public Vector<CartItems> getItems() {
        return items;
    }

    public double getTotal() {
        double total = 0;
        for (CartItems item : items) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }

    public void clear() {
        items.clear();
    }

}
