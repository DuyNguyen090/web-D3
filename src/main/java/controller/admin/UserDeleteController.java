package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserDetailsService;

import service.UserService;
import service.impl.UserDetailsServiceImpl;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/admin/user/delete"})
public class UserDeleteController extends HttpServlet {

    UserService userService = new UserServiceImpl();
    UserDetailsService userDetailsService = new UserDetailsServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String path = getServletContext().getRealPath("/");
        userDetailsService.delete(userDetailsService.getUserId(Integer.parseInt(id)).getId());
        userService.delete(Integer.parseInt(id), path);
        resp.sendRedirect(req.getContextPath() + "/admin/user/list");

    }
}
