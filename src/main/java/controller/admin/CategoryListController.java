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

import model.Category;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {"/admin/category/list"})
public class CategoryListController extends HttpServlet {

    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Category> categoriesAll = categoryService.getAll();
        List<Category> categories = new ArrayList<>();
        int num_page = categoriesAll.size() / 10;
        int start = 0;
        int end = 10;
        if (num_page * 10 < categoriesAll.size()) {
            num_page = num_page + 1;
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
        }
        if (categoriesAll.size() < end) {
            end = categoriesAll.size();
        }
        if (categoriesAll.isEmpty()) {
            String msg = "Không có loại sản phẩm ";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                categories.add(categoriesAll.get(i));
            }

            req.setAttribute("num_page", num_page);
            req.setAttribute("categories", categories);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-cate.jsp");
        dispatcher.forward(req, resp);
    }

}
