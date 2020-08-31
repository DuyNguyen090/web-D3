<%-- 
    Document   : productSeachByCategory
    Created on : Jun 10, 2020, 12:51:41 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dành cho ${sex}</title>
    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Sản Phẩm</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span>
                </h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="${pageContext.request.contextPath }/trang-chủ">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath }/product/list">Sản Phẩm</a></li>
                    <li class="active">List Product</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->
        <!--=== Content Part ===-->
        <div class="content container">
            <div class="row">
                <%@ include file="/views/web/seach.jsp" %>

                <div class="col-md-9">
                    <div class="row margin-bottom-5">
                        <div class="col-sm-4 result-category">

                        </div>
                        <div class="col-sm-8">
                            <ul class="list-inline clear-both">
                                <li class="grid-list-icons"><a
                                        href="${pageContext.request.contextPath }/product/category?${cate}=${keyword}"><i class="fa fa-th-list"></i></a>
                                    <a href="${pageContext.request.contextPath }/product/category-grid?${cate}=${keyword}"><i class="fa fa-th"></i></a>
                                </li>
<!--                                <li class="sort-list-btn">
                                    <h3>Sort By :</h3>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown">
                                            Popularity <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">All</a></li>
                                            <li><a href="#">Best Sales</a></li>
                                            <li><a href="#">Top Last Week Sales</a></li>
                                            <li><a href="#">New Arrived</a></li>
                                        </ul>
                                    </div>
                                </li>-->
                            </ul>
                        </div>
                    </div>
                    <!--/end result category-->
                    <c:forEach items="${productSeachByCategory }" var="p" >

                        <div class="filter-results">

                            <div
                                class="list-product-description product-description-brd margin-bottom-30">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <c:url value="/Images/${p.image }" var="imgUrl"></c:url>
                                        <a href="${pageContext.request.contextPath }/product/detail?id=${p.id}"><img
                                                class="img-responsive sm-margin-bottom-20"
                                                src="${imgUrl}" alt=""></a>
                                    </div>
                                    <div class="col-sm-8 product-description">


                                        <div class="overflow-h margin-bottom-5">
                                            <ul class="list-inline overflow-h">
                                                <li><h4 class="title-price">
                                                        <a href="${pageContext.request.contextPath }/product/detail?id=${p.id}">${p.name }</a>

                                                    </h4></li>

                                            </ul>
                                            <p><span class="gender">${p.category.name }</span></p>
                                            <p class="margin-bottom-20">Dành cho: ${p.category.sex }</p>
                                            <div class="margin-bottom-10">
                                                <span class="title-price margin-right-10">${p.price }.0 <u>đ</u></span> <span
                                                    class="title-price line-through">${p.price *1.25 } <u>đ</u></span>

                                            </div>


                                            <ul class="list-inline add-to-wishlist margin-bottom-20">

                                            </ul>
                                            <a href="${pageContext.request.contextPath }/cart/add?pId=${p.id}&&quantity=1" ><button type="button" class="btn-u btn-u-sea-shop">Thêm Vào Giỏ Hàng</button></a>
                                        </div>



                                    </div>								
                                </div>

                            </div>

                        </div>
                    </c:forEach>
                    <!--/end filter resilts-->

                    <div class="text-center">
                        <ul class="pagination pagination-v2">
                            <c:forEach var="np" begin="1" end="${num_page}">
                                <li <c:choose><c:when test="${np == index}">class="active"</c:when></c:choose>><a href="<c:url value='/product/list'/>?page=${np}">${np}</a></li>
                                </c:forEach>
                        </ul>
                        <!--/end pagination-->
                    </div>
                </div>
                <!--/end row-->
            </div>
            <!--/end container-->
            <!--=== End Content Part ===-->


    </body>
</html>
