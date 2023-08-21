<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String rootPath = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--begin::Head-->
    <head>
        <%@include file="/common/CssLib.jsp" %>
    </head>
    <!--end::Head-->
    <!--begin::Body-->
    <body id="kt_body" class="app-blank">
        <%@include file="/common/ThemeModeSetup.jsp" %>
        <!--begin::Root-->
        <div class="d-flex flex-column flex-root" id="kt_app_root">
            <!--begin::Authentication - Sign-in -->
            <div class="d-flex flex-column flex-lg-row flex-column-fluid">
                <%@include file="/common/Authentication/header.jsp" %>
                <!--begin::Body-->
                <div class="d-flex flex-column flex-lg-row-fluid py-10">
                    <!--begin::Content-->
                    <div class="d-flex flex-center flex-column flex-column-fluid">
                        <!--begin::Wrapper-->
                        <div class="w-lg-500px p-10 p-lg-15 mx-auto">
                            <!--begin::Form-->
                            <form class="form w-100" novalidate="novalidate" id="kt_sign_in_form" action="login" method="post">
                                <!--begin::Heading-->
                                <div class="text-center mb-10">
                                    <!--begin::Title-->
                                    <h1 class="text-dark mb-3">Sign In to visit the Shop</h1>
                                    <!--end::Title-->
                                    <!--begin::Link-->
                                    <div class="text-gray-400 fw-semibold fs-4">New Here?
                                        <a href="<%= rootPath %>/register" class="link-primary fw-bold">Create an Account</a></div>
                                    <!--end::Link-->
                                </div>
                                <!--begin::Heading-->
                                <!--begin::Input group-->
                                <div class="fv-row mb-10">
                                    <!--begin::Label-->
                                    <label class="form-label fs-6 fw-bold text-dark required">Email</label>
                                    <!--end::Label-->
                                    <!--begin::Input-->
                                    <input value="${email}" class="form-control form-control-lg form-control-solid" type="text" name="email" autocomplete="on" />
                                    <!--end::Input-->
                                </div>
                                <!--end::Input group-->
                                <!--begin::Input group-->
                                <div class="fv-row mb-10">
                                    <!--begin::Wrapper-->
                                    <div class="d-flex flex-stack mb-2">
                                        <!--begin::Label-->
                                        <label class="form-label fw-bold text-dark fs-6 mb-0 required">Password</label>
                                        <!--end::Label-->
                                        <!--begin::Link-->
                                        <!--end::Link-->
                                    </div>
                                    <!--end::Wrapper-->
                                    <!--begin::Input-->
                                    <input class="form-control form-control-lg form-control-solid" type="password" name="password" autocomplete="on" />
                                    <!--end::Input-->
                                </div>
                                <!--end::Input group-->
                                <!--begin::Actions-->
                                <div class="text-center">
                                    <!--begin::Submit button-->
                                    <button type="submit" id="kt_sign_in_submit" class="btn btn-lg btn-primary w-100 mb-5">
                                        <span class="indicator-label">Continue</span>
                                        <span class="indicator-progress">Please wait...
                                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                    </button>
                                    <!--end::Submit button-->
                                    <!--begin::Separator-->
                                    <div class="text-center text-muted text-uppercase fw-bold mb-5">or</div>
                                    <!--end::Separator-->
                                    <!--begin::Google link-->
                                    <a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100 mb-5">
                                        <img alt="Logo" src="<%= rootPath %>/assets/media/svg/brand-logos/google-icon.svg" class="h-20px me-3" />Continue with Google</a>
                                    <!--end::Google link-->
                                    <!--begin::Google link-->
                                    <a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100 mb-5">
                                        <img alt="Logo" src="<%= rootPath %>/assets/media/svg/brand-logos/facebook-4.svg" class="h-20px me-3" />Continue with Facebook</a>
                                    <!--end::Google link-->
                                    <!--begin::Google link-->
                                    <a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100">
                                        <img alt="Logo" src="<%= rootPath %>/assets/media/svg/brand-logos/apple-black.svg" class="theme-light-show h-20px me-3" />
                                        <img alt="Logo" src="<%= rootPath %>/assets/media/svg/brand-logos/apple-black-dark.svg" class="theme-dark-show h-20px me-3" />Continue with Apple</a>
                                    <!--end::Google link-->
                                </div>
                                <!--end::Actions-->
                            </form>
                            <!--end::Form-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Content-->
                    <%@include file="/common/Authentication/footer.jsp" %>
                </div>
                <!--end::Body-->
            </div>
            <!--end::Authentication - Sign-in-->
        </div>
        <!--end::Root-->
        <!--begin::Javascript-->
        <%@include file="/common/JavascriptLib.jsp" %>
        <c:if test="${not empty message}">
            <script>
                Swal.fire({
                    text: "${message}",
                    title: '<strong>Login fail!</strong>',
                    icon: "error",
                    buttonsStyling: false,
                    confirmButtonText: "Ok, got it!",
                    customClass: {
                        confirmButton: "btn btn-primary"
                    }
                });
            </script>
        </c:if>
        <!--begin::Custom Javascript(used for this page only)-->
        <script src="<%= rootPath %>/assets/js/custom/authentication/sign-in/general.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->
    </body>
    <!--end::Body-->
</html>