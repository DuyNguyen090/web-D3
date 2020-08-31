package controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = "/product/seach-grid")
public class ProductSeachByNameGrid extends HttpServlet {

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        List<Product> listProduct = productService.seachByName(name);
        List<Product> productSeachByName = new ArrayList<>();
        int num_page = listProduct.size() / 10;
        int index = 1;
        int start = 0;
        int end = 12;

        if (num_page * 12 < listProduct.size()) {
            num_page = num_page + 1;
        }
        if (listProduct.size() < end) {
            end = listProduct.size();
        }
        if (req.getParameter("page") != null) {
            int page = Integer.parseInt(req.getParameter("page"));
            start = end * (page - 1);
            end = end * page;
            index = page;
            if (listProduct.size() < end) {
                end = listProduct.size();
            }
        }
        if (listProduct.isEmpty()) {
            String msg = "Không có sản phẩm";
            req.setAttribute("msg", msg);
        } else {
            for (int i = start; i < end; i++) {
                productSeachByName.add(listProduct.get(i));
            }
        }
        req.setAttribute("index", index);
        req.setAttribute("num_page", num_page);
        req.setAttribute("productSeachByName", productSeachByName);
        req.getRequestDispatcher("/views/web/product-seach-by-name-grid.jsp").forward(req, resp);

    }
}
