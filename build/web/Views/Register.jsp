
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
            <!--begin::Authentication - Sign-up -->
            <div class="d-flex flex-column flex-lg-row flex-column-fluid">
                <%@include file="/common/Authentication/header.jsp" %>
                <!--begin::Body-->
                <div class="d-flex flex-column flex-lg-row-fluid py-10">
                    <!--begin::Content-->
                    <div class="d-flex flex-center flex-column flex-column-fluid">
                        <!--begin::Wrapper-->
                        <div class="w-lg-600px p-10 p-lg-15 mx-auto">
                            <!--begin::Form-->
                            <form class="form w-100" novalidate="novalidate" id="kt_sign_up_form" action="register" method="post">
                                <!--begin::Heading-->
                                <div class="mb-10 text-center">
                                    <!--begin::Title-->
                                    <h1 class="text-dark mb-3">Create an Account</h1>
                                    <!--end::Title-->
                                    <!--begin::Link-->
                                    <div class="text-gray-400 fw-semibold fs-4">Already have an account?
                                        <a href="login" class="link-primary fw-bold">Sign in here</a></div>
                                    <!--end::Link-->
                                </div>
                                <!--end::Heading-->
                                <!--begin::Action-->
                                <button type="button" class="btn btn-light-primary fw-bold w-100 mb-10">
                                    <img alt="Logo" src="<%= rootPath %>/assets/media/svg/brand-logos/google-icon.svg" class="h-20px me-3" />Sign in with Google</button>
                                <!--end::Action-->
                                <!--begin::Separator-->
                                <div class="d-flex align-items-center mb-10">
                                    <div class="border-bottom border-gray-300 mw-50 w-100"></div>
                                    <span class="fw-semibold text-gray-400 fs-7 mx-2">OR</span>
                                    <div class="border-bottom border-gray-300 mw-50 w-100"></div>
                                </div>
                                <!--end::Separator-->
                                <!--begin::Input group-->
                                <div class="row fv-row mb-7">
                                    <!--begin::Col-->
                                    <div class="col-xl-12">
                                        <label class="form-label fw-bold text-dark fs-6 required">Full Name</label>
                                        <input value = "${fullName}"class="form-control form-control-lg form-control-solid" type="text" placeholder="" name="fullName" autocomplete="on" />
                                    </div>
                                    <!--end::Col-->
                                </div>
                                <!--end::Input group-->
                                <!--begin::Input group-->
                                <div class="fv-row mb-7">
                                    <label class="form-label fw-bold text-dark fs-6 required">Email</label>
                                    <input value="${email}" class="form-control form-control-lg form-control-solid" type="email" placeholder="" name="email" autocomplete="off" />
                                </div>
                                <!--end::Input group-->
                                <!--begin::Input group-->
                                <div class="mb-10 fv-row">
                                    <label class="form-label fw-bold text-dark fs-6 required">Password</label>
                                    <input class="form-control form-control-lg form-control-solid" type="password" placeholder="" name="password" autocomplete="off" />
                                </div>
                                <!--end::Input group=-->
                                <!--begin::Input group-->
                                <div class="fv-row mb-5">
                                    <label class="form-label fw-bold text-dark fs-6 required">Confirm Password</label>
                                    <input class="form-control form-control-lg form-control-solid" type="password" placeholder="" name="confirmPassword" autocomplete="off" />
                                </div>
                                <!--end::Input group-->
                                <!--begin::Input group-->
                                <div class="fv-row mb-10">
                                    <label class="form-check form-check-custom form-check-solid form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="toc" value="1" />
                                        <span class="form-check-label fw-semibold text-gray-700 fs-6">I Agree
                                            <a href="#" class="ms-1 link-primary">Terms and conditions</a>.</span>
                                    </label>
                                </div>
                                <!--end::Input group-->
                                <!--begin::Actions-->
                                <div class="text-center">
                                    <button type="button" id="kt_sign_up_submit" class="btn btn-lg btn-primary">
                                        <span class="indicator-label">Submit</span>
                                        <span class="indicator-progress">Please wait...
                                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                    </button>
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
            <!--end::Authentication - Sign-up-->
        </div>
        <!--end::Root-->
        <!--begin::Javascript-->
        <%@include file="/common/JavascriptLib.jsp" %>
    <c:if test="${not empty status and status eq false}">
        <script>
            document.querySelector("[name='email']").classList += " is-invalid";
            Swal.fire({
                text: "${message}",
                title: '<strong>RegisterFail!</strong>',
                icon: "error",
                buttonsStyling: false,
                confirmButtonText: "Ok, got it!",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });
        </script>
    </c:if>
    <c:if test="${not empty status and status eq true}">
        <script>
            Swal.fire({
                text: "Register successfully!",
                icon: "success",
                buttonsStyling: false,
                confirmButtonText: "Ok, got it!",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            }).then(function (result) {
                if (result.isConfirmed) {
                    location.href = "login";
                }
            });
        </script>
    </c:if>
    <!--begin::Custom Javascript(used for this page only)-->
    <script src="<%= rootPath %>/assets/js/custom/authentication/sign-up/general.js"></script>
    <!--end::Custom Javascript-->
    <!--end::Javascript-->
</body>
<!--end::Body-->
</html>