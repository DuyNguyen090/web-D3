<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/template/web" var="url"/>
<html>
    <header>
    </header>
    <body>
        <div class="navbar navbar-default mega-menu" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath }">
                        <img style="margin-top: -8px; width: 200px" id="logo-header" height="60" width="200" src="<c:url value='/template/web/img/logo-web.png'/>" alt="Logo">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <!-- Shopping Cart -->
                    <%@ include file="/views/web/cart.jsp" %>
                    <!-- End Shopping Cart -->

                    <!-- Nav Menu -->
                    <ul class="nav navbar-nav" >
                        <!-- Home -->
                        <c:set value="${pageContext.request.requestURI}" var="url_page"/>
                        <li class="dropdown <c:if test="${ url_page.contains('/D3/home')}"> active </c:if> ">
                            <a href="${pageContext.request.contextPath }/home" >
                                Trang chủ
                            </a>
                        </li>
                        <!-- End Home -->
                        <!--Introduce -->
                        <li class="dropdown <c:if test="${ url_page.contains('/D3/introduce')}"> active </c:if>">
                            <a href="${pageContext.request.contextPath }/introduce" >
                                Giới thiệu
                            </a>
                        </li>

                        <!--End Introduce -->
                        <!-- Product -->
                        <li class="dropdown <c:if test="${ url_page.contains('/D3/product')}"> active </c:if>">
                            <a href="${pageContext.request.contextPath }/product/list" >
                                Sản phẩm
                            </a>
                        </li>
                        <!-- End Product -->
                        <!-- Promotion -->
                        <li class="dropdown <c:if test="${ url_page.contains('/D3/promotion')}"> active </c:if> mega-menu-fullwidth ">
                            <a href="javascript:void(0);"  class="dropdown-toggle " data-hover="dropdown" data-toggle="dropdown">
                                Khuyến Mãi
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-12 col-xs-12 md-margin-bottom-30">
                                                    <h3 class="mega-menu-heading">Khuyến mãi sản phẩm</h3>
                                                    <p>"Tôi tin rằng sử dụng nước hoa là một lợi thế. Đó là một trong những giác quan của chúng ta và là một sự lãng phí nếu không sử dụng khứu giác của chúng ta. Tôi cũng nghĩ rằng hương thơm là thứ gì đó nói lên rất nhiều về một người." </p>
                                                    <button type="button" class="btn-u btn-u-dark">(Nacho Figueras)</button>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4 md-margin-bottom-30">
                                                    <a href="${pageContext.request.contextPath }/promotion"><img class="product-offers img-responsive" src="${url}/img/blog/01.jpg" alt=""></a>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4 sm-margin-bottom-30">
                                                    <a href="${pageContext.request.contextPath }/promotion"><img class="product-offers img-responsive" src="${url}/img/blog/02.jpg" alt=""></a>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4">
                                                    <a href="${pageContext.request.contextPath }/promotion"><img class="product-offers img-responsive" src="${url}/img/blog/03.jpg" alt=""></a>
                                                </div>
                                            </div><!--/end row-->
                                        </div><!--/end container-->
                                    </div><!--/end mega menu content-->  
                                </li>
                            </ul><!--/end dropdown-menu-->
                        </li>
                        <!-- End Gifts -->
                        <!-- End Promotion -->
                        <!--Contact -->
                        <li class="dropdown <c:if test="${ url_page.contains('/contact')}"> active </c:if>">
                            <a href="${pageContext.request.contextPath }/contact" >
                                Liên hệ
                            </a>
                        </li>

                        <!--End Contact -->
                    </ul>
                    <!-- End Nav Menu -->                    
                </div>
            </div>    
        </div> 

    </body>
</html>