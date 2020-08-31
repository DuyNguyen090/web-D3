/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import service.OrderService;
import service.impl.OrderServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/member/myaccount/edit-purchase"})
public class MyAccountEditPurchaseController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        int newStatus = Integer.parseInt(req.getParameter("status"));
        Order order = orderService.getId(id);
        int oldStatus = order.getStatus();
        order.setStatus(newStatus);
        orderService.edit(order);
        resp.sendRedirect(req.getContextPath() + "/member/myaccount/purchase?status=" + oldStatus);
    }

}
