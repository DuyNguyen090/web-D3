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

import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin/product/list"})
public class ProductListController extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Product> proListAll = productService.getAll();
        List<Product> proList = new ArrayList<>();
        int num_page = proListAll.size() / 10;
        int start = 0;
        int end = 10;
        if (num_page * 10 < proListAll.size()) {
            num_page = num_page + 1;
        }
        if (proListAll.size() < end) {
            end = proListAll.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            if (proListAll.size() < end) {
                end = proListAll.size();
            }
        }

        if (proListAll.isEmpty()) {
            String msg = "Không có sản phẩm";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                proList.add(proListAll.get(i));
            }
            req.setAttribute("num_page", num_page);
            req.setAttribute("proList", proList);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-product.jsp");
        dispatcher.forward(req, resp);
    }

}
