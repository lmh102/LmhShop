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
                                <div id="Slide_container" class="app-container container-xxl">
                                    <!--begin::slide header-->
                                    <div id="headerCarousel" class="carousel slide" data-bs-ride="carousel">

                                        <div class="carousel-indicators">
                                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
                                        </div>
                                        <!-- Slides -->
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="<%=rootPath%>/assets/media/slide/slide1.jpg" class="d-block w-100" alt="Image 1">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=rootPath%>/assets/media/slide/slide2.jpg" class="d-block w-100" alt="Image 2">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=rootPath%>/assets/media/slide/slide3.png" class="d-block w-100" alt="Image 3">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=rootPath%>/assets/media/slide/slide4.jpg" class="d-block w-100" alt="Image 4">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=rootPath%>/assets/media/slide/slide5.jpg" class="d-block w-100" alt="Image 5">
                                                <div class="carousel-caption">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Controls -->
                                        <a class="carousel-control-prev" href="#headerCarousel" role="button" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#headerCarousel" role="button" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </a>
                                    </div>
                                    <br>
                                    <!--end::slide header-->
                                    <h1 class="text-gray-700 fw-bolder mb-3 fs-2x mt-4">Search results of keyword = "${keyword.toString()}"</h1>
                                    <form id="formSearch" action="searchProduct" method="get" class="d-flex align-items-center position-relative my-1">
                                        <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
                                            <span class="path1"></span>
                                            <span class="path2"></span>
                                        </i>
                                        <input id = "keywordSearch" name="keyword" type="text" data-kt-ecommerce-product-filter="search" class="form-control form-control-solid w-250px ps-12" placeholder="Search Product">
                                    </form>
                                    <script>
                                        var input = document.getElementById("keywordSearch");
                                        var formSearch = document.getElementById("formSearch");
                                        input.addEventListener("keydown", function (event) {
                                            if (event.keyCode === 13) {
                                                // Xử lý khi người dùng nhấn phím Enter ở đây
                                                event.preventDefault(); // Ngăn chặn hành vi mặc định của phím Enter
                                                formSearch.submit();
                                            }
                                        });
                                    </script>
                                    <br>
                                    <div class="card card-flush">
                                        <div class="card-body pt-0">
                                            <div class="container mt-4 product-container">
                                                <div id="ListProductByKeyword">
                                                    <!-- List Product -->
                                                    <div class="row g-4">
                                                        <c:forEach items="${list}" var="item">
                                                            <a class="col-md-4" href="/LmhShop/product?id=${item.getProductId()}">
                                                                <div class="card h-100 product-card d-flex flex-column">
                                                                    <img src="${item.getImage()}" class="card-img-top" alt="Product Image" />
                                                                    <div class="card-body description">
                                                                        <h5 class="card-title"> ${item.getProductName()}</h5>
                                                                        <div class="card-text">
                                                                            <p>${item.getDescription()}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="card-footer d-flex justify-content-between align-items-center">
                                                                        <div class="rating">
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
                                                                        <c:choose> 
                                                                            <c:when test="${item.getDiscount() > 0}">
                                                                                <div class="fs-2 fw-bold text-danger"><div class="fs-4">only</div> $${String.format("%.2f",item.getPrice() * (100 - item.getDiscount()) / 100)}</div>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div class="fs-2 fw-bold text-danger"><div class="fs-4"></div> $${String.format("%.2f",item.getPrice())}</div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>

                                                                    <c:choose>
                                                                        <c:when test="${item.getQuantity() > 0}">
                                                                            <span class="quantity-badge">${item.getQuantity()} items left</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="quantity-badge-empty">Out of stock</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <c:if test="${item.getDiscount() >0}">
                                                                        <span class="discount-badge">Sale <strong>${item.getDiscount()}%</strong></span>
                                                                    </c:if>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
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
        <script src="<%=rootPath%>/assets/js/custom/pages/user-profile/general.js"></script>
        <script src="<%=rootPath%>/assets/js/widgets.bundle.js"></script>
        <script src="<%=rootPath%>/assets/js/custom/widgets.js"></script>
        <!--end::Custom Javascript-->
        <!--end::Javascript-->

    </body>
</html>