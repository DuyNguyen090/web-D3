<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<ul class="list-inline shop-badge badge-lists badge-icons pull-right">
    <li>
        <a href="${pageContext.request.contextPath }/cart"><i class="fa fa-shopping-cart"></i></a> 
            <c:set var="count" value="${0}" /> 
            <c:forEach items="${sessionScope.cart}" var="map">
                <c:set var="count" value="${count + map.value.quantity}" />
            </c:forEach> 
        <span class="badge badge-sea rounded-x">${count }</span>
        <ul class="list-unstyled badge-open mCustomScrollbar"
            data-mcs-theme="minimal-dark">
            <c:forEach items="${sessionScope.cart}" var="map">
                <li> <c:url value="/Images/${map.value.product.image }" var="imgUrl"></c:url>
                    <img src="${imgUrl}" alt="" width="10"
                         height="20"> <a
                         href="${pageContext.request.contextPath}/cart/remove?pId=${map.value.product.id} "><button
                            type="button" class="close">×</button></a>
                    <div class="overflow-h">
                        <span>${map.value.product.name }</span> <small>${map.value.quantity }
                            * ${map.value.product.price } <u>đ</u> </small>
                    </div></li>
                </c:forEach>

            <li class="subtotal">
                <div class="overflow-h margin-bottom-10">
                    <span>Tổng tiền</span>
                    <c:set var="total" value="${0}" />
                    <c:forEach items="${sessionScope.cart}" var="map">
                        <c:set var="total" value="${total + map.value.quantity * map.value.product.price}" />
                    </c:forEach>
                    <span class="pull-right subtotal-cost">${total } <u style=" text-transform: lowercase;">đ</u></span>

                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <a href="${pageContext.request.contextPath}/cart"
                           class="btn-u btn-brd btn-brd-hover btn-u-sea-shop btn-block">Xem</a>
                    </div>
                    <div class="col-xs-6">
                        <a <c:choose>
                                <c:when test="${fn:length(sessionScope.cart) < 1}"> href="#"</c:when>
                                <c:otherwise>href="${pageContext.request.contextPath}/member/order" </c:otherwise>
                            </c:choose>  
                            class="btn-u btn-u-sea-shop btn-block">Đặt Hàng</a>
                    </div>
                </div>
            </li>
        </ul>
    </li>
</ul>