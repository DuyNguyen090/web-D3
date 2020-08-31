<%-- 
    Document   : order-details
    Created on : Jun 8, 2020, 8:45:33 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

    <body>
        <div>
            <h4>Mã hóa đơn: ${order.id} </h4>
            <h4>Khách hàng: ${order.user.username}</h4>
            <h4>Ngày mua: ${order.timeOrder}</h4>
        </div>
        <div>
            <table class="table table-striped table-bordered table-hover"
                   id="dataTables-example">
               <thead>
                    <tr>
                        <th>Mã sản phẩm </th>
                        <th>Tên sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderDetails}" var="od" >
                        <tr class="odd gradeX">
                            <td>${od.product.id }</td>                                                      
                            <td>${od.product.name }</td>
                            <td>${od.product.price } <u>đ</u></td>
                            <td>${od.quantity }</td> 
                            <td>${od.unitPrice } <u>đ</u></td>
                        </tr>   
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="text-align: right">
            <h3 style="color: red">Tổng: ${sum} <u style="color: red">đ</u></h3>
        </div>
        
    </body>
</html>