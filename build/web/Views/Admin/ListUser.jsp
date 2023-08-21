<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String rootPath = request.getContextPath();
    int rate = 5;
%>
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
                <%@include file="/common/Admin/header.jsp" %>
                <!--end::Header-->
                <!--begin::Wrapper-->
                <div class="app-wrapper flex-column flex-row-fluid" id="kt_app_wrapper">
                    <!--begin::Sidebar-->
                    <%@include file="/common/Admin/SideBar.jsp" %>
                    <!--end::Sidebar-->
                    <!--begin::Main-->
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <!--begin::Content wrapper-->
                        <div class="d-flex flex-column flex-column-fluid">
                            <!--Main viết ở đây-->

                            <!--begin::Content-->
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <!--begin::Content container-->
                                <div id="Slide_container" class="app-container container-xxl">
                                    <!--begin::Products-->
                                    <div class="card card-flush">
                                        <!--begin::Card header
                                        <h1 class="text-gray-700 fw-bolder mb-3 fs-2x mt-4">All Users</h1>
                                        <!--end::Card header-->
                                        <!--begin::Card body-->
                                        <div class="card-body pt-0">
                                            <!--begin::Table-->
                                            <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_products_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                        <th class="min-w-150px">FullName</th>
                                                        <th class="text-end min-w-150px" style="padding-right: 0px">Email</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">password</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Phone</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Create At</th>
                                                        <th class="text-end min-w-70px">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="fw-semibold text-gray-600">
                                                    <c:forEach items="${list}" var="item">
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <!--begin::Thumbnail-->
                                                                    <a href="" class="symbol symbol-50px">
                                                                        <span class="symbol-label" style="background-image:url(${item.getAvatar() != null ? item.getAvatar():"/LmhShop/assets/avatar/default-avatar.png"});"></span>
                                                                    </a>
                                                                    <!--end::Thumbnail-->
                                                                    <div class="ms-5">
                                                                        <!--begin::Title-->
                                                                        <a href="" class="text-gray-600 text-hover-primary fs-6 fw-bold" data-kt-ecommerce-product-filter="product_name">${item.getFullName()}</a>
                                                                        <!--end::Title-->
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-end pe-0">
                                                                <span class="fw-bold">${item.getEmail()}</span>
                                                            </td>
                                                            <td class="text-end pe-0">
                                                                <span class="fw-bold ms-3">${item.getPassword()}</span>
                                                            </td>
                                                            <td class="text-end pe-0">
                                                                <span class="fw-bold ms-3">${item.getPhone()}</span>
                                                            </td>
                                                            <td class="text-end pe-0">${item.getCreateAt()}</td>
                                                            <td class="text-end">
                                                                <a href="#" class="btn btn-sm btn-light btn-flex btn-center btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                                                                    <i class="ki-duotone ki-down fs-5 ms-1"></i></a>
                                                                <!--begin::Menu-->
                                                                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
                                                                    <!--begin::Menu item-->
                                                                    <div class="menu-item px-3">
                                                                        <a href="/LmhShop/admin/deleteUser?id=${item.getUserId()}" class="menu-link px-3" data-kt-ecommerce-product-filter="delete_row">Delete</a>
                                                                    </div>
                                                                    <!--end::Menu item-->
                                                                </div>
                                                                <!--end::Menu-->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <!--end::Table-->
                                        </div>
                                        <!--end::Card body-->
                                    </div>
                                    <!--end::Products-->
                                </div>
                                <!--end::Content container-->
                            </div>
                            <!--end::Content-->
                        </div>
                        <!--end::Content wrapper-->
                        <!--begin::Footer-->
                        <%@include file="/common/Admin/footer.jsp" %>
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
        <!--end::Vendors Javascript-->
        <!--begin::Custom Javascript(used for this page only)-->
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/apps/ecommerce/catalog/products.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>