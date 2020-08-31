<%-- 
    Document   : product-detail
    Created on : Jun 10, 2020, 1:29:08 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url value="/template/web" var="url"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Chi tiết sản phẩm</title>
        </head>
        <body>
            <div class="shop-product">
                <!-- Breadcrumbs v5 -->
                <div class="container">
                    <ul class="breadcrumb-v5">
                        <li><a href="${pageContext.request.contextPath }/home"><i class="fa fa-home"></i></a></li>
                    <li><a href="${pageContext.request.contextPath }/product/list">Sản phẩm</a></li>
                    <li class="active">Chi tiết sản phẩm</li>
                </ul>
            </div>
            <!-- End Breadcrumbs v5 -->

            <div class="container">
                <div class="row">
                    <div class="col-sm-6" style="height: 90%">

                        <c:url value="/Images/${product.image }" var="imgUrl"></c:url>
                        <img class="col-md-6" style="width: 100%" src="${imgUrl}"/>
                    </div>


                    <div class="col-md-6">
                        <div class="shop-product-heading">
                            <h2>${product.name }</h2>
                            <ul class="list-inline shop-product-social">

                            </ul>
                        </div>
                        <!--/end shop product social-->

                        <ul class="list-row shop-product-title margin-bottom-30">
                            <li><h3>Thương hiệu: ${product.category.name}</h3></li>
                            <li><h3>Dành cho: ${product.category.sex}</h3></li>
                        </ul>
                        <!--/end shop product ratings-->
                        <h2>Giá sản phẩm:</h2>
                        <br>
                        <ul class="list-inline shop-product-prices margin-bottom-30">
                            <li class="line-through">${product.price * 1.25 }</li>

                            <br/>
                            <li class="shop-red">${product.price } VND</li><li><small class="shop-bg-red time-day-left"> giảm giá </small></li>


                        </ul>
                        <!--/end shop product prices-->

                        <h3 class="shop-product-title">Số lượng</h3>
                        <div class="margin-bottom-40">

                            <form name="f1" class="product-quantity sm-margin-bottom-20"
                                  method="get" action="<c:url value="/cart/add"></c:url>">

                                      <input type="text" value="${product.id }" name="pId" hidden="">

                                  <button type='button' class="quantity-button" name='subtract'
                                          onclick='javascript: subtractQty();' value='-'>-</button>
                                  <input type='text' class="quantity-field" name='quantity'
                                         value="1" id='qty' />
                                  <button type='button' class="quantity-button" name='add'
                                          onclick='javascript: document.getElementById("qty").value++;'
                                          value='+'>+</button>
                                  <button type="submit" class="btn-u btn-u-sea-shop btn-u-lg">Thêm Vào Giỏ Hàng</button>
                            </form>


                        </div>
                        <!--/end product quantity-->

                        <ul class="list-inline add-to-wishlist add-to-wishlist-brd">
                            <br/>
                        </ul>
                        <p class="wishlist-category">
                            <strong>Categories:</strong> <a href="<c:url value='/product/category?cate_name=${product.category.name }'/>">${product.category.name },</a>
                        </p>
                    </div>
                </div>
                <!--/end row-->
            </div>

        </div>
        <!--=== End Shop Product ===-->

        <!--=== Content Medium ===-->
        <div class="content-md container">
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

            <div class="tab-v5">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#description" role="tab"
                                          data-toggle="tab">Mô tả</a></li>
                    <li><a href="#reviews" role="tab" data-toggle="tab">Đánh giá</a></li>
                </ul>

                <div class="tab-content">
                    <!-- Description -->
                    <div class="tab-pane fade in active" id="description">
                        <div class="row">
                            <div class="col-md-7">
                                ${product.des }
                            </div>
                            <div class="col-md-5">
                                <div class="responsive-video">
                                    <iframe src="//player.vimeo.com/video/72343553" frameborder="0"
                                            webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Description -->

                    <!-- Reviews -->
                    <div class="tab-pane fade" id="reviews">
                        <div class="product-comment margin-bottom-40">
                            <div class="product-comment-in">
                                <div class="product-comment-dtl">

                                    <p>Chưa có đánh giá</p>
                                </div>
                            </div>
                        </div>
                        <h3 class="heading-md margin-bottom-30">Add a review</h3>
                        <form action="${url}/php/demo-contacts-process.php" method="post"
                              id="sky-form3" class="sky-form sky-changes-4">
                            <fieldset>
                                <div class="margin-bottom-30">
                                    <label class="label-v2">Tên</label> <label class="input">
                                        <input type="text" name="name" id="name">
                                    </label>
                                </div>

                                <div class="margin-bottom-30">
                                    <label class="label-v2">Email</label> <label class="input">
                                        <input type="email" name="email" id="email">
                                    </label>
                                </div>

                                <div class="margin-bottom-30">
                                    <label class="label-v2">Đánh giá</label> <label class="textarea">
                                        <textarea rows="7" name="message" id="message"></textarea>
                                    </label>
                                </div>
                            </fieldset>

                            <footer class="review-submit">
                                <label class="label-v2">Sao</label>
                                <div class="stars-ratings">
                                    <input type="radio" name="stars-rating" id="stars-rating-5">
                                    <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-4">
                                    <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-3">
                                    <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-2">
                                    <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-1">
                                    <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                                </div>
                                <button type="button"
                                        class="btn-u btn-u-sea-shop btn-u-sm pull-right">Gửi</button>
                            </footer>
                        </form>
                    </div>
                    <!-- End Reviews -->
                </div>
            </div>
        </div>
        <!--/end container-->
        <!--=== End Content Medium ===-->

        <div class="container content-md">

            <!--=== Illustration v2 ===-->
            <div class="illustration-v2 margin-bottom-60">
                <div class="customNavigation margin-bottom-25">
                    <div class="heading heading-v1 margin-bottom-20">
                        <h2>Sản phẩm mới</h2>
                    </div>
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
                                              href="${pageContext.request.contextPath }/product/detail?id=${p.id}"><i
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
                                        <span class="title-price">$ ${p.price }</span>

                                    </div>
                                </div>

                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </div>
            <!--=== End Illustration v2 ===-->
        </div>
    </body>
</html>
