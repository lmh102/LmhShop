/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import DAL.CommentDAL;
import DAL.ProductDAL;
import DTO.CommentDTO;
import DTO.ProductDTO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author PC
 */
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
    private boolean isNumber(String s) {
        return s.matches("\\d+");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        if (idString == null || !isNumber(idString)) {
            request.setAttribute("urlRedirect", "/LmhShop/home");
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
            request.setAttribute("urlRedirect", "/LmhShop/home");
            request.getRequestDispatcher("/Views/NotFound.jsp").forward(request, response);
        }

        request.setAttribute("product", product);
        request.setAttribute("vote", vote);
        ArrayList<CommentDTO> listComment = _comemntService.getAllCommentByProductId(id);
        if(request.getParameter("isReverse") != null && request.getParameter("isReverse").equals("true")){
            Collections.reverse(listComment);
        }
        request.setAttribute("listComment", listComment);
        if (session.getAttribute("status") != null) {
            request.setAttribute("status", (int) session.getAttribute("status"));
            if (session.getAttribute("save-comment-message") != null) {
                request.setAttribute("saveCommentMessage", (String) session.getAttribute("save-comment-message"));
            }
        }
        System.out.println(request.getAttribute("status"));
        session.removeAttribute("status");
        session.removeAttribute("save-comment-message");
        request.getRequestDispatcher("/Views/User/Product.jsp").forward(request, response);
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
        String content = request.getParameter("Comment_Content");
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
