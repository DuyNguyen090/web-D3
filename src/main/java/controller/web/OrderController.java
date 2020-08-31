package controller.web;

import java.io.IOException;
import java.util.Map;

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
import service.UserService;
import service.impl.OrderDetailsServiceImpl;
import service.impl.OrderServiceImpl;
import service.impl.UserServiceImpl;
import tool.SendMail;
import util.RandomUUID;

@WebServlet(urlPatterns = "/member/order")
public class OrderController extends HttpServlet {

    UserService userService = new UserServiceImpl();
    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService orderDetailsService = new OrderDetailsServiceImpl();
    long time = System.currentTimeMillis();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("account");
        if (obj == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            Object objCart = session.getAttribute("cart");
            if (objCart != null) {
                User buyer = (User) obj;
                Order order = new Order();
                order.setUser(buyer);
                order.setTimeOrder(new java.sql.Date(time));
                order.setStatus(1);
                order.setId(RandomUUID.getRandomID());
                orderService.insert(order);
                // ep ve dung kieu cua no khi them vao o phan them vao gio hang controller
                Map<Integer, OrderDetails> map = (Map<Integer, OrderDetails>) objCart;

                for (OrderDetails orderDetails : map.values()) {
                    orderDetails.setOrder(order);
                    SendMail sm = new SendMail();
                    sm.sendMail(order.getUser().getEmail(), "WebShop D3", "Đơn hàng (#"+order.getId()+") của bạn đang chờ xác nhận! Cảm ơn bạn đã đặt hàng.");
                    orderDetailsService.insert(orderDetails);
                }
                session.removeAttribute("cart");
                resp.sendRedirect(req.getContextPath() + "/home");
            }else{
                resp.sendRedirect(req.getContextPath() + "/member/cart");
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
