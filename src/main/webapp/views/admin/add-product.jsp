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
                            Thêm sản phẩm
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h2>Thêm sản phẩm</h2>
                            <h5>Thêm sản phẩm bạn có thể bán</h5>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <hr />
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Form Elements -->
                            <div class="panel panel-default">
                                <div class="panel-heading">Thêm sản phẩm</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h3>Thông tin sản phẩm:</h3>

                                            <form role="form" action="<c:url value='/admin/product/add'/>" method="POST"
                                                  enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label>Tên sản phẩm:</label> <input class="form-control"
                                                                                        placeholder="please enter Product Name" name="name" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Giá sản phẩm ($)</label> <input class="form-control"
                                                                                           placeholder="please enter Price" type="number" name="price" />
                                                </div>
                                                <div class="form-group">
                                                    <label>Mô tả sản phẩm </label>
                                                    <br>
                                                    <textarea rows="4" cols="50" name="des" id="editer"></textarea>

                                                </div>

                                                <div class="form-group">
                                                    <label>Loại sản phẩm</label>
                                                    <div class="checkbox">
                                                        <select name="category">
                                                            <c:forEach items="${categories}" var="c">
                                                                <option value="${c.id}">${c.name} - ${c.sex}</option>
                                                            </c:forEach>
                                                        </select>
                                                        
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label>Hình ảnh</label> <input type="file" name="image" />
                                                </div>
                                                <button type="submit" class="btn btn-default">Add</button>
                                                <button type="reset" class="btn btn-primary">Reset</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Form Elements -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12"></div>
                    </div>
                </div>
            </div>
        </div><!-- /.main-content -->

    </body>
</html>
