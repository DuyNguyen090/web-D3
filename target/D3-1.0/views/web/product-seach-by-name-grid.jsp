<%-- 
    Document   : product-grid
    Created on : Jun 10, 2020, 12:54:21 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Tìm kiếm sản phẩm</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span>
                </h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="${pageContext.request.contextPath }/trang-chu">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath }/product/list">Sản phẩm</a></li>
                    <li class="active">Tìm sản phẩm</li>
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
                                        href="${pageContext.request.contextPath }/product/seach?name=${param.name}"><i class="fa fa-th-list"></i></a>
                                    <a href="${pageContext.request.contextPath }/product/seach-grid?name=${param.name}"><i class="fa fa-th"></i></a>
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

                    <div class="filter-results">
                        <div class="row illustration-v2 margin-bottom-30">	


                            <c:forEach items="${productSeachByName}" var="p" >						
                                <c:url value="/Images/${p.image}" var="imgUrl"></c:url>

                                    <div class="col-md-4">
                                        <div class="product-img product-img-brd">
                                            <a href="${pageContext.request.contextPath }/product/detail?id=${p.id}">
                                            <img  width="100%" height="250" src="${imgUrl}" alt=""></a> <a
                                            class="product-review" href="${pageContext.request.contextPath }/product/detail?id=${p.id}">Quick
                                            review</a> <a class="add-to-cart" href="${pageContext.request.contextPath }/cart/add?pId=${p.id}&&quantity=1"><i
                                                class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</a>
                                      
                                    </div>
                                    <div
                                        class="product-description product-description-brd margin-bottom-30">
                                        <div class="overflow-h margin-bottom-5">
                                            <div class="pull-left">
                                                <h4 class="title-price">
                                                    <a href="${pageContext.request.contextPath }/product/detail?id=${p.id}"title="${p.name}">${fn:substring(p.name,0,35)}...</a>
                                                </h4>
                                              <span class="gender">Dành cho: ${p.category.sex}</span> <span
                                                    class="gender">Thương hiệu: ${p.category.name}</span>
                                            </div>

                                        </div>
                                        <div class="product-price">
                                            <span class="title-price">${p.price }.0 <u>đ</u></span> <span
                                                class="title-price line-through">${p.price *1.25 } <u>đ</u></span>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>

                        </div>
                    </div>
                    <!--/end filter resilts-->

                    <div class="text-center">
                        <ul class="pagination pagination-v2">
                            <c:forEach var="np" begin="1" end="${num_page}">
                                <li <c:choose><c:when test="${np == index}">class="active"</c:when></c:choose>><a href="<c:url value='/product/list-grid'/>?page=${np}">${np}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <!--/end pagination-->
                </div>
            </div>
            <!--/end row-->
        </div>
        <!--/end container-->
        <!--=== End Content Part ===-->


    </div>

</body>
</html>
