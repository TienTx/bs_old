/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.order;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author txtd1
 */
public class Cart implements Serializable {

    private int idCart;
    private ArrayList<BookOrder> listBook;
    private int bonnusPoint;
    private float totalPrice;

    public Cart() {
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public void setListBook(ArrayList<BookOrder> listBook) {
        this.listBook = listBook;
    }

    public void setBonnusPoint(int bonnusPoint) {
        this.bonnusPoint = bonnusPoint;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getIdCart() {
        return idCart;
    }

    public ArrayList<BookOrder> getListBook() {
        return listBook;
    }

    public int getBonnusPoint() {
        return bonnusPoint;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public Cart(ArrayList<BookOrder> listBook, int bonnusPoint, float totalPrice) {
        this.listBook = listBook;
        this.bonnusPoint = bonnusPoint;
        this.totalPrice = totalPrice;
    }

    public Cart(int idCart, ArrayList<BookOrder> listBook, int bonnusPoint, float totalPrice) {
        this.idCart = idCart;
        this.listBook = listBook;
        this.bonnusPoint = bonnusPoint;
        this.totalPrice = totalPrice;
    }
}
