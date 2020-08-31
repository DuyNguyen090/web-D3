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
                    <li class="active">Thông tin tài khoản</li>
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
                        <div class="col-xs-6 md-6" >
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
                                <a href='<c:url value="/member/myaccount"/>'>
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
                                <a  style="color: black" href='<c:url value="/member/myaccount/purchase"/>'>
                                    <i class="col-xs-2 md-2 fa fa-shopping-cart"></i>                    
                                    Đơn mua
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 md-9" style="border-left: 1px black solid">
                    <div class="bootstrap snippet">
                        <div class="row col-sm-10">
                            <div >
                                <h1>Thông tin tài khoản</h1>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form" action="${myaccount }" method="post"
                                  id="registrationForm" enctype="multipart/form-data">
                                <input name="role" value="${sessionScope.account.roleId }" hidden="" >
                                <input name="id" value="${sessionScope.account.id }" hidden="">
                                <div class="col-sm-8 lg-8">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="home">
                                            <hr>

                                            <div class="form-group">

                                                <div class="col-xs-6">
                                                    <label for="first_name"><h4>Tên tài khoản:</h4></label> <input
                                                        type="text" class="form-control" name="username"
                                                        id="first_name" value="${sessionScope.account.username }"
                                                        title="enter your first name if any.">
                                                </div>
                                            </div>

                                            <div class="form-group">

                                                <div class="col-xs-6">
                                                    <label for="first_name"><h4>Email:</h4></label> <input
                                                        type="text" class="form-control" name="email" id="first_name"
                                                        value="${sessionScope.account.email }"
                                                        title="enter your first name if any.">
                                                </div>
                                            </div>
                                            <div class="form-group">

                                                <div class="col-xs-6">
                                                    <label for="phone"><h4>Mật khẩu</h4></label> <input
                                                        type="password" class="form-control" name="password" id="phone"
                                                        value="${sessionScope.account.password }"
                                                        title="enter your phone number if any.">
                                                </div>
                                            </div>

                                            <div class="form-group">

                                                <div class="col-xs-6">
                                                    <label for="last_name"><h4>Website</h4></label> <input
                                                        type="text" class="form-control" name="website" id="last_name"
                                                        value="http://D3.com" title="enter your last name if any."
                                                        disabled="disabled">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="text-center">
                                        <c:url value="/Images/${sessionScope.account.avatar }"
                                               var="imgUrl"></c:url>
                                        <img style="width: 200px; height: 197px" src="${imgUrl }" class="avatar img-circle img-thumbnail"
                                             alt="avatar">
                                        <h6>Thay đổi ảnh đại diện</h6>
                                        <input type="file" name="avatar" class="text-center center-block file-upload">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-9" style="padding-left: 2.5%">
                                        <br>
                                        <button class="btn btn-lg btn-success" type="submit">
                                            <i class="glyphicon glyphicon-ok-sign"></i> Save
                                        </button>
                                       </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
    </body>
</html>
