/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DUY
 */
public class Order implements Serializable {

    private String id;
    private User user;
    private Date timeOrder;
    private Long totalPrice;
    private int status;

    public Order() {
        super();
    }

    public Order(String id, User user, Date timeOrder, int status) {
        super();
        this.id = id;
        this.user = user;
        this.timeOrder = timeOrder;
        this.status = status;
    }

    public Order(String id, User user, Date timeOrder, Long totalPrice, int status) {
        this.id = id;
        this.user = user;
        this.timeOrder = timeOrder;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getTimeOrder() {
        return timeOrder;
    }

    public void setTimeOrder(Date timeOrder) {
        this.timeOrder = timeOrder;
    }

    public Long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
