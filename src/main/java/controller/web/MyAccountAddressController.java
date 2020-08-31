/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserDetails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.UserDetailsService;
import service.impl.UserDetailsServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/member/myaccount/address"})
public class MyAccountAddressController extends HttpServlet {

    UserDetailsService userDetailsService = new UserDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("account");
        if (session.getAttribute("account") != null) {
            UserDetails userDetails = userDetailsService.getUserId(u.getId());
            req.setAttribute("ud", userDetails);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/myaccount-address.jsp");
            dispatcher.forward(req, resp);
        }else{
            resp.sendRedirect(req.getContextPath()+ "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDetails userDetails = new UserDetails();
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("id")) {
                   
                    userDetails.setId(Integer.parseInt(item.getString()));
                } else if (item.getFieldName().equals("address")) {
                    userDetails.setAddress(item.getString("utf-8"));
                } else if (item.getFieldName().equals("fullName")) {
                    userDetails.setFullName(item.getString("utf-8"));
                } else if (item.getFieldName().equals("tel")) {
                    userDetails.setTel(item.getString("utf-8"));
                }
            }
            
            userDetailsService.edit(userDetails);
            resp.sendRedirect(req.getContextPath() + "/member/myaccount/address");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/member/myaccount/address");
        }

    }

}
