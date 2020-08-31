<%-- 
    Document   : list-cart
    Created on : Jun 10, 2020, 3:56:31 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Thủ tục thanh toán</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span>
                </h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="${pageContext.request.contextPath }/home">Trang chủ</a></li>
                    <li class="active">Giỏ hàng</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Content Medium Part ===-->
        <div class="content-md margin-bottom-30">
            <div class="container">
                <form class="shopping-cart" action="#">
                    <div>
                        <div class="header-tags">
                            <div class="overflow-h">
                                <h2>Giỏ Hàng</h2>
                                <p>Xem lại &amp; chỉnh sửa sản phẩm của bạn</p>

                            </div>
                        </div>
                        <section>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.cart}" var="map">
                                            <tr>
                                                <c:url value="/Images/${map.value.product.image }"
                                                       var="imgUrl"></c:url>
                                                    <td style="padding-left: 5%">
                                                        <div class="product-in-table">
                                                            <img class="img-responsive" src="${imgUrl}" alt=""/>
                                                    </div>
                                                </td>
                                                <td >
                                                    <h3>${map.value.product.name }</h3>
                                                    <span>${map.value.product.des }</span>
                                                </td>
                                                <td>$ ${map.value.product.price }</td>
                                                <td>  
                                                    <a href="<c:url value='/cart/add-sub?pId=${map.value.product.id}&&quantity=${-1}'/>"> <button type='button' class="quantity-button" name='add'
                                                                                                                                                     value='-' <c:choose><c:when test="${map.value.quantity <= 1}">disabled </c:when></c:choose>>-</button></a>
                                                                                                                                                     <input type='text' class="quantity-field" name='quantity'
                                                                                                                                                            value="${map.value.quantity }" id='qty' />
                                                    <a href="<c:url value='/cart/add-sub?pId=${map.value.product.id}&&quantity=${1}'/>"> <button type='button' class="quantity-button" name='add'
                                                                                                                                                    value='+'>+</button></a>
                                                </td>
                                                <td class="shop-red">${map.value.product.price * map.value.quantity } <u>đ</u></td>
                                                <td><a
                                                        href="${pageContext.request.contextPath}/cart/remove?pId=${map.value.product.id}"><button
                                                            type="button" class="close">
                                                            <span>&times;</span><span class="sr-only">Close</span>
                                                        </button></a></td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>

                                </table>

                            </div>
                        </section>

                        <div class="coupon-code">
                            <div class="row">
                                <div class="col-sm-4 sm-margin-bottom-30">                              
                                </div>
                                <div class="col-sm-3 col-sm-offset-5">
                                    <ul class="list-inline total-result">
                                        <li>
                                            <c:set var="total" value="${0}" /> <c:forEach
                                                items="${sessionScope.cart}" var="map">
                                                <c:set var="total"
                                                       value="${total + map.value.quantity * map.value.product.price}" />
                                            </c:forEach>
                                        </li>
                                        <!--<li class="divider"></li>-->
                                        <li class="total-price in">
                                            <h4>Tổng tiền:</h4>
                                            <div class="total-result-in">
                                                <span>${total } <u>đ</u></span>

                                            </div>
                                        </li>
                                    </ul>

                                </div>
                            </div>

                        </div>

                    </div>
                    <div style="text-align: right">
                        <br>
                          <a <c:choose>
                                <c:when test="${fn:length(sessionScope.cart) < 1}"> href="#"</c:when>
                                <c:otherwise>href="${pageContext.request.contextPath}/member/order" </c:otherwise>
                            </c:choose>  
                            class="btn-u btn-u-sea-shop""><h3 style="color: white">Đặt Hàng</h3></a>
                    </div>
                </form>

            </div>
            <!--/end container-->

        </div>
        <!--=== End Content Medium Part ===-->

    </body>
</html>
