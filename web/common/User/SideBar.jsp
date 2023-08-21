<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--begin::Sidebar-->
<div id="kt_app_sidebar" class="app-sidebar flex-column" data-kt-drawer="true" data-kt-drawer-name="app-sidebar" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="275px" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_app_sidebar_toggle">
    <!--begin::Logo-->
    <div class="d-flex flex-stack px-4 px-lg-6 py-6 py-lg-10" id="kt_app_sidebar_logo">
        <!--begin::Logo image-->
        <a href="../dist/index.html">
            <img alt="Logo" src="<%=rootPath%>/assets/media/logos/default.svg" class="h-25px h-lg-30px">
        </a>
        <!--end::Filter-->
    </div>
    <!--end::Logo-->
    <!--begin::Sidebar nav-->
    <div class="flex-column-fluid px-4 px-lg-8 py-4 py-lg-8" id="kt_app_sidebar_nav">
        <!--begin::Nav wrapper-->
        <div id="kt_app_sidebar_nav_wrapper" class="d-flex flex-column hover-scroll-y pe-4 me-n4" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer" data-kt-scroll-wrappers="#kt_app_sidebar, #kt_app_sidebar_nav" data-kt-scroll-offset="5px" style="height: 511px;">
            <!--begin::Stats-->
            <div class="d-flex mb-8 mb-lg-20">
                <!--begin::Stat-->
                <div class="button button-custom rounded min-w-100px w-100 py-2 px-4 me-6">
                    <!--begin::Date-->
                    <span class="fs-6 text-gray-600 fw-semibold">Budget</span>
                    <!--end::Date-->
                    <!--begin::Label-->
                    <div class="fs-2 fw-bold text-success">$13,230</div>
                    <!--end::Label-->
                </div>
                <!--end::Stat-->
            </div>
            <!--end::Stats-->
            <!--begin::Links-->
            <div class="app-sidebar-nav mb-4" id="kt_app_sidebar_nav">
                <!--begin::Row-->
                <div class="links row row-cols-3" data-kt-buttons="true" data-kt-buttons-target="[data-kt-button]" data-kt-initialized="1">
                    <!--begin::Col-->
                    <div class="col mb-4">
                        <!--begin::Link-->
                        <a href="/LmhShop/home" class="btn btn-custom btn-outline btn-icon btn-flex flex-column flex-center w-lg-90px h-lg-90px w-70px h-70px border-0" data-kt-button="true">
                            <!--begin::Icon-->
                            <span class="mb-2">
                                <i class="fa-solid fa-house">
                                </i>
                            </span>
                            <!--end::Icon-->
                            <!--begin::Label-->
                            <span class="fs-7 fw-bold">Home</span>
                            <!--end::Label-->
                        </a>
                        <!--end::Link-->
                    </div>
                    <!--end::Col-->
                    <!--begin::Col-->
                    <div class="col mb-4">
                        <!--begin::Link-->
                        <a href="/LmhShop/myProfile" class="btn btn-custom btn-outline btn-icon btn-flex flex-column flex-center w-lg-90px h-lg-90px w-70px h-70px border-0" data-kt-button="true">
                            <!--begin::Icon-->
                            <span class="mb-2">
                                <i class="fa-regular fa-user"></i>
                            </span>
                            <!--end::Icon-->
                            <!--begin::Label-->
                            <span class="fs-7 fw-bold">Profile</span>
                            <!--end::Label-->
                        </a>
                        <!--end::Link-->
                    </div>
                    <!--end::Col-->
                    <!--begin::Col-->
                    <div class="col mb-4">
                        <!--begin::Link-->
                        <a href="/LmhShop/login" class="btn btn-custom btn-outline btn-icon btn-flex flex-column flex-center w-lg-90px h-lg-90px w-70px h-70px border-0" data-kt-button="true">
                            <!--begin::Icon-->
                            <span class="mb-2">
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </span>
                            <!--end::Icon-->
                            <!--begin::Label-->
                            <span class="fs-7 fw-bold">Sign out</span>
                            <!--end::Label-->
                        </a>
                        <!--end::Link-->
                    </div>
                    <!--end::Col-->
                </div>
                <!--end::Row-->
            </div>
            <!--end::Links-->
        </div>
        <!--end::Nav wrapper-->
    </div>
    <!--end::Sidebar nav-->
    <!--begin::Footer-->
    <div class="app-sidebar-footer d-flex flex-center px-4 py-4 py-lg-8" id="kt_app_sidebar_footer">
        <!--begin::User-->
        <div class="user-toolbar d-flex align-items-center rounded px-5 py-3 mb-2">
            <!--begin::User-->
            <div class="cursor-pointer symbol <br /> <b>Warning</b>: Undefined variable $userAvatarClass in <b>/Users/shuhratsaipov/www/keenthemes/products/themes/blaze/html/dist/view/layout/partials/sidebar/_footer.php</b> on line <b>6</b><br /> me-3 ms-n2">
                <c:choose>
                    <c:when test="${user.getAvatar() != null}">
                        <img alt="Logo" src="${user.getAvatar()}">
                    </c:when>
                    <c:otherwise>
                        <img alt="Logo" src="/LmhShop/assets/avatar/default-avatar.png">
                    </c:otherwise>
                </c:choose>
            </div>
            <!--end::User-->
            <!--begin:Info-->
            <div class="d-flex flex-column align-items-start flex-grow-1">
                <a href="/LmhShop/myProfile" class="user-toolbar-title fs-6 fw-bold">${user.getFullName()}</a>
            </div>
            <!--end:Info-->
            <!--begin::User menu-->
            <div>
                <button class="btn btn-icon btn-custom me-n2" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-overflow="true" data-kt-menu-attach="parent" data-kt-menu-placement="top-start">
                    <i class="ki-duotone ki-dots-square-vertical fs-2 me-n5">
                        <span class="path1"></span>
                        <span class="path2"></span>
                        <span class="path3"></span>
                        <span class="path4"></span>
                    </i>
                </button>
                <!--begin::User account menu-->
                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px" data-kt-menu="true">
                    <!--begin::Menu item-->
                    <div class="menu-item px-3">
                        <div class="menu-content d-flex align-items-center px-3">
                            <!--begin::Avatar-->
                            <div class="symbol symbol-50px me-5">
                                <c:choose>
                                    <c:when test="${user.getAvatar() != null}">
                                        <img alt="Logo" src="${user.getAvatar()}">
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="Logo" src="/LmhShop/assets/avatar/default-avatar.png">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!--end::Avatar-->
                            <!--begin::Username-->
                            <div class="d-flex flex-column">
                                <div class="fw-bold d-flex align-items-center fs-5">${user.getFullName()}
                                </div>
                                <!--end::Username-->
                            </div>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu separator-->
                        <div class="separator my-2"></div>
                        <!--end::Menu separator-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5">
                            <a href="/LmhShop/myProfile" class="menu-link px-5">My Profile</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu separator-->
                        <div class="separator my-2"></div>
                        <!--end::Menu separator-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5 my-1">
                            <a href="../dist/account/settings.html" class="menu-link px-5">Change Password</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-5">
                            <a href="/LmhShop/login" class="menu-link px-5">Sign Out</a>
                        </div>
                        <!--end::Menu item-->
                    </div>
                    <!--end::User account menu-->
                </div>
                <!--end::User menu-->
            </div>
            <!--end::User-->
        </div>
        <!--end::Footer-->
    </div>
    <!--end::Sidebar-->
</div>