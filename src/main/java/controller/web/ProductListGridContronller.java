package controller.web;

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

@WebServlet(urlPatterns = {"/product/list-grid"})
public class ProductListGridContronller extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productListAll = productService.getAll();
        List<Product> productList = new ArrayList<>();
        int num_page = productListAll.size() / 12;
        int index = 1;
        int start = 0;
        int end = 12;
        if (num_page * 12 < productListAll.size()) {
            num_page = num_page + 1;
        }
        if (productListAll.size() < end) {
            end = productListAll.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            index = page;
            if (productListAll.size() < end) {
                end = productListAll.size();
            }
        }

        if (productListAll.isEmpty()) {
            String msg = "Không có sản phẩm";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                productList.add(productListAll.get(i));
            }
        }
        req.setAttribute("index", index);
        req.setAttribute("num_page", num_page);
        req.setAttribute("productList", productList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/product-grid.jsp");
        dispatcher.forward(req, resp);
    }// c�i n�y sai

}
