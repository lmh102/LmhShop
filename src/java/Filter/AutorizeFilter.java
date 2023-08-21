/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Filter;

import Model.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class AutorizeFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo Filter (có thể thực hiện các tác vụ cần thiết ở đây)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        if (httpRequest.getRequestURL().toString().contains("login") || httpRequest.getRequestURL().toString().contains("register") || httpRequest.getRequestURL().toString().contains("assets")) {
            chain.doFilter(request, response);
            return;
        }
        // Kiểm tra xác thực ở đây (ví dụ: kiểm tra user đã đăng nhập hay chưa)
        boolean isAuthenticated = checkAuthentication(httpRequest);

        if (isAuthenticated) {
            // Kiểm tra quyền (ví dụ: kiểm tra user có quyền truy cập vào nguồn tài nguyên hay không)
            boolean hasAuthorization = checkAuthorization(httpRequest);
            HttpSession session = httpRequest.getSession();
            String role = (String) session.getAttribute("role");
            if (hasAuthorization) {
                User user = new User();
                user.setUserId((int) session.getAttribute("userId"));
                user.setFullName((String) session.getAttribute("fullName"));
                user.setGmail((String) session.getAttribute("email"));
                user.setAvartar((String) session.getAttribute("avatar"));
                request.setAttribute("role", role);
                request.setAttribute("user", user);
                int statusCode = httpResponse.getStatus();
                System.out.println(statusCode);
                if (statusCode == HttpServletResponse.SC_NOT_FOUND) {
                    // Chuyển hướng trang đến notfound.jsp
                    httpRequest.getRequestDispatcher("/Views/NotFound.jsp").forward(request, response);
                    return;
                }
                if (role.equalsIgnoreCase("ROLE_USER")) {
                    request.setAttribute("urlRedirect", "/LmhShop/home");
                } else {
                    request.setAttribute("urlRedirect", "/LmhShop/admin/home");
                }
                chain.doFilter(request, response);
            } else {
                // Không có quyền, chuyển hướng hoặc trả về mã lỗi
                if (role.equalsIgnoreCase("ROLE_USER")) {
                    request.setAttribute("urlRedirect", "/LmhShop/home");
                } else {
                    request.setAttribute("urlRedirect", "/LmhShop/admin/home");
                }
                httpRequest.getRequestDispatcher("/Views/NotFound.jsp").forward(request, response);
            }
        } else {
            // Không xác thực, chuyển hướng hoặc trả về mã lỗi
            httpResponse.sendRedirect("/LmhShop/login");
        }
    }

    @Override
    public void destroy() {
        // Giải phóng tài nguyên (nếu cần) khi Filter bị huỷ
    }

    private boolean checkAuthentication(HttpServletRequest request) {
        // Kiểm tra logic xác thực và trả về true nếu xác thực thành công, ngược lại false
        // Ví dụ: Kiểm tra session, cookie, token hay thông tin xác thực trong request header
        // return true or false
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null) {
            return false;
        }
        return true;
    }

    private boolean checkAuthorization(HttpServletRequest request) {
        // Kiểm tra logic phân quyền và trả về true nếu có quyền, ngược lại false
        // Ví dụ: Kiểm tra vai trò của user, quyền truy cập vào nguồn tài nguyên
        // return true or false
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (request.getRequestURL().toString().contains("admin")) {
            return role.equalsIgnoreCase("ROLE_ADMIN");
        } else {
            return role.equalsIgnoreCase("ROLE_USER");
        }
    }

}
