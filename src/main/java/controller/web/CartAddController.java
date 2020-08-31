package controller.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderDetails;
import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/cart/add"}) // ?pId=123
public class CartAddController extends HttpServlet {

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pId = req.getParameter("pId");
        String quantity = req.getParameter("quantity");
        Product product = productService.get(Integer.parseInt(pId));
        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setQuantity(Integer.parseInt(quantity));
        orderDetails.setUnitPrice(product.getPrice()*Integer.parseInt(quantity));
        orderDetails.setProduct(product);
        
        HttpSession httpSession = req.getSession();
        Object obj = httpSession.getAttribute("cart");
        if (obj == null) {
            Map<Integer, OrderDetails> map = new HashMap<Integer, OrderDetails>();
            map.put(orderDetails.getProduct().getId(), orderDetails);
            httpSession.setAttribute("cart", map);
        } else {
            Map<Integer, OrderDetails> map = (Map<Integer, OrderDetails>) obj;
            OrderDetails existedCartItem = map.get(Integer.valueOf(pId));

            if (existedCartItem == null) {
                map.put(product.getId(), orderDetails);
            } else {
                existedCartItem.setQuantity(existedCartItem.getQuantity() + Integer.parseInt(quantity));
                existedCartItem.setUnitPrice(product.getPrice() * existedCartItem.getQuantity());
            }

            httpSession.setAttribute("cart", map);
        }
        /*
		 * if (obj != null) { CartItem cartItem = new CartItem();
		 * cartItem.setProduct(product); cartItem.setQuantity(1);
		 * cartItem.setUnitPrice(product.getPrice());
		 * 
		 * Map<Integer, CartItem> map = new HashMap<Integer, CartItem>(); // Su dung map
		 * de luu va tim kiem nhanh hon map.put(cartItem.getProduct().getId(),
		 * cartItem);
		 * 
		 * httpSession.setAttribute("cart", map);// luu vao session
		 * 
		 * } else {
		 * 
		 * Map<Integer, CartItem> map = (Map<Integer, CartItem>) obj; CartItem cartItem
		 * = map.get(product.getId()); // 1: Chua co san pham trong gio hang if
		 * (cartItem == null) { CartItem cartItems = new CartItem();
		 * cartItems.setProduct(product); cartItems.setQuantity(1);
		 * cartItems.setUnitPrice(product.getPrice());
		 * 
		 * // Su dung map de luu va tim kiem nhanh hon
		 * map.put(cartItems.getProduct().getId(), cartItems);
		 * 
		 * httpSession.setAttribute("cart", map);// luu vao session } else { // Truong
		 * hop da co roi cartItem.setQuantity(1 + cartItem.getQuantity());
		 * 
		 * httpSession.setAttribute("cart", map); }
         */
        resp.sendRedirect(req.getHeader("referer"));
    }
}
