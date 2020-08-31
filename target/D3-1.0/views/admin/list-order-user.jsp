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
    </head>
    <body>
        <div class="main-content">

            <table class="table table-striped table-bordered table-hover"
                   id="dataTables-example">
                <thead>
                    <tr>
                        <th>Mã hóa đơn </th>
                        <th>Khách hàng</th>
                        <th>Ngày mua</th>
                        <th>Tổng tiền</th>
                        <th colspan="2">Tùy chọn</th>


                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listOrders}" var="order" >
                        <tr class="odd gradeX">
                            <td>${order.id }</td>                                                      
                            <td>${order.user.username }</td>
                            <td>${order.timeOrder }</td> 
                            <td>${order.totalPrice }</td>
                            <td style="width: 150px"><a style="color: black" href="<c:url value='/table/user-order/details?id=${order.id}'/>"><button style="color: black">Xem chi tiết</button></a></td>
                          
                        </tr>
                    </c:forEach>
                    <c:choose><c:when test="${empty listOrders}">
                        <td colspan="8">Không có hóa đơn nào </td>
                    </c:when></c:choose>

                </tbody>
            </table>

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
