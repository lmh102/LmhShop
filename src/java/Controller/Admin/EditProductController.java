/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.CategoryDAL;
import DAL.CommentDAL;
import DAL.ProductDAL;
import DTO.CommentDTO;
import DTO.ProductDTO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.Collections;
import java.util.UUID;

/**
 *
 * @author PC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // Kích thước tệp nhỏ nhất để lưu trữ tạm thời (2MB)
        maxFileSize = 1024 * 1024 * 5, // Kích thước tối đa của mỗi tệp (10MB)
        maxRequestSize = 1024 * 1024 * 10) // Kích thước tối đa của yêu cầu (50MB)
public class EditProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        if (idString == null || !idString.matches("\\d+")) {
            request.setAttribute("urlRedirect", "/LmhShop/admin/home");
            request.getRequestDispatcher("/Views/NotFound.jsp").forward(request, response);
        }
        int id = Integer.parseInt(idString);
        ProductDAL _productService = new ProductDAL();
        CommentDAL _comemntService = new CommentDAL();
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        int vote = _productService.getVote(userId, id);
        ProductDTO product = _productService.findProductById(id);
        if (product == null) {
            request.setAttribute("urlRedirect", "/LmhShop/admin/home");
            request.getRequestDispatcher("/Views/NotFound.jsp").forward(request, response);
        }

        request.setAttribute("product", product);
        request.setAttribute("vote", vote);
        ArrayList<CommentDTO> listComment = _comemntService.getAllCommentByProductId(id);
        if (request.getParameter("isReverse") != null && request.getParameter("isReverse").equals("true")) {
            Collections.reverse(listComment);
        }
        request.setAttribute("listComment", listComment);
        if (session.getAttribute("status") != null) {
            request.setAttribute("status", (int) session.getAttribute("status"));
            if (session.getAttribute("save-comment-message") != null) {
                request.setAttribute("saveCommentMessage", (String) session.getAttribute("save-comment-message"));
            }
        }
        session.removeAttribute("status");
        session.removeAttribute("save-comment-message");
        CategoryDAL _categoryService = new CategoryDAL();
        ArrayList<Category> listCate = _categoryService.findAll();
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("/Views/Admin/EditProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = 0;
        try{
        productId = Integer.parseInt(request.getParameter("productId"));
        }
        catch(Exception e) {
            request.setAttribute("redirectURL", "/Lmhshop/admin/home");
            request.getRequestDispatcher("/Views/NotFound.jsp");
        }
        ProductDAL _productService = new ProductDAL();
        Product product = new Product();
        ProductDTO p = _productService.findProductById(productId);
        product.setImage(p.getImage());
        System.out.println("size"+request.getPart("image").getSize());
        if (request.getPart("image") != null && request.getPart("image").getSize()> 50) {
            Part file = request.getPart("image");
            String id = UUID.randomUUID().toString();
            String filePath = "D:\\project\\JAVA_WEB\\Assigment\\web\\assets\\media\\product\\" + id + ".jpg";
            file.write(filePath);
            product.setImage("/LmhShop/assets/media/product/" + id + ".jpg");
        }
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        price = Double.parseDouble(String.format("%.2f", price));
        product.setProductName(productName);
        product.setProductId(productId);
        product.setDescription(description);
        product.setQuantity(quantity);
        product.setDiscount(discount);
        product.setCategoryId(categoryId);
        product.setPrice(price);
        ProductDAL _service = new ProductDAL();
        System.out.println("Lam Manh Hung");
        _service.update(product);
        response.sendRedirect("/LmhShop/admin/editProduct?id=" + productId);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
