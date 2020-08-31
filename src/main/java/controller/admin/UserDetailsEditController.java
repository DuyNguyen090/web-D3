/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDetails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import service.UserDetailsService;
import service.UserService;
import service.impl.UserDetailsServiceImpl;
import service.impl.UserServiceImpl;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/table/user-details-edit"})
public class UserDetailsEditController extends HttpServlet {

    UserService userService = new UserServiceImpl();
    UserDetailsService userDetailsService = new UserDetailsServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDetails userDetails = new UserDetails();
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("id")) {
                    userDetails.setId(Integer.parseInt(item.getString()));
                    userDetails = userDetailsService.getId(userDetails.getId());
                } else if (item.getFieldName().equals("fullName")) {
                    userDetails.setFullName(item.getString("utf-8"));
                } else if (item.getFieldName().equals("tel")) {
                    userDetails.setTel(item.getString("utf-8"));
                } else if (item.getFieldName().equals("address")) {
                    userDetails.setAddress(item.getString("utf-8"));
                }
            }

            userDetailsService.edit(userDetails);
            resp.sendRedirect(req.getContextPath() + "/table/user-details?uid=" + userDetails.getUser().getId());
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/table/user-details?uid=" + userDetails.getUser().getId());
        }

    }

}
