package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = {"/admin/order/list"})
public class OrderListController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService detailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orderListAll = orderService.getAll();
        List<OrderDetails> listDetails = detailsService.getAll();
        List<Order> orderList = new ArrayList<>();
        int num_page = orderListAll.size() / 10;
        int start = 0;
        int end = 10;
        if (num_page * 10 < orderListAll.size()) {
            num_page = num_page + 1;
        }
        if (orderListAll.size() < end) {
            end = orderListAll.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            if (orderListAll.size() < end) {
                end = orderListAll.size();
            }
        }

        if (orderListAll.isEmpty()) {
            String msg = "Không có hóa đơn";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                orderList.add(orderListAll.get(i));
            }
            for (int i = 0; i < orderList.size(); i++) {
                List<OrderDetails> detailses = detailsService.get(orderList.get(i).getId());
                Long sum = 0L;
                for (OrderDetails details : detailses) {
                    sum = sum + details.getUnitPrice();
                }
                orderList.get(i).setTotalPrice(sum);
            }
            req.setAttribute("num_page", num_page);
            req.setAttribute("orderList", orderList);
        }
        req.setAttribute("listDetails", listDetails);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-order.jsp");
        dispatcher.forward(req, resp);
    }
}
