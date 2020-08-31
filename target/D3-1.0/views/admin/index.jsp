<%-- 
    Document   : index
    Created on : May 27, 2020, 8:00:57 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản trị WebShop D3</title>
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
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div class="row" >
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-xs-3 md-3 sm-3 infobox infobox-pink" style="margin: 3%">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-shopping-cart"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${num_order}</span>
                                        <div class="infobox-content">Hóa đơn</div>
                                    </div>
                                </div>
                                <div class="col-xs-3 md-3 sm-3 infobox infobox-blue"style="margin: 3%">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-user"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${num_user}</span>
                                        <div class="infobox-content">User</div>
                                    </div>
                                </div>
                                <div class="col-xs-3 md-3 sm-3 infobox infobox-green" style="margin: 3%">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-product-hunt"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${num_product}</span>
                                        <div class="infobox-content">Sản phẩm</div>
                                    </div>
                                </div>
                                <div class="col-xs-3 md-3 sm-3 infobox infobox-green" style="margin: 3%">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-tag"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${num_cate}</span>
                                        <div class="infobox-content">Loại sản phẩm</div>
                                    </div>
                                </div>
                                <div class="col-xs-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.main-content -->
    </body>
</html>
