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

@WebServlet(urlPatterns = "/product/category")
public class ProductSeachByCategory extends HttpServlet {

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cate_name = req.getParameter("cate_name");
        String cate_sex = req.getParameter("cate_sex");
        String cate = "";
        String keyword = "";
        List<Product> listProduct = new ArrayList<>();
        List<Product> productSeachByCategory = new ArrayList<>();
        if (cate_sex != null) {
            listProduct = productService.seachByCategorySex(cate_sex);
            cate = "cate_sex";
            keyword = cate_sex;
        }
        if (cate_name != null) {
            listProduct = productService.seachByCategoryName(cate_name);
            cate = "cate_name";
            keyword = cate_name;
        }

        int num_page = listProduct.size() / 10;
        int index = 1;
        int start = 0;
        int end = 10;

        if (num_page * 10 < listProduct.size()) {
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
                productSeachByCategory.add(listProduct.get(i));
            }
        }
        req.setAttribute("cate", cate);
        req.setAttribute("keyword", keyword);
        req.setAttribute("index", index);
        req.setAttribute("num_page", num_page);
        req.setAttribute("productSeachByCategory", productSeachByCategory);
        req.getRequestDispatcher("/views/web/productSeachByCategory.jsp").forward(req, resp);

    }
}
