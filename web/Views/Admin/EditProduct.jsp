<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String rootPath = request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/common/CssLib.jsp" %>
        <link href="<%=rootPath%>/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <link href="<%=rootPath%>/assets/css/custom/user/ProductDetail.css" rel="stylesheet" type="text/css" />
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
                                <div id="DetailProduct_container" class="app-container container-xxl">
                                    <!--begin--Product Detail-->
                                    <div class="container mt-5 mb-5">
                                        <div class="card">
                                            <div class="card-body">
                                                <form enctype="multipart/form-data" id="kt_modal_new_target_form" class="form" action="/LmhShop/admin/editProduct" method="post">
                                                    <!--begin::Heading-->
                                                    <div class="mb-13 text-center">
                                                        <!--begin::Title-->
                                                        <h1 class="mb-3">Add Product</h1>
                                                        <!--end::Title-->
                                                    </div>
                                                    <input type="hidden" name="productId" value="${product.getProductId()}">
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
                                                                    background-image: url('${product.getImage()}');
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
                                                        <input value="${product.getProductName()}" type="text" class="form-control form-control-solid" placeholder="Enter Product Name" name="productName" />
                                                    </div>
                                                    <!--begin::Input group-->
                                                    <div class="row g-9 mb-8">
                                                        <!--begin::Col-->
                                                        <div class="col-md-6 fv-row">
                                                            <label class="required fs-6 fw-semibold mb-2">CateGory</label>
                                                            <select class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="Select Category" name="categoryId">
                                                                <c:forEach items="${listCate}" var="cate">
                                                                    <option value="${cate.getCategoryId()}" ${product.getCategoryId() == cate.getCategoryId()?"selected":""}>
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
                                                                <input value="${String.format("%.2f",product.getPrice())}"type="number" class="form-control form-control-solid ps-12" placeholder="Price" name="price" />
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
                                                        <textarea  class="form-control form-control-solid" rows="3" name="description" placeholder="Enter Description">${product.getDescription()}</textarea>
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
                                                        <input value="${product.getDiscount()}" type="hidden" name="discount" id="discountInput">
                                                    </div>
                                                    <!--begin::Input group-->
                                                    <div class="d-flex flex-column mb-8 fv-row">
                                                        <!--begin::Label-->
                                                        <label class="d-flex align-items-center fs-6 fw-semibold mb-2">
                                                            <span class="required">Quantity</span>
                                                        </label>
                                                        <!--end::Label-->
                                                        <input value="${product.getQuantity()}" type="number" class="form-control form-control-solid" placeholder="Enter Quantity" name="quantity" />
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Actions-->
                                                    <div class="text-center">
                                                        <button type="submit" id="kt_modal_new_target_submit" class="btn btn-primary">
                                                            <span class="indicator-label">Submit</span>
                                                            <span class="indicator-progress">Please wait...
                                                                <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                                        </button>
                                                    </div>
                                                    <!--end::Actions-->
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container d-flex flex-column gap-7 gap-lg-10">
                                        <!--begin::Reviews-->
                                        <div class="card card-flush py-4">
                                            <!--begin::Card header-->
                                            <div class="card-header">
                                                <!--begin::Card title-->
                                                <div class="card-title">
                                                    <h2>Customer Reviews</h2>
                                                </div>
                                                <!--end::Card title-->
                                                <!--begin::Card toolbar-->
                                                <div class="card-toolbar">
                                                    <!--begin::Rating label-->
                                                    <span class="fw-bold me-5">Overall Rating:</span>
                                                    <!--end::Rating label-->
                                                    <!--begin::Overall rating-->
                                                    <div class="rating">
                                                        <c:set var="rate" value="${product.getAvgRate()}"></c:set>
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
                                                    <!--end::Overall rating-->
                                                </div>
                                                <!--end::Card toolbar-->
                                            </div>
                                            <!--end::Card header-->
                                            <!--begin::Card body-->
                                            <div class="card-body pt-0">

                                                <!--begin::Input Comemnt-->
                                                <div>

                                                    <!--end::rate-->
                                                    <form action="/LmhShop/admin/save-comment" method="post" id="save-comment-form">
                                                        <!--begin::Label-->
                                                        <label class="form-label">Comment</label>
                                                        <!--end::Label-->
                                                        <!--begin::Editor-->
                                                        <input type="hidden" name="Comment_Content" id="Comment_Content">
                                                        <input type="hidden" name = "productId" value="${product.getProductId()}">
                                                        <input type="hidden" name = "userId" value="${user.getUserId()}">
                                                        <div id="kt_ecommerce_add_comment" name="kt_ecommerce_add_comment" class="min-h-200px mb-2"></div>
                                                        <!--end::Editor-->
                                                        <!--begin::Description-->
                                                        <div class="text-muted fs-7">Leave a comment to let others know what you think.</div>
                                                        <!--end::Description-->
                                                        <button id="kt_ecommerce_save_comment_submit" type="button" class="btn btn-primary">Save</button>
                                                    </form>
                                                </div>
                                                <!--end::Input Comemnt-->
                                                <!--begin::FilterComment-->
                                                <div class="text-end">
                                                    <a href="#" class="btn btn-light btn-active-light-primary btn-flex btn-center btn-sm" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Filter
                                                        <i class="ki-duotone ki-down fs-5 ms-1"></i></a>
                                                    <!--begin::Menu-->
                                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true" style="">
                                                        <!--begin::Menu item-->
                                                        <div class="menu-item px-3">
                                                            <a href="/LmhShop/product?id=${product.getProductId()}&isReverse=true" class="menu-link px-3">Latest</a>
                                                        </div>
                                                        <!--end::Menu item-->
                                                        <!--begin::Menu item-->
                                                        <div class="menu-item px-3">
                                                            <a href="/LmhShop/product?id=${product.getProductId()}&isReverse=false" class="menu-link px-3" data-kt-users-table-filter="delete_row">Oldest</a>
                                                        </div>
                                                        <!--end::Menu item-->
                                                    </div>
                                                    <!--end::Menu-->
                                                </div>
                                                <!--end::FilterComment-->
                                                <!--begin::Table-->
                                                <table class="table table-row-dashed fs-6 gy-5 my-0" id="table_comment">
                                                    <thead>
                                                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                            <th class="min-w-125px">Rating</th>
                                                            <th class="min-w-175px">Customer</th>
                                                            <th class="min-w-175px">Comment</th>
                                                            <th class="min-w-100px fs-7">Date</th>
                                                            <th class="min-w-100px text-end fs-7">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listComment}" var="comment">
                                                            <tr>
                                                                <td data-order="rating-${comment.getRate()}">
                                                                    <!--begin::Rating-->
                                                                    <div class="rating">
                                                                        <c:set var="rate" value="${comment.getRate()}"></c:set>
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
                                                                <td>
                                                                    <a href="/LmhShop/viewProfile?id=${comment.getUser().getUserId()}" class="d-flex text-dark text-gray-800 text-hover-primary">
                                                                        <!--begin::Avatar-->
                                                                        <div class="symbol symbol-circle symbol-25px me-3">
                                                                            <span class="symbol-label" style="background-image:url(${comment.getUser().getAvatar() == null ? "/LmhShop/assets/avatar/default-avatar.png" :comment.getUser().getAvatar()}"></span>
                                                                        </div>
                                                                        <!--end::Avatar-->
                                                                        <!--begin::Name-->
                                                                        <span class="fw-bold">${comment.getUser().getFullName()}</span>
                                                                        <!--end::Name-->
                                                                    </a>
                                                                </td>
                                                                <td class="text-gray-600 fw-bold">
                                                                    ${comment.getContent()}<br>
                                                                    <div class="container container-fluid row">
                                                                        <c:forEach items="${comment.getImage()}" var="image">
                                                                            <img class="col-md-6" src="${image}" width="100px">
                                                                        </c:forEach>
                                                                    </div>
                                                                </td>
                                                                <td class="">
                                                                    <span class="fw-semibold text-muted">${comment.getCreateAt()}</span>
                                                                </td>
                                                                <td class="text-end">
                                                                    <a href="" class="btn btn-sm btn-light btn-flex btn-center btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                                                                        <i class="ki-duotone ki-down fs-5 ms-1"></i></a>
                                                                    <!--begin::Menu-->
                                                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
                                                                       <!--begin::Menu item-->
                                                                        <div class="menu-item px-3">
                                                                            <a href="/LmhShop/admin/delete-comment?id=${comment.getCommentId()}&productId=${product.getProductId()}" class="menu-link px-3" data-kt-ecommerce-product-filter="delete_row">Delete</a>
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
                                        <!--end::Reviews-->
                                    </div>
                                    <!--end--Product Detail-->
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
        <c:choose>
            <c:when test="${status != null && status == 1}">
                <script>
                    Swal.fire({
                        title: "Save Comment Message",
                        text: "Save Comment successfully!",
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                </script>
            </c:when>
            <c:when test="${status != null && status == 0}">
                <script>
                    Swal.fire({
                        text: "${saveCommentMessage}",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                </script>
            </c:when>
        </c:choose>
        <!--begin::Vendors Javascript(used for this page only)-->
        <script src="<%= rootPath%>/assets/plugins/custom/datatables/datatables.bundle.js"></script>
        <script src="<%= rootPath%>/assets/plugins/custom/formrepeater/formrepeater.bundle.js"></script>
        <!--end::Vendors Javascript-->
        <!--begin::Custom Javascript(used for this page only)--> 
        <script src="<%=rootPath%>/assets/js/custom/apps/ecommerce/catalog/EditProducts.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/pages/product/ProductDetail.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/apps/ecommerce/catalog/save-comment.js"></script>
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>