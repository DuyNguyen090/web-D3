<%-- 
    Document   : index
    Created on : May 27, 2020, 1:12:51 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url value="/template/web" var="url"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Trang chủ</title>
        </head>
        <body>
            <!-- slider Area Start -->
        <%@ include file="/common/web/slider.jsp" %>
        <!-- slider Area End-->
        <div class="container content-md">
            <!--=== Illustration v1 ===-->
            <div class="row margin-bottom-60">
                <div class="col-md-6 md-margin-bottom-30">
                    <div class="overflow-h">
                        <div class="illustration-v1 illustration-img1">
                            <div class="illustration-bg">
                                <div class="illustration-ads ad-details-v1">
                                    <h3>
                                        NEW YEAR <strong>sale</strong> 30% - 60% <strong>off</strong>
                                    </h3>
                                    <a class="btn-u btn-brd btn-brd-hover btn-u-light" href="<c:url value='/product/list'/>">Shop
                                        Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="overflow-h">
                        <a class="illustration-v1 illustration-img2" href="<c:url value='/product/list'/>"> <span
                                class="illustration-bg"> <span
                                    class="illustration-ads ad-details-v2"> <span
                                        class="item-time">Spring 2020</span> <span class="item-name">Lacoste</span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <!--/end row-->
            <!--=== End Illustration v1 ===-->

            <div class="heading heading-v1 margin-bottom-20">
                <h2>Sản phẩm mới</h2>
                <p>Nước hoa đã trở thành một loại phụ trang không thể thiếu, 
                    góp phần tạo nên phong cách thời trang cho bạn. Giống như trang phục, 
                    hương thơm bạn yêu thích sẽ thổ lộ rất nhiều về cá tính cũng như tâm trạng 
                    của bạn với người xung quanh.</p>
            </div>
            <!--=== Illustration v2 ===-->
            <div class="illustration-v2 margin-bottom-60">
                <div class="customNavigation margin-bottom-25">
                    <a class="owl-btn prev rounded-x"><i class="fa fa-angle-left"></i></a>
                    <a class="owl-btn next rounded-x"><i class="fa fa-angle-right"></i></a>
                </div>

                <ul class="list-inline owl-slider">

                    <c:forEach items="${pwelcome }" var="p" begin="0" end="8">
                        <c:url value="/Images/${p.image }" var="imgUrl"></c:url>
                            <li class="item">
                                <div class="product-img">
                                    <a
                                        href="${pageContext.request.contextPath }/product/detail?id=${p.id}"><img
                                        width="100%" height="250" src="${imgUrl}" alt=""></a> <a
                                    class="product-review"
                                    href="${pageContext.request.contextPath }/product/detail?id=${p.id}">Quick
                                    review</a> <a class="add-to-cart"
                                              href="${pageContext.request.contextPath }/cart/add?pId=${p.id}&&quantity=1"><i
                                        class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</a>
                                <div class="shop-rgba-dark-green rgba-banner">New</div>
                            </div>
                            <div class="product-description product-description-brd">
                                <div class="overflow-h margin-bottom-5">
                                    <div class="pull-left">
                                        <h4 class="title-price"> 
                                            <a href="${pageContext.request.contextPath }/product/detail?id=${p.id}" title="${p.name}">${fn:substring(p.name,0,35)}...</a>
                                        </h4>
                                        <span class="gender text-uppercase">${p.category.name }</span>
                                        <span class="gender">Mới nhất</span>
                                    </div>
                                    <div class="product-price">
                                        <span class="title-price">${p.price } <u>đ</u></span>

                                    </div>
                                </div>

                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </div>
            <!--=== End Illustration v2 ===-->
            <!--=== Illustration v3 ===-->
            <div class="row margin-bottom-50">
                <div class="col-md-4 md-margin-bottom-30">
                    <div class="overflow-h">
                        <a class="illustration-v3 illustration-img1"
                           href="${pageContext.request.contextPath}/product/category?cate_sex=Nam">
                            <span class="illustration-bg" style="background-image: url(<c:url value="/template/web/img/blog/pic-nam.jpg"/>);"> <span
                                    class="illustration-ads"> <span
                                        class="illustration-v3-category"> <span
                                            class="product-category">Dành Cho Nam</span> 
                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 md-margin-bottom-30">
                    <div class="overflow-h">
                        <a class="illustration-v3 illustration-img2"
                           href="${pageContext.request.contextPath }/product/category?cate_sex=Nữ">
                            <span class="illustration-bg" style="background-image: url(<c:url value="/template/web/img/blog/pic-nu.jpg"/>);"> <span
                                    class="illustration-ads"> <span
                                        class="illustration-v3-category"> <span
                                            class="product-category">Dành cho nữ</span> 

                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-md-4" >
                    <div class="overflow-h">
                        <a class="illustration-v3 illustration-img3"
                           href="${pageContext.request.contextPath }/gift">

                            <span class="illustration-bg"  style="background-image: url(<c:url value="/template/web/img/blog/01.jpg"/>);"> 
                                <span class="illustration-ads" > 
                                    <span class="illustration-v3-category" >   
                                        <span class="product-category">Khuyến mãi</span> 

                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <!--=== End Illustration v3 ===-->

            <div class="heading heading-v1 margin-bottom-40">
                <h2>Một số sản phẩm cũ</h2>
            </div>

            <!--=== Illustration v2 ===-->
            <div class="row illustration-v2">
                <c:choose>
                    <c:when test="${fn:length(pwelcome) < 8}"><c:set var="begin" value="${0}"/> </c:when>
                    <c:otherwise><c:set var="begin" value="${fn:length(pwelcome) - 8}"/></c:otherwise>
                </c:choose>
                <c:forEach items="${pwelcome }" var="p" begin="${begin}" end="${fn:length(pwelcome)}" >
                    <c:url value="/Images/${p.image}" var="imgUrl"></c:url>

                        <div class="col-md-3 sm-6 md-margin-bottom-30">
                            <div class="product-img">
                                <a
                                    href="${pageContext.request.contextPath }/product/detail?id=${p.id}"><img
                                    width="100%" height="250" src="${imgUrl }" alt=""
                                    "
                                    alt=""></a> <a class="product-review"
                                           href="${pageContext.request.contextPath }/product/detail?id=${p.id}">Quick
                                review</a> <a class="add-to-cart"
                                          href="${pageContext.request.contextPath }/cart/add?pId=${p.id}&&quantity=1"><i
                                    class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</a>
                        </div>
                        <div class="product-description product-description-brd">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price">
                                        <a
                                            href="${pageContext.request.contextPath }/product/detail?id=${p.id}" title="${p.name}">${fn:substring(p.name,0,35)}...</a>
                                    </h4>
                                    <span class="gender text-uppercase">${p.category.name }</span>
                                    <span class="gender text-uppercase">${p.category.sex }</span>


                                </div>
                                <div class="product-price">
                                    <span class="title-price">${p.price } <u>đ</u></span>
                                </div>
                            </div>

                            </ul>
                        </div>
                    </div>
                </c:forEach>


            </div>
            <!--=== End Illustration v2 ===-->
        </div>
        <!--=== End Product Content ===-->
        <!--=== Twitter-Block ===-->
        <div class="parallaxBg twitter-block margin-bottom-60">
            <div class="container">
                <div class="heading heading-v1 margin-bottom-20">
                    <h2>Khuyến Mãi Mới</h2>
                </div>

                <div id="carousel-example-generic-v5" class="carousel slide"
                     data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li class="active rounded-x"
                            data-target="#carousel-example-generic-v5" data-slide-to="0"></li>
                        <li class="rounded-x" data-target="#carousel-example-generic-v5"
                            data-slide-to="1"></li>
                        <li class="rounded-x" data-target="#carousel-example-generic-v5"
                            data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner" >
                        <div class="item active">
                            <a href="${pageContext.request.contextPath }/promotion" ><img style="margin-left: 32%" width="300" height="150" class="product-offers img-responsive" src="${url}/img/blog/01.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="${pageContext.request.contextPath }/promotion"><img style="margin-left: 32%" width="300" height="150" class="product-offers img-responsive" src="${url}/img/blog/02.jpg" alt=""></a>

                        </div>
                        <div class="item">
                            <a href="${pageContext.request.contextPath }/promotion"><img style="margin-left: 32%" width="300" height="150" class="product-offers img-responsive" src="${url}/img/blog/03.jpg" alt=""></a>

                        </div>
                    </div>

                    <div class="carousel-arrow">
                        <a class="left carousel-control"
                           href="#carousel-example-generic-v5" data-slide="prev"> <i
                                class="fa fa-angle-left"></i>
                        </a> <a class="right carousel-control"
                                href="#carousel-example-generic-v5" data-slide="next"> <i
                                class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--=== End Twitter-Block ===-->
        <div class="container">
            <!--=== Product Service ===-->
            <div class="row margin-bottom-60">
                <div class="col-md-4 product-service md-margin-bottom-30">
                    <div class="product-service-heading">
                        <i class="fa fa-truck"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Giao Hàng Miễn Phí</h3>
                        <p>Miễn phí vận chuyển cho các đơn hàng</p>
                        <br/>
                    </div>
                </div>
                <div class="col-md-4 product-service md-margin-bottom-30">
                    <div class="product-service-heading">
                        <i class="icon-earphones-alt"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Dịch vụ khách hàng</h3>
                        <p>Hỗ trợ chăm sóc khách hàng 24/7</p>
                        <br/>
                    </div>
                </div>
                <div class="col-md-4 product-service">
                    <div class="product-service-heading">
                        <i class="icon-refresh"></i>
                    </div>
                    <div class="product-service-in">
                        <h3>Miễn phí đổi trả</h3>
                        <p>Trong vòng 7 ngày nếu sản phẩm bị lỗi sẽ được đổi trả</p>
                    </div>
                </div>
            </div>
            <!--/end row-->
            <!--=== End Product Service ===-->
        </div>
        <!--/end cotnainer-->

        <!--=== Collection Banner ===-->
        <div class="collection-banner">
            <div class="container">
                <div class="col-md-7 md-margin-bottom-50">
                    <h2>Bộ sưu tập nước hoa</h2>
                    <p>
                        Để tạo nên mùi hương sang trọng, đẳng cấp, các nguyên liệu sản xuất nước hoa <br/>
                        đều được công ty nhập khẩu hoàn toàn từ châu Âu,<br> chủ yếu là hai thị trường Pháp và Tây Ban Nha.
                    </p>
                    <br> <a href="${pageContext.request.contextPath }/product/list"
                            class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>

            </div>
        </div>
        <!--=== End Collection Banner ===-->

        <!--=== Sponsors ===-->
        <div class="container content">
            <div class="heading heading-v1 margin-bottom-40">
                <h2>Nhà tài trợ</h2>
                <p>Các mùi hương thơm được chuyên gia từ PHÁP chọn lọc 
                    dựa theo các dòng sản phẩm nổi tiếng nhất trên thế giới 
                    được nhiều người dùng ưa chuộng sau đó cho ra đời mang thương 
                    hiệu CHARME với sản phẩm có độ lưu hương rất lâu, mùi hương sang trọng và 
                    hiện đại không khác gì so với các mặt hàng ngoại nhập từ Âu, Mỹ.</p>
            </div>

            <ul class="list-inline owl-slider-v2">
                <li class="item first-child"><img
                        src="${url}/img/clients/01.png" alt=""></li>
                <li class="item"><img width="150" height="72" src="${url}/img/clients/02.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/03.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/06.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/09.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/10.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/11.png" alt="">
                </li>
                <li class="item"><img src="${url}/img/clients/12.png" alt="">
                </li>
            </ul>
            <!--/end owl-carousel-->
        </div>
        <!--=== End Sponsors ===-->
    </body>
</html>
