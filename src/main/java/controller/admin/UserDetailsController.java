/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDetails;
import service.UserDetailsService;
import service.UserService;
import service.impl.UserDetailsServiceImpl;
import service.impl.UserServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/table/user-details"})
public class UserDetailsController extends HttpServlet {

    UserService userService = new UserServiceImpl();
    UserDetailsService userDetailsService = new UserDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("uid") != null) {
            int id = Integer.parseInt(req.getParameter("uid"));
            UserDetails userDetails = userDetailsService.getUserId(id);
            req.setAttribute("ud", userDetails);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user-details.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("id") != null) {
            int id = Integer.parseInt(req.getParameter("id"));
            String fullName = req.getParameter("fullName");
            String address = req.getParameter("address");
            String tel = req.getParameter("tel");
            UserDetails userDetails = userDetailsService.getId(id);
            userDetails.setId(id);
            userDetails.setAddress(address);
            userDetails.setTel(tel);
            userDetailsService.edit(userDetails);
            resp.sendRedirect(req.getContextPath() + "/table/user-details?uid=" + userDetails.getUser().getId());

        }

    }

}
