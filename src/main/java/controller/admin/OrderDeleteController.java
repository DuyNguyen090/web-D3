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
import service.OrderDetailsService;
import service.OrderService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/admin/order/delete"})
public class OrderDeleteController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService detailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        detailsService.delete(id);
        orderService.delete(id);
        if (req.getParameter("status") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/order/list");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/order/list?status=" + req.getParameter("status"));
        }

    }

}
