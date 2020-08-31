package controller.admin;

import java.io.File;
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

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin/product/edit"})
public class ProductEditController extends HttpServlet {

    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        Product product = productService.get(Integer.parseInt(id));
        List<Category> categories = categoryService.getAll();

        req.setAttribute("categories", categories);

        req.setAttribute("product", product);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-product.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Product product = new Product();
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        String path = getServletContext().getRealPath("/");
        try {
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.getFieldName().equals("id")) {
                    product.setId(Integer.parseInt(item.getString()));
                } else if (item.getFieldName().equals("name")) {
                    product.setName(item.getString("utf-8"));
                } else if (item.getFieldName().equals("cate_id")) {
                    product.setCategory(categoryService.get(Integer.parseInt(item.getString())));
                } else if (item.getFieldName().equals("price")) {
                    product.setPrice(Long.parseLong(item.getString()));
                } else if (item.getFieldName().equals("des")) {
                    product.setDes(item.getString("utf-8"));
                } else if (item.getFieldName().equals("image")) {
                    if (item.getSize() > 0) {
                        String originalFileName = item.getName();
                        int index = originalFileName.lastIndexOf(".");
                        String ext = originalFileName.substring(index + 1);
                        String fileName = System.currentTimeMillis() + "." + ext;

                        File uploadedFile = new File(path + "Images/" + fileName);
                        item.write(uploadedFile);
                        product.setImage(fileName);
                    } else {
                        product.setImage(productService.get(product.getId()).getImage());
                    }
                }
            }
            product.getCategory().getId();
            productService.edit(product, path);
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
