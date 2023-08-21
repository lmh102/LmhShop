<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "Model.User" %>
<% 
    String rootPath = request.getContextPath();
    int rate = 5;
%>
<%!
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/common/CssLib.jsp" %>
        <link href="<%=rootPath%>/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <link href="<%=rootPath%>/assets/css/custom/user/CustomStyleHome.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="kt_app_body" data-kt-app-header-fixed="true" data-kt-app-header-fixed-mobile="true" data-kt-app-sidebar-enabled="true" data-kt-app-sidebar-fixed="true" data-kt-app-sidebar-push-header="true" data-kt-app-sidebar-push-toolbar="true" data-kt-app-sidebar-push-footer="true" data-kt-app-toolbar-enabled="true" class="app-default">
        <%@include file="/common/ThemeModeSetup.jsp" %>
        <!--begin::App-->
        <div class="d-flex flex-column flex-root app-root" id="kt_app_root" style="background-color: #f0f2f5">
            <!--begin::Page-->
            <div class="app-page flex-column flex-column-fluid" id="kt_app_page">
                <!--begin::Header-->
                <%@include file="/common/User/header.jsp" %>
                <!--end::Header-->
                <!--begin::Wrapper-->
                <div class="app-wrapper flex-column flex-row-fluid" id="kt_app_wrapper">
                    <!--begin::Sidebar-->
                    <%@include file="/common/User/SideBar.jsp" %>
                    <!--end::Sidebar-->
                    <!--begin::Main-->
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <!--begin::Content wrapper-->
                        <div class="d-flex flex-column flex-column-fluid">
                            <!--Main viết ở đây-->

                            <!--begin::Content-->
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <!--begin::Content container-->
                                <div class="container"> 
                                    <div class="card mb-5 mb-xl-10">
                                        <!--begin::Card header-->
                                        <div class="card-header border-0 cursor-pointer" role="button" data-bs-toggle="collapse" data-bs-target="#kt_account_profile_details" aria-expanded="true" aria-controls="kt_account_profile_details">
                                            <!--begin::Card title-->
                                            <div class="card-title m-0">
                                                <h3 class="fw-bold m-0">Edit Profile</h3>
                                            </div>
                                            <!--end::Card title-->
                                        </div>
                                        <!--begin::Card header-->
                                        <!--begin::Content-->
                                        <div id="kt_account_settings_profile_details" class="collapse show">
                                            <!--begin::Form-->
                                            <form action="editProfile" method="POST"  enctype="multipart/form-data" id="kt_account_profile_details_form" class="form fv-plugins-bootstrap5 fv-plugins-framework" novalidate="novalidate">
                                                <!--begin::Card body-->
                                                <div class="card-body border-top p-9" data-select2-id="select2-data-132-edjm">
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Avatar</label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8">
                                                            <!--begin::Image input-->
                                                            <div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('/LmhShop/assets/media/svg/avatars/blank.svg')">
                                                                <!--begin::Preview existing avatar-->
                                                                <div class="image-input-wrapper w-125px h-125px" style="background-image: url(${userDetail.getAvatar() == null ? "/LmhShop/assets/avatar/default-avatar.png":userDetail.getAvatar()}"></div>
                                                                <!--end::Preview existing avatar-->
                                                                <!--begin::Label-->
                                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" aria-label="Change avatar" data-bs-original-title="Change avatar" data-kt-initialized="1">
                                                                    <i class="ki-duotone ki-pencil fs-7">
                                                                        <span class="path1"></span>
                                                                        <span class="path2"></span>
                                                                    </i>
                                                                    <!--begin::Inputs-->
                                                                    <input type="file" name="avatar" accept=".png, .jpg, .jpeg" >
                                                                    <!--end::Inputs-->
                                                                </label>
                                                                <!--end::Label-->
                                                                <!--begin::Cancel-->
                                                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" aria-label="Cancel avatar" data-bs-original-title="Cancel avatar" data-kt-initialized="1">
                                                                    <i class="ki-duotone ki-cross fs-2">
                                                                        <span class="path1"></span>
                                                                        <span class="path2"></span>
                                                                    </i>
                                                                </span>
                                                                <!--end::Cancel-->
                                                                <!--begin::Remove-->
                                                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" aria-label="Remove avatar" data-bs-original-title="Remove avatar" data-kt-initialized="1">
                                                                    <i class="ki-duotone ki-cross fs-2">
                                                                        <span class="path1"></span>
                                                                        <span class="path2"></span>
                                                                    </i>
                                                                </span>
                                                                <!--end::Remove-->
                                                            </div>
                                                            <!--end::Image input-->
                                                            <!--begin::Hint-->
                                                            <div class="form-text">Allowed file types: png, jpg, jpeg.</div>
                                                            <!--end::Hint-->
                                                        </div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Full Name</label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8">
                                                            <!--begin::Row-->
                                                            <div class="row">
                                                                <!--begin::Col-->
                                                                <div class="col-lg-12 fv-row fv-plugins-icon-container">
                                                                    <input value="${userDetail.getFullName()}" type="text" name="fullName" class="form-control form-control-lg form-control-solid mb-3 mb-lg-0" placeholder="Full name">
                                                                    <div class="fv-plugins-message-container invalid-feedback"></div></div>
                                                                <!--end::Col-->
                                                            </div>
                                                            <!--end::Row-->
                                                        </div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Email</label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8 fv-row fv-plugins-icon-container">
                                                            <input type="text" name="email" class="form-control form-control-lg form-control-solid" placeholder="Email" value="${userDetail.getEmail()}" disabled>
                                                            <div class="fv-plugins-message-container invalid-feedback"></div></div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">
                                                            <span class="required">Contact Phone</span>
                                                            <span class="ms-1" data-bs-toggle="tooltip" aria-label="Phone number must be active" data-bs-original-title="Phone number must be active" data-kt-initialized="1">
                                                                <i class="ki-duotone ki-information-5 text-gray-500 fs-6">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                    <span class="path3"></span>
                                                                </i>
                                                            </span>
                                                        </label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8 fv-row fv-plugins-icon-container">
                                                            <input type="tel" name="phone" class="form-control form-control-lg form-control-solid" placeholder="Phone number" value="${userDetail.getPhone()}">
                                                            <div class="fv-plugins-message-container invalid-feedback"></div></div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label fw-semibold fs-6">Address</label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8 fv-row">
                                                            <input type="text" name="address" class="form-control form-control-lg form-control-solid" placeholder="Address" value="${userDetail.getAddress()}">
                                                        </div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--begin::Input group-->
                                                    <div class="row mb-6">
                                                        <!--begin::Label-->
                                                        <label class="col-lg-4 col-form-label required fw-semibold fs-6">Date Of birth</label>
                                                        <!--end::Label-->
                                                        <!--begin::Col-->
                                                        <div class="col-lg-8 fv-row">
                                                            <input type="date" name="dob" class="form-control form-control-lg form-control-solid" placeholder="Date of birth" value="${userDetail.getDob()}">
                                                        </div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                </div>
                                                <!--end::Card body-->
                                                <!--begin::Actions-->
                                                <div class="card-footer d-flex justify-content-end py-6 px-9">
                                                    <button type="submit" class="btn btn-primary" id="kt_account_profile_details_submit">Save Changes</button>
                                                </div>
                                                <!--end::Actions-->
                                                <input type="hidden"></form>
                                            <!--end::Form-->
                                        </div>
                                        <!--end::Content-->
                                    </div>
                                </div>
                                <!--end::Content container-->
                            </div>
                            <!--end::Content-->
                        </div>
                        <!--end::Content wrapper-->
                        <!--begin::Footer-->
                        <%@include file="/common/User/footer.jsp" %>
                        <!--end::Footer-->
                    </div>
                    <!--end::Main-->
                </div>
                <!--end::Wrapper-->
            </div>
            <!--end::Page-->
        </div>
        <!--end::App-->		
        <!--begin::Javascript-->

        <%@include file="/common/JavascriptLib.jsp" %>
        <!--begin::Vendors Javascript(used for this page only)-->
        <script src="<%= rootPath%>/assets/plugins/custom/datatables/datatables.bundle.js"></script>
        <!--end::Vendors Javascript-->
        <!--begin::Custom Javascript(used for this page only)-->
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <script src="/LmhShop/assets/js/custom/pages/user-profile/editProfile.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>