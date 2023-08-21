/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import DAL.CommentDAL;
import Model.Comment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author PC
 */
public class SaveCommentController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SaveCommentController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveCommentController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        String content = request.getParameter("Comment_Content");
        if (content.length() / (1024 * 1024) >= 5) {
            session.setAttribute("status", 0);
            session.setAttribute("save-comment-message", "Comments can only weigh up to 5MB");
            response.sendRedirect("/LmhShop/admin/editProduct?id=" + productId);
            return;
        }
        if (!Pattern.compile(">[^<>]+<").matcher(content).find()) {
            session.setAttribute("status", 0);
            session.setAttribute("save-comment-message", "Comments cannot be blank");
            response.sendRedirect("/LmhShop/admin/editProduct?id=" + productId);
            return;
        }
        Comment comment = new Comment();
        Pattern pattern = Pattern.compile("(?<=<img src=\"data:image/jpeg;base64,).*?(?=\">)");
        Matcher matcher = pattern.matcher(content);
        List<String> listFile = new ArrayList<>();
        while (matcher.find()) {
            System.out.println(1);
            String base64String = matcher.group();
            byte[] data = Base64.getDecoder().decode(base64String);
            try {
                UUID id = UUID.randomUUID();
                FileOutputStream outputStream = new FileOutputStream("D:\\project\\JAVA_WEB\\Assigment\\web\\assets\\media\\ImageComment\\" + id.toString() + ".jpg");
                outputStream.write(data);
                listFile.add(request.getContextPath() + "/assets/media/ImageComment/" + id.toString() + ".jpg");
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
        content = content.replaceAll("<img[^>]*>", "");
        if (content.length() > 500) {
            session.setAttribute("status", 0);
            session.setAttribute("save-comment-message", "Comment length exceeds the allowed length");
            response.sendRedirect("/LmhShop/admin/editProduct?id=" + productId);
            return;
        }
        int userId = (int) session.getAttribute("userId");
        comment.setContent(content);
        comment.setStatus(1);
        comment.setProductId(productId);
        comment.setUserId(userId);
        CommentDAL _CommentService = new CommentDAL();
        int commentId = _CommentService.saveComment(comment);
        _CommentService.saveImage(commentId, listFile);
        session.setAttribute("status", 1);
        response.sendRedirect("/LmhShop/admin/editProduct?id=" + productId);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
