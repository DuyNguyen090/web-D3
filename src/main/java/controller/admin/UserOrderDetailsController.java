/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetails;
import service.OrderDetailsService;
import service.OrderService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/table/user-order/details"})
public class UserOrderDetailsController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService detailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order order = orderService.getId(id);
        List<OrderDetails> orderDetails = detailsService.get(id);
        Long sum = 0L;
        for (OrderDetails orderDetail : orderDetails) {
            sum = sum + orderDetail.getUnitPrice();
        }
        req.setAttribute("order", order);
        req.setAttribute("orderDetails", orderDetails);
        req.setAttribute("sum", sum);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/order-details_1.jsp");
        dispatcher.forward(req, resp);

    }
}
