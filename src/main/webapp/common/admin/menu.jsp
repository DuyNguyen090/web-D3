<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
        <li >
            <a href='<c:url value="/admin"/>'>
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Dashboard
                <!--<b class="arrow fa fa-angle-down"></b>-->
            </a>
            <b class="arrow"></b>
        </li>
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Sản phẩm
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href='<c:url value="/admin/product/list"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                    <a href='<c:url value="/admin/product/add"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Loại sản phẩm
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href='<c:url value="/admin/category/list"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Loại sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                    <a href='<c:url value="/admin/category/add"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm loại sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
          <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Hóa đơn 
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href='<c:url value="/admin/order/list"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Hóa đơn
                    </a>
                    <b class="arrow"></b>
                </li>  
                <li>
                    <a href='<c:url value="/admin/order/list-status?status=1"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Chờ xác nhận
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                    <a href='<c:url value="/admin/order/list-status?status=2"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Chờ giao hàng
                    </a>
                    <b class="arrow"></b>
                </li>     
                 <li>
                    <a href='<c:url value="/admin/order/list-status?status=3"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Đang giao
                    </a>
                    <b class="arrow"></b>
                </li>     
                 <li>
                    <a href='<c:url value="/admin/order/list-status?status=4"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Đã giao
                    </a>
                    <b class="arrow"></b>
                </li>     
                <li>
                    <a href='<c:url value="/admin/order/list-status?status=0"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Hủy đơn
                    </a>
                    <b class="arrow"></b>
                </li>   
            </ul>
                        
        </li>
     
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Tài khoản
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href='<c:url value="/admin/user/list"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Tài khoản
                    </a>
                    <b class="arrow"></b>
                </li>
                <li>
                    <a href='<c:url value="/admin/user/add"/>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm tài khoản
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>

    </ul>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>