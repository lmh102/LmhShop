<%-- 
    Document   : NotFound
    Created on : 15 Jul, 2023, 10:22:56 AM
    Author     : PC
--%>
<%
        String rootPath = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--begin::Head-->
    <head><base href="../../"/>
        <title>Blaze HTML Pro- Bootstrap 5 HTML Multipurpose Admin Dashboard Theme by Keenthemes</title>
        <meta charset="utf-8" />
        <meta name="description" content="Blaze admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />
        <meta name="keywords" content="Blaze theme, bootstrap, bootstrap 5, admin themes, free admin themes, bootstrap admin, bootstrap dashboard" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta property="og:locale" content="en_US" />
        <meta property="og:type" content="article" />
        <meta property="og:title" content="Blaze HTML Pro - Bootstrap 5 HTML Multipurpose Admin Dashboard Theme" />
        <meta property="og:url" content="https://keenthemes.com/products/blaze-html-pro" />
        <meta property="og:site_name" content="Keenthemes | Blaze HTML Pro" />
        <link rel="canonical" href="https://preview.keenthemes.com/blaze-html-pro" />
        <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
        <!--begin::Fonts(mandatory for all pages)-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
        <!--end::Fonts-->
        <!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
        <link href="<%=rootPath%>/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
        <link href="<%=rootPath%>/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
        <!--end::Global Stylesheets Bundle-->
        <script>// Frame-busting to prevent site from being loaded within a frame without permission (click-jacking) if (window.top != window.self) { window.top.location.replace(window.self.location.href); }</script>
    </head>
    <!--end::Head-->
    <!--begin::Body-->
    <body id="kt_body" class="app-blank">
        <!--begin::Theme mode setup on page load-->
        <script>var defaultThemeMode = "light"; var themeMode; if (document.documentElement) {
                        if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
                            themeMode = document.documentElement.getAttribute("data-bs-theme-mode");
                        } else {
                            if (localStorage.getItem("data-bs-theme") !== null) {
                                themeMode = localStorage.getItem("data-bs-theme");
                            } else {
                                themeMode = defaultThemeMode;
                            }
                        }
                        if (themeMode === "system") {
                            themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
                        }
                        document.documentElement.setAttribute("data-bs-theme", themeMode);
                    }</script>
        <!--end::Theme mode setup on page load-->
        <!--begin::Root-->
        <div class="d-flex flex-column flex-root" id="kt_app_root">
            <!--begin::Authentication - 404 Page-->
            <div class="d-flex flex-column flex-center flex-column-fluid p-10">
                <!--begin::Illustration-->
                <img src="<%=rootPath%>/assets/media/illustrations/sketchy-1/18.png" alt="" class="mw-100 mb-10 h-lg-450px" />
                <!--end::Illustration-->
                <!--begin::Message-->
                <h1 class="fw-semibold mb-10" style="color: #A3A3C7">Seems there is nothing here</h1>
                <!--end::Message-->
                <!--begin::Link-->
                <a href="${urlRedirect}" class="btn btn-primary">Return Home</a>
                <!--end::Link-->
            </div>
            <!--end::Authentication - 404 Page-->
        </div>
        <!--end::Root-->
        <!--begin::Javascript-->
        <script>var hostUrl = "assets/";</script>
        <!--begin::Global Javascript Bundle(mandatory for all pages)-->
        <script src="<%=rootPath%>/assets/plugins/global/plugins.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/scripts.bundle.js"></script>
        <!--end::Global Javascript Bundle-->
        <!--end::Javascript-->
    </body>
    <!--end::Body-->
</html>