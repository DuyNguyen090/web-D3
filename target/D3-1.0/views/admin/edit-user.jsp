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
                            Tài khoản
                        </li>
                        <li>                        
                            Thêm tài khoản
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <h2>Thêm tài khoản</h2>
                            <h5>Thêm tài khoản cần sử dụng  </h5>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <hr />
                    <div class="row">
                        <!-- Form Elements -->
                        <div class="panel panel-default">
                            <div class="panel-heading">Thông tin bạn cần thay đổi</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3>User:</h3>
                                        <c:url value="/admin/user/edit" var="edit"></c:url>
                                        <form role="form" action="${edit }" method="post"
                                              enctype="multipart/form-data">
                                            <input name="id" value="${user.id }" type="text" hidden="">
                                            <div class="form-group">
                                                <label>Tên tài khoản:</label> <input class="form-control"
                                                                                 value="${user.username }" name="username" />
                                            </div>
                                            <div class="form-group">
                                                <label>Mật khẩu</label> <input class="form-control"
                                                                               value="${user.password }" type="password" name="password" />
                                            </div>
                                            <div class="form-group">
                                                <label>Email:</label> <input class="form-control"
                                                                             value="${user.email }" name="email" />
                                            </div>
                                            <div class="form-group">
                                                <label>Quyền</label>
                                                <div class="checkbox">
                                                    <label> <input type="radio" value="1" name="role" />Admin
                                                    </label> <br> <label> <input type="radio" value="2"
                                                                                 name="role" checked="checked"/>Client
                                                    </label>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label>Choose Avatar</label> <input type="file"
                                                                                    name="avatar" />
                                            </div>
                                            <button type="submit" class="btn btn-default">Edit</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                        </form>



                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Form Elements -->
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</body>
</html>
