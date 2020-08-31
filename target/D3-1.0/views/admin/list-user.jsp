<%-- 
    Document   : list-product
    Created on : Jun 3, 2020, 9:03:49 AM
    Author     : DUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sản phẩm </title>
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
                            <a href="<c:url value='/admin/user/list'/>">Tài khoản</a>
                        </li>
                        <li>                        
                            Danh sách tài khoản
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div id="page-wrapper">
                        <div id="page-inner">
                            <div class="row" style="text-align: center">
                                <h2>Danh sách tài khoản </h2>
                                <br/>
                            </div>
                            <div class="row" >
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Mã tài khoản </th>
                                                    <th>Tên tài khoản</th>
                                                    <th>email</th>
                                                    <th>Mật khẩu</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Quyền</th>
                                                    <th colspan="4" style="width: 10%">Tùy chọn </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${userList}" var="user" >

                                                    <tr class="odd gradeX">
                                                        <td>${user.id }</td>
                                                        <td>${user.username }</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.password }</td>
                                                        <td style="width: 200px"><img height="150" width="200" src="<c:url value='/Images/${user.avatar }'/>"/></td>
                                                        <td class="center"><c:choose>
                                                                <c:when test="${user.roleId ==1 }">
                                                                    Admin
                                                                </c:when>
                                                                <c:otherwise>Khách hàng</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td style="width: 50px">  
                                                            <a href="<c:url value='/table/user-details?uid=${user.id }'/>" target="iframe">
                                                                <button   onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" title="Thông tin khách hàng"> <span class="glyphicon glyphicon-info-sign"></span></button>
                                                            </a>
                                                        </td>
                                                        <td style="width: 50px"> 
                                                            <a href="<c:url value='/table/user-order?id=${user.id }'/>" target="iframe">
                                                                <button  onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" title="Lịch sử mua hàng"> <span class="glyphicon glyphicon-list-alt"></span></button>
                                                            </a>
                                                        </td>
                                                        <td style="width: 50px"> <a
                                                                href="<c:url value='/admin/user/edit?id=${user.id }'/>"
                                                                class="center"><button> <span class="glyphicon glyphicon-pencil"></span></button></a>
                                                        </td>
                                                        <td style="width: 50px">
                                                            <a href="<c:url value='/admin/user/delete?id=${user.id }'/>"class="center">
                                                                <button> <span class="glyphicon glyphicon-trash"></span></button></a>
                                                        </td>
                                                    </tr>

                                                    </div>
                                                </c:forEach>
                                                <c:choose><c:when test="${empty userList}">
                                                    <td colspan="8">${msg} </td>
                                                </c:when></c:choose>    

                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="id01" class="modal" style="background-color: rgba(0, 0, 0, 0.75);">
                                            <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal" style="position: absolute; right: 35px; top: 15px; font-size: 40px; font-weight: bold; color: red;">&times;</span>                                                   
                                            <div class="container" style=" margin-top: 100px">
                                                <iframe style="width: 100%; height: 500px" src="<c:url value='/table/user-details?uid=1'/>" name="iframe" title="Danh sách hóa đơn">
                                            </iframe>
                                        </div>
                                    </div>

                                    <div style="text-align: center" class="row">
                                        <ul class="pagination">
                                            <c:forEach var="np" begin="1" end="${num_page}">
                                                <li ><a href="<c:url value='/admin/user/list'/>?page=${np}">${np}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
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
