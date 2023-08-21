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
                                    <form class="form" action="/LmhShop/admin/addCategory" method="post" id="addCategory">
                                        <h2 class="text-gray-700 fw-bolder mb-3 fs-2x mt-4">Add Category: </h2>
                                        <div class="d-flex flex-column mb-8 fv-row">
                                            <!--begin::Label-->
                                            <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                <span class="required">Category Name: </span>
                                            </label>
                                            <!--end::Label-->
                                            <input type="text" class="form-control form-control-solid" placeholder="Enter Category Name" name="categoryName" />
                                            <button type="submit" class="btn btn-primary">
                                                <span class="indicator-label">Add</span>
                                            </button>
                                        </div>
                                    </form>
                                    <br><br>
                                    <form class="form" action="/LmhShop/admin/setDiscount" method="post" id="setDiscountForm">
                                        <h2 class="text-gray-700 fw-bolder mb-3 fs-2x mt-4">Discount Setting </h2>

                                        <!--begin::Input group-->
                                        <div class="row g-9 mb-8">
                                            <!--begin::Col-->
                                            <div class="col-md-6 fv-row">
                                                <label class="required fs-6 fw-semibold mb-2">Top rate:</label>
                                                <input type="number" class="form-control form-control-solid" placeholder="Enter top rate" name="top" />

                                            </div>
                                            <!--end::Col-->
                                            <!--begin::Col-->
                                            <div class="col-md-6 fv-row">
                                                <label class="required fs-6 fw-semibold mb-2">Discount(%)</label>
                                                <!--begin::Input-->
                                                <div class="position-relative d-flex align-items-center">
                                                    <!--begin::Icon-->
                                                    <i class="ki-duotone ki-calendar-8 fs-2 position-absolute mx-4">
                                                    </i>
                                                    <!--end::Icon-->
                                                    <!--begin::Datepicker-->
                                                    <input type="number" class="form-control form-control-solid ps-12" placeholder="Enter Discount" name="discount" />
                                                    <!--end::Datepicker-->
                                                </div>
                                                <!--end::Input-->
                                            </div>
                                            <!--end::Col-->
                                            <button type="submit" class="btn btn-primary" id="formSetDiscountButtonSubmit">
                                                <span class="indicator-label">Set Discount</span>
                                                <span class="indicator-progress">Please wait...
                                                    <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                                </span>
                                            </button>
                                            <button  type="button" class="btn btn-danger">
                                                <a href="/LmhShop/admin/clearDiscount" class="indicator-label" style="text-decoration: none;color: #fff"><span>Clear Discount</span></a>
                                            </button>
                                        </div>
                                        <!--end::Input group-->
                                    </form>
                                    <h1 class="text-gray-700 fw-bolder mb-3 fs-2x mt-4">All Product</h1>
                                    <!--begin::Products-->
                                    <div class="card card-flush">
                                        <!--begin::Card header-->
                                        <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                                            <!--begin::Card title-->
                                            <div class="card-title">
                                                <!--begin::Search-->
                                                <div class="d-flex align-items-center position-relative my-1">
                                                    <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                    <input type="text" data-kt-ecommerce-product-filter="search" class="form-control form-control-solid w-250px ps-12" placeholder="Search Product" />
                                                </div>
                                                <!--end::Search-->
                                            </div>
                                            <!--end::Card title-->
                                            <!--begin::Card toolbar-->
                                            <div class="card-toolbar flex-row-fluid justify-content-end gap-5">
                                                <div class="w-100 mw-150px">
                                                    <!--begin::Select2-->
                                                    <select class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="Status" data-kt-ecommerce-product-filter="status">
                                                        <option></option>
                                                        <option value="all">All</option>
                                                        <option value="Stocking">Stocking</option>
                                                        <option value="Out">Out of stock</option>
                                                    </select>
                                                    <!--end::Select2-->
                                                </div>
                                                <!--begin::Add product-->
                                                <a href="" data-bs-toggle="modal" data-bs-target="#kt_modal_new_target"class="btn btn-primary">Add Product</a>
                                                <!--end::Add product-->
                                            </div>
                                            <!--end::Card toolbar-->
                                        </div>
                                        <!--end::Card header-->
                                        <!--begin::Card body-->
                                        <div class="card-body pt-0">
                                            <!--begin::Table-->
                                            <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_products_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                        <th class="min-w-200px">Product</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Discount</th>
                                                        <th class="text-end min-w-70px" style="padding-right: 0px">QNT</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Price</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Rating</th>
                                                        <th class="text-end min-w-100px" style="padding-right: 0px">Status</th>
                                                        <th class="text-end min-w-70px">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="fw-semibold text-gray-600">
                                                    <c:forEach items="${list}" var="item">
                                                        <tr>
                                                            <td>
                                                                <h1 class="d-none" id="productId">${item.getProductId()}</h1>
                                                                <div class="d-flex align-items-center">
                                                                    <!--begin::Thumbnail-->
                                                                    <a href="" class="symbol symbol-50px">
                                                                        <span class="symbol-label" style="background-image:url(${item.getImage()});"></span>
                                                                    </a>
                                                                    <!--end::Thumbnail-->
                                                                    <div class="ms-5">
                                                                        <!--begin::Title-->
                                                                        <a href="" class="text-gray-600 text-hover-primary fs-6 fw-bold" data-kt-ecommerce-product-filter="product_name">${item.getProductName()}</a>
                                                                        <!--end::Title-->
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-end pe-0">
                                                                <span class="fw-bold">${item.getDiscount()}%</span>
                                                            </td>
                                                            <td class="text-end pe-0">
                                                                <span class="fw-bold ms-3">${item.getQuantity()}</span>
                                                            </td>
                                                            <td class="text-end pe-0">${item.getPrice()}</td>
                                                            <td class="text-end pe-0" data-order="rating-${item.getAvgRate()}">
                                                                <!--begin::Rating-->
                                                                <div class="rating justify-content-end">
                                                                    <c:set var="rate" value="${item.getAvgRate()}"></c:set>
                                                                    <c:forEach begin="1" end="5" step="1" var="starAt">
                                                                        <c:choose>
                                                                            <c:when test="${starAt <= rate}">
                                                                                <div class="rating-label checked">
                                                                                    <i class="ki-duotone ki-star fs-6"></i>
                                                                                </div>
                                                                            </c:when>
                                                                            <c:otherwise>	
                                                                                <div class="rating-label">							
                                                                                    <i class="ki-duotone ki-star fs-6"></i>
                                                                                </div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </div>
                                                                <!--end::Rating-->
                                                            </td>
                                                            <td class="text-end pe-0" data-order="${item.getQuantity() > 0? "Stocking":"OutOfStock"}">
                                                                <!--begin::Badges-->
                                                                <c:choose>
                                                                    <c:when test="${item.getQuantity() > 0}">
                                                                        <div class="badge badge-light-primary">Stocking</div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="badge badge-light-danger">Out of Stock</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <!--end::Badges-->
                                                            </td>
                                                            <td class="text-end">
                                                                <a href="#" class="btn btn-sm btn-light btn-flex btn-center btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                                                                    <i class="ki-duotone ki-down fs-5 ms-1"></i></a>
                                                                <!--begin::Menu-->
                                                                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
                                                                    <!--begin::Menu item-->
                                                                    <div class="menu-item px-3">
                                                                        <a href="/LmhShop/admin/editProduct?id=${item.getProductId()}" class="menu-link px-3">Edit</a>
                                                                    </div>
                                                                    <!--end::Menu item-->
                                                                    <!--begin::Menu item-->
                                                                    <div class="menu-item px-3">
                                                                        <a href="#" class="menu-link px-3" data-kt-ecommerce-product-filter="delete_row">Delete</a>
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
                        <!--begin::Modal - New Target-->
                        <div class="modal fade" id="kt_modal_new_target" tabindex="-1" aria-hidden="true">
                            <!--begin::Modal dialog-->
                            <div class="modal-dialog modal-dialog-centered mw-650px">
                                <!--begin::Modal content-->
                                <div class="modal-content rounded">
                                    <!--begin::Modal header-->
                                    <div class="modal-header pb-0 border-0 justify-content-end">
                                        <!--begin::Close-->
                                        <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                                            <i class="ki-duotone ki-cross fs-1">
                                                <span class="path1"></span>
                                                <span class="path2"></span>
                                            </i>
                                        </div>
                                        <!--end::Close-->
                                    </div>
                                    <!--begin::Modal header-->
                                    <!--begin::Modal body-->
                                    <div class="modal-body scroll-y px-10 px-lg-15 pt-0 pb-15">
                                        <!--begin:Form-->
                                        <form enctype="multipart/form-data" id="kt_modal_new_target_form" class="form" action="/LmhShop/admin/addProduct" method="post">
                                            <!--begin::Heading-->
                                            <div class="mb-13 text-center">
                                                <!--begin::Title-->
                                                <h1 class="mb-3">Add Product</h1>
                                                <!--end::Title-->
                                            </div>
                                            <!--end::Heading-->
                                            <div class="d-flex flex-column mb-8 fv-row">
                                                <!--begin::Label-->
                                                <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                    <span class="required">Image</span>
                                                </label>
                                                <!--end::Label-->
                                                <div class="text-center pt-0">
                                                    <!--begin::Image input-->
                                                    <!--begin::Image input placeholder-->
                                                    <style>.image-input-placeholder {
                                                            background-image: url('assets/media/svg/files/blank-image.svg');
                                                        }
                                                        [data-bs-theme="dark"] .image-input-placeholder {
                                                            background-image: url('assets/media/svg/files/blank-image-dark.svg');
                                                        }</style>
                                                    <!--end::Image input placeholder-->
                                                    <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true">
                                                        <!--begin::Preview existing avatar-->
                                                        <div class="image-input-wrapper w-150px h-150px"></div>
                                                        <!--end::Preview existing avatar-->
                                                        <!--begin::Label-->
                                                        <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                            <i class="ki-duotone ki-pencil fs-7">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                            <!--begin::Inputs-->
                                                            <input type="file" name="image" accept=".png, .jpg, .jpeg" />
                                                            <input type="hidden" name="avatar_remove" />
                                                            <!--end::Inputs-->
                                                        </label>
                                                        <!--end::Label-->
                                                        <!--begin::Cancel-->
                                                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                                                            <i class="ki-duotone ki-cross fs-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                        </span>
                                                        <!--end::Cancel-->
                                                        <!--begin::Remove-->
                                                        <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                                                            <i class="ki-duotone ki-cross fs-2">
                                                                <span class="path1"></span>
                                                                <span class="path2"></span>
                                                            </i>
                                                        </span>
                                                        <!--end::Remove-->
                                                    </div>
                                                    <!--end::Image input-->
                                                    <!--begin::Description-->
                                                    <div class="text-muted fs-7">Set the product thumbnail image. Only *.png, *.jpg and *.jpeg image files are accepted</div>
                                                    <!--end::Description-->
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column mb-8 fv-row">
                                                <!--begin::Label-->
                                                <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                    <span class="required">Product Name</span>
                                                </label>
                                                <!--end::Label-->
                                                <input type="text" class="form-control form-control-solid" placeholder="Enter Product Name" name="productName" />
                                            </div>
                                            <!--begin::Input group-->
                                            <div class="row g-9 mb-8">
                                                <!--begin::Col-->
                                                <div class="col-md-6 fv-row">
                                                    <label class="required fs-6 fw-semibold mb-2">CateGory</label>
                                                    <select class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="Select Category" name="categoryId">
                                                        <c:forEach items="${listCate}" var="cate">
                                                            <option value="${cate.getCategoryId()}">
                                                                ${cate.getCategoryName()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <!--end::Col-->
                                                <!--begin::Col-->
                                                <div class="col-md-6 fv-row">
                                                    <label class="required fs-6 fw-semibold mb-2">Price($)</label>
                                                    <!--begin::Input-->
                                                    <div class="position-relative d-flex align-items-center">
                                                        <!--begin::Icon-->
                                                        <i class="ki-duotone ki-calendar-8 fs-2 position-absolute mx-4">
                                                        </i>
                                                        <!--end::Icon-->
                                                        <!--begin::Datepicker-->
                                                        <input type="number" class="form-control form-control-solid ps-12" placeholder="Price" name="price" />
                                                        <!--end::Datepicker-->
                                                    </div>
                                                    <!--end::Input-->
                                                </div>
                                                <!--end::Col-->
                                            </div>
                                            <!--end::Input group-->
                                            <!--begin::Input group-->
                                            <div class="d-flex flex-column mb-8 fv-row">
                                                <label class="fs-6 fw-semibold mb-2">Product Decription</label>
                                                <textarea class="form-control form-control-solid" rows="3" name="description" placeholder="Enter Description"></textarea>
                                            </div>
                                            <!--end::Input group-->
                                            <!--begin::Input group-->
                                            <!--end::Heading-->
                                            <div class="d-flex flex-column mb-8 fv-row">
                                                <!--begin::Label-->
                                                <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                    <span class="required">Discount</span>
                                                </label>
                                                <!--end::Label-->
                                                <!--begin::Slider-->
                                                <div class="d-flex flex-column text-center mb-5">
                                                    <div class="d-flex align-items-start justify-content-center mb-7">
                                                        <span class="fw-bold fs-3x" id="kt_ecommerce_add_product_discount_label">0</span>
                                                        <span class="fw-bold fs-4 mt-1 ms-2">%</span>
                                                    </div>
                                                    <div id="kt_ecommerce_add_product_discount_slider" class="noUi-sm"></div>
                                                </div>
                                                <!--end::Slider-->
                                                <input type="hidden" name="discount" id="discountInput">
                                            </div>
                                            <!--begin::Input group-->
                                            <div class="d-flex flex-column mb-8 fv-row">
                                                <!--begin::Label-->
                                                <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                    <span class="required">Quantity</span>
                                                </label>
                                                <!--end::Label-->
                                                <input type="number" class="form-control form-control-solid" placeholder="Enter Quantity" name="quantity" />
                                            </div>
                                            <!--end::Input group-->
                                            <!--begin::Actions-->
                                            <div class="text-center">
                                                <button data-bs-dismiss="modal" type="reset" id="kt_modal_new_target_cancel" class="btn btn-light me-3">Cancel</button>
                                                <button type="submit" id="kt_modal_new_target_submit" class="btn btn-primary">
                                                    <span class="indicator-label">Submit</span>
                                                    <span class="indicator-progress">Please wait...
                                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                                </button>
                                            </div>
                                            <!--end::Actions-->
                                        </form>
                                        <!--end:Form-->
                                    </div>
                                    <!--end::Modal body-->
                                </div>
                                <!--end::Modal content-->
                            </div>
                            <!--end::Modal dialog-->
                        </div>
                        <!--end::Modal - New Target-->
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
        <script src="<%= rootPath%>/assets/plugins/custom/datatables/datatables.bundle.js"></script>
        <!--end::Vendors Javascript-->
        <!--begin::Custom Javascript(used for this page only)-->
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/apps/ecommerce/catalog/products.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>