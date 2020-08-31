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
                            <a href="<c:url value='/admin/product/list'/>">Sản phẩm</a>
                        </li>
                        <li>                        
                            Danh sách sản phẩm
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div id="page-wrapper">
                        <div id="page-inner">
                            <div class="row" style="text-align: center">
                                <h2>Danh sách sản phẩm </h2>
                                <br/>
                            </div>
                            <div class="row" >
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover"
                                               id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Mã sản phẩm </th>
                                                    <th>Hình ảnh</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Giá tiền($)</th>
                                                    <th>Thương hiệu</th>
                                                    <th>Dành cho</th>
                                                    <th>Mô tả</th>
                                                    <th colspan="2" style="width: 10%">Tùy chọn </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${proList }" var="pro" >
                                                    <tr class="odd gradeX">
                                                        <td>${pro.id }</td>
                                                        <td style="width: 200px"><img height="150" width="200" src="<c:url value='/Images/${pro.image }'/>"/></td>

                                                        <td>${pro.name }</td>
                                                        <td>${pro.price }</td>
                                                        <td>${pro.category.name }</td>
                                                        <td>${pro.category.sex }</td>
                                                        <td>${pro.des } </td>
                                                        <td> <a
                                                                href="<c:url value='/admin/product/edit?id=${pro.id }'/>"
                                                                class="center"><button title="Sửa sản phẩm"> <span class="glyphicon glyphicon-pencil"></span></button></a>
                                                        </td>
                                                        <td>
                                                            <a href="<c:url value='/admin/product/delete?id=${pro.id }'/>"class="center">
                                                                <button title="Xóa sản phẩm"> <span class="glyphicon glyphicon-trash"></span></button></a>
                                                        </td>

                                                    </tr>

                                                </c:forEach>
                                                <c:choose><c:when test="${empty proList}">
                                                    <td colspan="8">${msg} </td>
                                                </c:when></c:choose>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div style="text-align: center" class="row">
                                            <ul class="pagination">
                                            <c:forEach var="np" begin="1" end="${num_page}">
                                                <li ><a href="<c:url value='/admin/product/list'/>?page=${np}">${np}</a></li>
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
    </body>
</html>
