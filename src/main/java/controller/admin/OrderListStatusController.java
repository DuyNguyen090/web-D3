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

@WebServlet(urlPatterns = {"/admin/order/list-status"})
public class OrderListStatusController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    OrderDetailsService detailsService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int status = Integer.parseInt(req.getParameter("status"));
        List<Order> orderList = orderService.getByStatus(status);
        int num_page = orderList.size() / 10;
        int start = 0;
        int end = 10;
        if (num_page * 10 < orderList.size()) {
            num_page = num_page + 1;
        }
        if (orderList.size() < end) {
            end = orderList.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            if (orderList.size() < end) {
                end = orderList.size();
            }
        }
        switch (status) {
            case 0:
                req.setAttribute("name_list", "hủy đơn");
                break;
            case 1:
                req.setAttribute("name_list", "chờ xác nhận");
                break;
            case 2:
                req.setAttribute("name_list", "chờ giao hàng");
                break;
            case 3:
                req.setAttribute("name_list", "đang giao");
                break;
            case 4:
                req.setAttribute("name_list", "đã giao");
                break;
        }

        if (orderList.isEmpty()) {
            String msg = "Không có hóa đơn";
            req.setAttribute("msg", msg);
        } else {
            for (int i = 0; i < orderList.size(); i++) {
                List<OrderDetails> detailses = detailsService.get(orderList.get(i).getId());
                Long sum = 0L;
                for (OrderDetails details : detailses) {
                    sum = sum + details.getUnitPrice();
                }
                orderList.get(i).setTotalPrice(sum);
            }

            req.setAttribute("status", status);
            req.setAttribute("num_page", num_page);
            req.setAttribute("orderList", orderList);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/list-order-status.jsp");
        rd.forward(req, resp);

    }

}
