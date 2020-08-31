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
import javax.servlet.http.HttpSession;
import model.User;
import service.CategoryService;
import service.OrderService;
import service.ProductService;
import service.UserService;
import service.impl.CategoryServiceImpl;
import service.impl.OrderServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/admin")
public class AdminHomeController extends HttpServlet {

    OrderService orderService = new OrderServiceImpl();
    UserService userService = new UserServiceImpl();
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("account");
        User user = (User) obj;
        req.setAttribute("username", user.getUsername());
        req.setAttribute("num_order", orderService.getAll().size());
        req.setAttribute("num_user", userService.getAll().size());
        req.setAttribute("num_product", productService.getAll().size());
        req.setAttribute("num_cate", categoryService.getAll().size());
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);

    }

}
