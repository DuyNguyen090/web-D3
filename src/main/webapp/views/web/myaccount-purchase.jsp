<%-- 
    Document   : account
    Created on : Jun 13, 2020, 6:05:29 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
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
                    <li><a href="${pageContext.request.contextPath }/member/myaccount">Tài khoản</a></li>
                    <li class="active">Đơn mua</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->
        <hr>
        <div class="container">
            <div class="row">
                <div class="col-xs-3 md-3" style="background: rgba(0,0,0,0.01)">
                    <div class="row" style="background: #F3F781">
                        <div class="col-xs-6 md-6">
                            <img style="height: 100px" width="100%" height="100%" class="avatar img-circle img-thumbnail"
                                 alt="avatar" src="<c:url value='/Images/${sessionScope.account.avatar}'/>">
                        </div>
                        <div class="col-xs-6 md-6">
                            <h5 style="color: black"><b>${sessionScope.account.username}</b></h5>
                            <a href='<c:url value="/member/myaccount"/>'><h5><svg width="12" height="12" viewBox="0 0 12 12" 
                                                                                  xmlns="http://www.w3.org/2000/svg" 
                                                                                  style="margin-right: 4px;"><path 
                                                                                  d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48" 
                                                                                  fill="#9B9B9B" fill-rule="evenodd"></path></svg>Sửa tài khoản</h5></a>
                        </div>

                    </div>
                    <br/>
                    <div class="row">
                        <ul class="nav nav-list">
                            <li>
                                <a style="color: black" href='<c:url value="/member/myaccount"/>'>
                                    <i class="col-xs-2 md-2 fa fa-user"></i>
                                    Tài khoản
                                </a>

                            </li>
                            <li>
                                <a style="color: black" href='<c:url value="/member/myaccount/address"/>'>
                                    <i class="col-xs-2 md-2 fa fa-map-marker"></i>
                                    Địa chỉ
                                </a>

                            </li>
                            <li >
                                <a  href='<c:url value="/member/myaccount/purchase"/>'>
                                    <i class="col-xs-2 md-2 fa fa-shopping-cart"></i>                    
                                    Đơn mua
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 md-9" style="border-left: 1px black solid">
                    <div class="row">
                        <div class="collapse navbar-collapse navbar-responsive-collapse">
                            <!-- Nav Menu -->
                            <ul class="nav navbar-nav">
                                <li class="dropdown active">
                                    <a <c:choose><c:when test="${st != null}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase" >
                                            Tất cả
                                        </a>
                                    </li>
                                    <li class="dropdown ">
                                        <a <c:choose><c:when test="${st != 1}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase?status=1" >
                                            Chờ xác nhận
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a <c:choose><c:when test="${st != 2}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase?status=2" >
                                            Chờ giao hàng
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a <c:choose><c:when test="${st != 3}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase?status=3" >
                                            Đang giao
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a <c:choose><c:when test="${st != 4}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase?status=4" >
                                            Đã giao
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a <c:choose><c:when test="${st != 0}">
                                                style="color: black"
                                            </c:when></c:choose> href="${pageContext.request.contextPath }/member/myaccount/purchase?status=0" >
                                            Đã Hủy
                                        </a>
                                    </li>

                                </ul>
                                <!-- End Nav Menu -->                    
                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Mã hóa đơn </th>
                                                <th>Ngày mua</th>
                                                <th>Tổng tiền</th>
                                                <th>Tình trạng</th>
                                                <th style="width: 10%">Chi tiết hóa đơn</th>
                                                <c:choose> <c:when test="${st != 4}">
                                                    <th style="width: 10%">Tùy chọn</th>
                                                    </c:when>
                                                </c:choose>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderList}" var="order" >
                                            <tr class="odd gradeX">
                                                <td>${order.id }</td>                                                      
                                                <td>${order.timeOrder }</td> 
                                                <td>${order.totalPrice }</td>
                                                <td><c:choose>  
                                                        <c:when test="${order.status == 0}"><span style="color: red">Hủy đơn</span></c:when>
                                                        <c:when test="${order.status == 1}"><span style="color: green">Chờ xác nhận</span></c:when>
                                                        <c:when test="${order.status == 2}"><span style="color: #2cd5b6">Chờ giao hàng</span></c:when>
                                                        <c:when test="${order.status == 3}"><span style="color: gold">Đang giao</span></c:when>
                                                        <c:when test="${order.status == 4}">Đã giao</c:when>
                                                    </c:choose></td>
                                                <td> 
                                                    <a href="<c:url value='/table/member/order-details?id=${order.id }'/>" target="iframe">
                                                        <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" 
                                                                title="Chi tiết hóa đơn"> <span class="glyphicon glyphicon-list-alt"></span></button>
                                                    </a>
                                                </td>

                                                <c:choose>
                                                    <c:when test="${order.status == 0}">
                                                        <td>
                                                            <a href="<c:url value='/member/myaccount/edit-purchase?id=${order.id }&&status=1'/>"class="center">
                                                                <button title="Đặt hàng lại"> <span style="color: green" class="fa fa-repeat" ></nspan></button></a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${order.status == 1}">
                                                        <td>
                                                            <a href="<c:url value='/member/myaccount/edit-purchase?id=${order.id }&&status=0'/>"class="center">
                                                                <button title="Hủy đơn"> <span style="color: red" class="fa fa-ban" ></nspan></button></a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${order.status == 2}">
                                                        <td>
                                                            <a href="<c:url value='/member/myaccount/edit-purchase?id=${order.id }&&status=0'/>"class="center">
                                                                <button title="Hủy đơn"> <span style="color: red" class="fa fa-ban" ></nspan></button></a>
                                                        </td>
                                                    </c:when>

                                                    <c:when test="${order.status == 3}">
                                                        <td>
                                                            <a href="<c:url value='/member/myaccount/edit-purchase?id=${order.id }&&status=4'/>"class="center">
                                                                <button title="Đã nhận"> <span style="color: green" class="fa fa-check" ></nspan></button></a>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${st != 4 && st == null }">
                                                        <td>
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                        <c:choose><c:when test="${empty orderList}">
                                            <td colspan="8">Chưa có đơn hàng </td>
                                        </c:when></c:choose>

                                        </tbody>
                                    </table>
                                    <div id="id01" class="modal" style="background-color: rgba(0, 0, 0, 0.75); width: 100%; height: 100%">
                                        <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal" style="position: absolute; right: 35px; top: 15px; font-size: 80px; font-weight: bold; color: red;">&times;</span>
                                        <div class="container" style=" margin-top: 100px; height: 70%">
                                            <iframe style="width: 100%; height: 100%" name="iframe" title="W3Schools Free Online Web Tutorials">
                                            </iframe>
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align: center" class="row">
                                    <ul class="pagination">
                                    <c:forEach var="np" begin="1" end="${num_page}">
                                        <li ><a href="<c:url value='/admin/order/list-status'/>?status=${status}&&page=${np}">${np}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <br/>
</div>
<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>
