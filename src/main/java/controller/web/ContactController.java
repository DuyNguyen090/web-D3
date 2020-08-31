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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import tool.SendMail;

/**
 *
 * @author DUY
 */
@WebServlet(urlPatterns = {"/contact"})
public class ContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/contact.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("UTF-8");
        String message = "";
        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("name")) {
                    message = message + "Tên khách hàng: " + item.getString("utf-8") + "\n";
                } else if (item.getFieldName().equals("email")) {
                    message = message + "Email khách hàng: " + item.getString("utf-8") + "\n";
                } else if (item.getFieldName().equals("email")) {
                    message = message + "Email khách hàng: " + item.getString("utf-8") + "\n";
                } else if (item.getFieldName().equals("tel")) {
                    message = message + "Số điện thoại: " + item.getString("utf-8") + "\n";
                } else if (item.getFieldName().equals("message")) {
                    message = message + "Nội dung: " + item.getString("utf-8") + "\n";
                }
            }
            message = message + "----Mail tự động-----"; 
            SendMail sm = new SendMail();
            sm.sendMail("duy1st1@gmail.com", "WebShop D3 contact", message);
            req.setAttribute("alert", "Liên hệ thành công! Shop sẽ hỗ trợ bạn sớm nhất có thể!");
            resp.sendRedirect(req.getContextPath()+"/contact");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            req.setAttribute("alert","Không thể gửi tin!");
            resp.sendRedirect(req.getContextPath()+"/contact");
        }

    }

}
