/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.order;

import entity.person.customer.Customer;

/**
 *
 * @author zOzDarKzOz
 */
public class CardPoint {

    private int idCardPoint;
    private String cardCode;
    private int points;
    private Customer customer;

    public void setIdCardPoint(int idCardPoint) {
        this.idCardPoint = idCardPoint;
    }

    public void setCardCode(String cardCode) {
        this.cardCode = cardCode;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getIdCardPoint() {
        return idCardPoint;
    }

    public String getCardCode() {
        return cardCode;
    }

    public int getPoints() {
        return points;
    }

    public Customer getCustomer() {
        return customer;
    }

    public CardPoint(String cardCode, int points, Customer customer) {
        this.cardCode = cardCode;
        this.points = points;
        this.customer = customer;
    }

    public CardPoint(int idCardPoint, String cardCode, int points, Customer customer) {
        this.idCardPoint = idCardPoint;
        this.cardCode = cardCode;
        this.points = points;
        this.customer = customer;
    }

    public CardPoint() {
    }

}
