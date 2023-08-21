/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import DAL.UserDAL;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.sql.Date;
import java.time.LocalDate;
import java.util.UUID;

/**
 *
 * @author PC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // Kích thước tệp nhỏ nhất để lưu trữ tạm thời (2MB)
                 maxFileSize = 1024 * 1024 * 10, // Kích thước tối đa của mỗi tệp (10MB)
                 maxRequestSize = 1024 * 1024 * 50) // Kích thước tối đa của yêu cầu (50MB)
public class EditProfileController extends HttpServlet {

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
            out.println("<title>Servlet EditProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        UserDAL _userService = new UserDAL();
        User userDetail = _userService.getUserById(userId);
        request.setAttribute("userDetail", userDetail);
        request.getRequestDispatcher("/Views/User/EditProfile.jsp").forward(request, response);
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
        User user = new User();
        if (request.getPart("avatar") != null || request.getPart("avatar").getSize() != 0) {
            Part file = request.getPart("avatar");
            String id = UUID.randomUUID().toString();
            String filePath = "D:\\project\\JAVA_WEB\\Assigment\\web\\assets\\avatar\\" + id + ".jpg";
            file.write(filePath);
            user.setAvartar("/LmhShop/assets/avatar/" + id + ".jpg");
        }
        String fullName = request.getParameter("fullName");
        user.setFullName(fullName);
        String phone = request.getParameter("phone");
        user.setPhone(phone);
        String address = request.getParameter("address");
        user.setAddress(address);
        Date date = Date.valueOf(request.getParameter("dob"));
        user.setDob(date);
        UserDAL _userService = new UserDAL();
        HttpSession session = request.getSession();
        user.setUserId((int)session.getAttribute("userId"));
        _userService.update(user);
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("fullName", user.getFullName());
        response.sendRedirect("/LmhShop/editProfile");
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
