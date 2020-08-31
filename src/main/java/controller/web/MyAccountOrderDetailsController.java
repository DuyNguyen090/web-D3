/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderDetails;
import service.OrderDetailsService;
import service.OrderService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/table/member/order-details"})
public class MyAccountOrderDetailsController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService orderDetailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderDetails> orderDetails = new ArrayList<>();
        if (req.getParameter("id") != null) {
            String id = req.getParameter("id");
            orderDetails = orderDetailsService.get(id);
            req.setAttribute("o_id", id);
            req.setAttribute("orderDetails", orderDetails);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/order-details.jsp");
        rd.forward(req, resp);
    }
}
