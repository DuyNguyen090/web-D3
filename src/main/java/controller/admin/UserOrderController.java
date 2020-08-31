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
import model.User;
import service.OrderDetailsService;
import service.OrderService;
import service.UserService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;
import service.impl.UserServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/table/user-order"})
public class UserOrderController extends HttpServlet {

    UserService userService = new UserServiceImpl();
    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService detailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user1 = userService.get(Integer.parseInt(req.getParameter("id")));
        List<Order> listOrders = orderService.getByUser(user1.getId());

        Long sum = 0L;
        for (int i = 0; i < listOrders.size(); i++) {
            List<OrderDetails> detailses = detailsService.get(listOrders.get(i).getId());
            for (OrderDetails details : detailses) {
                sum = sum + details.getUnitPrice();
            }
            listOrders.get(i).setTotalPrice(sum);
        }
        req.setAttribute("listOrders", listOrders);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-order-user.jsp");
        dispatcher.forward(req, resp);

    }

}
