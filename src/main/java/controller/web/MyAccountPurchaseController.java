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
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderDetails;
import model.User;
import service.OrderDetailsService;
import service.OrderService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet("/member/myaccount/purchase")
public class MyAccountPurchaseController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService orderDetailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("account");
        List<Order> orderList = new ArrayList<Order>();
        if (u != null) {
            if (req.getParameter("status") == null) {
                orderList = orderService.getByUser(u.getId());
            } else {
                int status = Integer.parseInt(req.getParameter("status"));
                orderList = orderService.getByStatus(u.getId(), status);
                req.setAttribute("st", status);
            }
            for (int i = 0; i < orderList.size(); i++) {
                List<OrderDetails> detailses = orderDetailsService.get(orderList.get(i).getId());
                Long sum = 0L;
                for (OrderDetails details : detailses) {
                    sum = sum + details.getUnitPrice();
                }
                orderList.get(i).setTotalPrice(sum);
            }
            req.setAttribute("orderList", orderList);
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/myaccount-purchase.jsp");
            rd.forward(req, resp);
        }
    }

}
