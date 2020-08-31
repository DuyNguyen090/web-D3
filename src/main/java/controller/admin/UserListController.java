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

import model.User;
import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/admin/user/list"})
public class UserListController extends HttpServlet {

    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<User> userListAll = userService.getAll();
        List<User> userList = new ArrayList<>();
        int num_page = userListAll.size() / 10;
        int start = 0;
        int end = 10;
        if (num_page * 10 < userListAll.size()) {
            num_page = num_page + 1;
        }
        if (userListAll.size() < end) {
            end = userListAll.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            if (userListAll.size() < end) {
                end = userListAll.size();
            }
        }

        if (userListAll.isEmpty()) {
            String msg = "Không có khách hàng ";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                userList.add(userListAll.get(i));
            }
            req.setAttribute("num_page", num_page);
            req.setAttribute("userList", userList);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-user.jsp");
        dispatcher.forward(req, resp);
    }
}
