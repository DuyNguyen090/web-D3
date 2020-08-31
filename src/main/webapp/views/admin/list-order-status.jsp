<%-- 
    Document   : list-product
    Created on : Jun 3, 2020, 9:03:49 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách hóa đơn </title>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="<c:url value='/admin'/>">Admin</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/order/list'/>">Hoá đơn</a>

                        </li>
                        <li>
                            Danh sách ${name_list}
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div id="page-wrapper">
                        <div id="page-inner">
                            <div class="row" style="text-align: center">
                                <h2>Danh sách ${name_list} </h2>
                                <br/>
                            </div>
                            <div class="row" >
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Mã hóa đơn </th>
                                                    <th>Khách hàng</th>
                                                    <th>Ngày mua</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Tình trạng</th>
                                                    <th colspan="2" style="width: 10%">Chi tiết hóa đơn</th>
                                                    <th colspan="2" style="width: 10%">Tùy chọn</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${orderList}" var="order" >
                                                    <tr class="odd gradeX">
                                                        <td>${order.id }</td>                                                      
                                                        <td>${order.user.username }</td>
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
                                                            <a href="<c:url value='/table/details?id=${order.id }'/>" target="iframe">
                                                                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" 
                                                                        title="Chi tiết hóa đơn"> <span class="glyphicon glyphicon-list-alt"></span></button>
                                                            </a>
                                                        </td>

                                                        <td> 
                                                            <a href="<c:url value='/table/user-details?uid=${order.user.id }'/>" target="iframe">
                                                                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" 
                                                                        title="Thông tin khách hàng"> <span class="fa fa-user"></span></button>
                                                            </a>
                                                        </td>
                                                        <c:choose>
                                                            <c:when test="${order.status == 0}">
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=2'/>"class="center">
                                                                        <button title="Duyệt lại"> <span style="color: green" class="fa fa-check" ></nspan></button></a>
                                                                </td>
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/delete?id=${order.id }&&status=${order.status}'/>"class="center">
                                                                        <button title="Xóa hóa đơn"> <span class="glyphicon glyphicon-trash" ></nspan></button></a>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${order.status == 1}">
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=2'/>"class="center">
                                                                        <button title="Phê duyệt"> <span style="color: green" class="fa fa-check" ></nspan></button></a>
                                                                </td>
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=0'/>"class="center">
                                                                        <button title="Hủy đơn"> <span style="color: red" class="fa fa-ban" ></nspan></button></a>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${order.status == 2}">
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=3'/>"class="center">
                                                                        <button title="Giao hàng"> <span style="color: green" class="fa fa-check" ></nspan></button></a>
                                                                </td>
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=0'/>"class="center">
                                                                        <button title="Hủy đơn"> <span style="color: red" class="fa fa-ban" ></nspan></button></a>
                                                                </td>
                                                            </c:when>

                                                            <c:when test="${order.status == 3}">
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=4'/>"class="center">
                                                                        <button title="Đã giao"> <span style="color: green" class="fa fa-check" ></nspan></button></a>
                                                                </td>
                                                                <td>
                                                                    <a href="<c:url value='/admin/order/edit-status?id=${order.id }&&status=0'/>"class="center">
                                                                        <button title="Hủy đơn"> <span style="color: red" class="fa fa-ban" ></nspan></button></a>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${order.status == 4}">
                                                               <td>
                                                                    <a href="<c:url value='/admin/order/delete?id=${order.id }&&status=${order.status}'/>"class="center">
                                                                        <button title="Xóa hóa đơn"> <span class="glyphicon glyphicon-trash" ></nspan></button></a>
                                                                </td>
                                                            </c:when>
                                                        </c:choose>
                                                    </tr>
                                                </c:forEach>
                                                <c:choose><c:when test="${empty orderList}">
                                                    <td colspan="8">${msg} </td>
                                                </c:when></c:choose>

                                                </tbody>
                                            </table>
                                            <div id="id01" class="modal" style="background-color: rgba(0, 0, 0, 0.75);">
                                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal" style="position: absolute; right: 35px; top: 15px; font-size: 80px; font-weight: bold; color: red;">&times;</span>
                                                <div class="container" style=" margin-top: 100px">
                                                    <iframe style="width: 100%; height: 500px" name="iframe" title="W3Schools Free Online Web Tutorials">
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
            </div><!-- /.main-content -->
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
