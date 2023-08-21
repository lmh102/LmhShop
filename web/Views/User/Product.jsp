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
                                <div id="DetailProduct_container" class="app-container container-xxl">
                                    <!--begin--Product Detail-->
                                    <div class="container mt-5 mb-5">
                                        <div class="card">
                                            <div class="row g-0">
                                                <div class="col-md-6 border-end">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <div class="main_image"> <img src="${product.getImage()}" id="main_product_image" width="350">
                                                        </div>
                                                        <div class="thumbnail_images">
                                                            <ul id="thumbnail">
                                                                <li><img onclick="changeImage(this)" src="${product.getImage()}" width="70"></li>
                                                                    <c:forEach items="${product.getImageDetail()}" var="image">
                                                                    <li><img onclick="changeImage(this)" src="${image}" width="70"></li>
                                                                    </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="p-3 right-side">
                                                        <div class="d-flex justify-content-between align-items-center pt-4">
                                                            <h1>${product.getProductName()}</h1> <span class="heart"><i class='bx bx-heart'></i></span>
                                                        </div>
                                                        <div class="d-flex" style="justify-content:  flex-start">
                                                            <div class="rating justify-content-begin" style="padding: 0 5px">
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
                                                            |<span style="opacity: 0.8; padding: 0 5px">${product.getCountRate()} Voted</span>|
                                                            <c:choose>
                                                                <c:when test="${product.getQuantity() > 0}">
                                                                    <span class="quantity-badge">${product.getQuantity()} items left</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="quantity-badge-empty">Out of stock</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="mt-2 pr-3 content">
                                                            <p style="padding: 0 5px">${product.getDescription()}</p>
                                                        </div>
                                                        <div class="d-flex mb-3">
                                                            <c:choose>
                                                                <c:when test="${product.getDiscount() >0}">
                                                                    <div class="fs-1 fw-bold" style="text-decoration: line-through;margin: 0 6px;opacity: 0.5"> $${String.format("%.2f",product.getPrice())}</div>
                                                                    <div class="fs-1 fw-bold text-danger"> $${String.format("%.2f",product.getPrice() * (100 - product.getDiscount()) / 100)}</div>
                                                                    <span class="discount-badge">Sale <strong>${product.getDiscount()}%</strong></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="fs-1 fw-bold text-danger" style="margin: 0 6px"> $${product.getPrice()}</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <div class="buttons d-flex flex-row mt-5 gap-3 button-custom">
                                                        <button class="btn button-buy-now" style="background-color: #f0f2f5; ">Buy Now</button>
                                                        <button class="btn btn-danger"><i class="fa-solid fa-cart-shopping"></i>Add to Basket</button> 
                                                    </div>
                                                </div>

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
                                                    <c:if test="${vote == 0}">
                                                        <div style="display: flex;justify-content: flex-end"> 
                                                            <label class="form-label">You Vote: </label>
                                                            <form action="save-vote" method="POST" id="form-save-vote">
                                                                <input type="hidden" name="vote" id="myVote">
                                                                <input type="hidden" name="productId" value="${product.getProductId()}">
                                                            </form>
                                                            <!--begin::rate-->
                                                            <div class="rating">
                                                                <c:set var="rate" value="${vote}"></c:set>
                                                                <c:forEach begin="1" end="5" step="1" var="starAt">
                                                                    <c:choose>
                                                                        <c:when test="${starAt <= rate}">
                                                                            <div class="rating-label checked ratingform">
                                                                                <i class="ki-duotone ki-star fs-6 ratingform"></i>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:otherwise>	
                                                                            <div class="rating-label ratingform">							
                                                                                <i class="ki-duotone ki-star fs-6 ratingform"></i>
                                                                            </div>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </div>
                                                        </div>


                                                    </c:if>

                                                    <script>
                                                        // Lấy danh sách các label và star elements
                                                        const labels = document.querySelectorAll('.rating-label.ratingform');
                                                        const stars = document.querySelectorAll('.ki-duotone.ki-star.ratingform');

                                                        // Thêm sự kiện hover cho mỗi label
                                                        labels.forEach((label, index) => {
                                                            label.addEventListener('mouseenter', () => {
                                                                // Làm sáng các sao từ 0 đến index
                                                                for (let i = 0; i <= index; i++) {
                                                                    labels[i].classList.add('checked');
                                                                }
                                                                document.getElementById("myVote").value = index + 1;
                                                            });
                                                            label.addEventListener("click", () => {
                                                                document.getElementById("form-save-vote").submit();
                                                            });
                                                            label.addEventListener('mouseleave', () => {
                                                                // Loại bỏ sự sáng khỏi tất cả các sao
                                                                labels.forEach(label => {
                                                                    label.classList.remove('checked');
                                                                });
                                                            });
                                                        });
                                                    </script>
                                                    <!--end::rate-->
                                                    <form action="save-comment" method="post" id="save-comment-form">
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
                                                            <th class="min-w-100px  fs-7">Date</th>
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
                                                                            <a href="/LmhShop/viewProfile?id=${comment.getUserId()}" class="fw-semibold text-muted">View Profile</a>
                                                                        </div>
                                                                        <!--end::Menu item-->
                                                                    </div>
                                                                    <c:if test="${comment.getUserId() == user.getUserId()}">
                                                                        <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">

                                                                            <div class="menu-item px-3">      
                                                                                <a href="/LmhShop/deleteComment?id=${comment.getCommentId()}&productId=${product.getProductId()}" class="fw-semibold text-muted">Delete</a>
                                                                            </div>
                                                                            <!--end::Menu item-->
                                                                        </div>
                                                                    </c:if>
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
        <script src="<%=rootPath%>/assets/js/custom/pages/product/ProductDetail.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/apps/ecommerce/catalog/save-comment.js"></script>
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>

        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>