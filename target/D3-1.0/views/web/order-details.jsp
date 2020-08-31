<%-- 
    Document   : order-details
    Created on : Jun 14, 2020, 9:18:49 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <!--=== Content Medium Part ===-->
        <div class="content-md margin-bottom-30">
            <div class="container">
                <form class="shopping-cart" action="#">
                    <div>
                        <div class="header-tags">
                            <div class="overflow-h">
                                <div class="row" style="text-align: center">
                                    <h2>Chi tiết hóa đơn</h2>
                                </div>
                                <br/>
                            </div>
                        </div>
                        <section>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th style="width: 350px">Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderDetails}" var="od">
                                        <tr>
                                        <c:url value="/Images/${od.product.image }"
                                               var="imgUrl"></c:url>
                                        <td style="padding-left: 5%">
                                            <div class="product-in-table">
                                                <img class="img-responsive" src="${imgUrl}" alt=""/>
                                            </div>
                                        </td>
                                        <td >
                                            <h3>${od.product.name }</h3>
                                            <span>${od.product.des }</span>
                                        </td>
                                        <td>${od.product.price } <u>đ</u></td>
                                        <td>  ${od.quantity }            </td>
                                        <td class="shop-red">${od.unitPrice} <u style="color: red">đ</u></td>
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
                                            items="${orderDetails}" var="od">
                                            <c:set var="total"
                                                   value="${total + od.quantity * od.product.price}" />
                                        </c:forEach>
                                        </li>
<!--                                        <li class="divider"></li>-->
                                        <li class="total-price in">
                                            <h4>Tổng tiền:</h4>
                                            <div class="total-result-in">
                                                <span>${total }  <u style="color: red">đ</u></span>

                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Content Medium Part ===-->
    </body>
</html>
