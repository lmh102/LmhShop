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
                                        <div class="card-body pt-9 pb-0">
                                            <!--begin::Details-->
                                            <div class="d-flex flex-wrap flex-sm-nowrap mb-3">
                                                <!--begin: Pic-->
                                                <div class="me-7 mb-4">
                                                    <div class="symbol symbol-100px symbol-lg-160px symbol-fixed position-relative">
                                                        <img src="${userDetail.getAvatar() == null ? "/LmhShop/assets/avatar/default-avatar.png" : userDetail.getAvatar()}" alt="image">
                                                        <div class="position-absolute translate-middle bottom-0 start-100 mb-6 bg-success rounded-circle border border-4 border-body h-20px w-20px"></div>
                                                    </div>
                                                </div>
                                                <!--end::Pic-->
                                                <!--begin::Info-->
                                                <div class="flex-grow-1">
                                                    <!--begin::Title-->
                                                    <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                                                        <!--begin::User-->
                                                        <div class="d-flex flex-column">
                                                            <!--begin::Name-->
                                                            <div class="d-flex align-items-center mb-2">
                                                                <a href="#" class="text-gray-900 text-hover-primary fs-2 fw-bold me-1">${userDetail.getFullName()}</a>
                                                                <a href="#">
                                                                    <i class="ki-duotone ki-verify fs-1 text-primary">
                                                                        <span class="path1"></span>
                                                                        <span class="path2"></span>
                                                                    </i>
                                                                </a>
                                                            </div>
                                                            <!--end::Name-->
                                                            <!--begin::Info-->
                                                            <div class="d-flex flex-wrap fw-semibold fs-6 mb-4 pe-2">
                                                                <c:if test="${userDetail.getAddress()!= null}">
                                                                    <a href="#" class="d-flex align-items-center text-gray-400 text-hover-primary me-5 mb-2">
                                                                        <i class="ki-duotone ki-geolocation fs-4 me-1">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>
                                                                        ${userDetail.getAddress()}
                                                                    </a>
                                                                </c:if>
                                                                <a href="#" class="d-flex align-items-center text-gray-400 text-hover-primary mb-2">
                                                                    <i class="ki-duotone ki-sms fs-4 me-1">
                                                                        <span class="path1"></span>
                                                                        <span class="path2"></span>
                                                                    </i>
                                                                    ${userDetail.getEmail()}
                                                                </a>
                                                            </div>
                                                            <!--end::Info-->
                                                        </div>
                                                        <!--end::User-->
                                                    </div>
                                                    <!--end::Title-->
                                                </div>
                                                <!--end::Info-->
                                                <a href="/LmhShop/editProfile" class="btn btn-sm btn-primary align-self-center">Edit Profile</a>
                                            </div>
                                            <!--end::Details-->

                                            <!--begin::Card body-->
                                            <div class="card-body p-9">
                                                <!--begin::Row-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Full Name</label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8">
                                                        <span class="fw-bold fs-6 text-gray-800">${userDetail.getFullName()}</span>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Row-->
                                                <!--begin::Input group-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Email</label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8 fv-row">
                                                        <span class="fw-semibold text-gray-800 fs-6">${userDetail.getEmail()}</span>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Input group-->
                                                <!--begin::Input group-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Contact Phone
                                                        <span class="ms-1" data-bs-toggle="tooltip" aria-label="Phone number must be active" data-bs-original-title="Phone number must be active" data-kt-initialized="1">
                                                            <i class="ki-duotone ki-information fs-7">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                            </i>
                                                        </span></label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8 d-flex align-items-center">
                                                        <span class="fw-bold fs-6 text-gray-800 me-2">${userDetail.getPhone()}</span>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Input group-->
                                                <!--begin::Input group-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Address</label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8">
                                                        <a href="#" class="fw-semibold fs-6 text-gray-800 text-hover-primary">${userDetail.getAddress()}</a>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Input group-->
                                                <!--begin::Input group-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Date Of Birth
                                                        <span class="ms-1" data-bs-toggle="tooltip" aria-label="Country of origination" data-bs-original-title="Country of origination" data-kt-initialized="1">
                                                            <i class="ki-duotone ki-information fs-7">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                                <span class="path3"></span>
                                                            </i>
                                                        </span></label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8">
                                                        <span class="fw-bold fs-6 text-gray-800">${userDetail.getDob()}</span>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Input group-->
                                                <!--begin::Input group-->
                                                <div class="row mb-7">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Communication</label>
                                                    <!--end::Label-->
                                                    <!--begin::Col-->
                                                    <div class="col-lg-8">
                                                        <span class="fw-bold fs-6 text-gray-800">Email, Phone</span>
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Input group-->
                                                <!--begin::Input group-->
                                                <div class="row mb-10">
                                                    <!--begin::Label-->
                                                    <label class="col-lg-4 fw-semibold text-muted">Start participating from</label>
                                                    <!--begin::Label-->
                                                    <!--begin::Label-->
                                                    <div class="col-lg-8">
                                                        <span class="fw-semibold fs-6 text-gray-800">${userDetail.getCreateAt()}</span>
                                                    </div>
                                                    <!--begin::Label-->
                                                </div>
                                                <!--end::Input group-->
                                            </div>
                                            <!--end::Card body-->
                                            <!--begin::Navs-->

                                            <!--begin::Navs-->
                                        </div>
                                    </div>
                                    <!--end::Content container-->
                                </div>
                                <!--end::Content-->
                            </div>
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
        <script src="<%=rootPath%>/assets/js/custom/pages/user-profile/general.js"></script>
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>