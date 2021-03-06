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

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = "/product/detail")
public class ProductDetailController extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        Product product = productService.get(Integer.parseInt(id));
        List<Category> categories = categoryService.getAll();
        List<Product> pwelcome = productService.getAll();
        req.setAttribute("categories", categories);

        req.setAttribute("product", product);
        req.setAttribute("pwelcome", pwelcome);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/product-detail.jsp");
        dispatcher.forward(req, resp);
    }

}
