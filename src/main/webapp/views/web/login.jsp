<%-- 
    Document   : login
    Created on : Jun 11, 2020, 9:01:27 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Đăng Nhập</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span> 
                </h1>
                <ul class="breadcrumb-v4-in">
                     <li><a href="${pageContext.request.contextPath }/home">Trang chủ</a></li>
                    <li class="active">Đăng nhập</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Login ===-->
        <div class="log-reg-v3 content-md">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 md-margin-bottom-50">
                        <h2 class="welcome-title">Chào mừng đến với WebShop D3</h2>
                        <p>Đây là trang web hàng đầu về nước hoa nhập khẩu, luôn đem đến cho khách hàng những sản phẩm chính hãng, chất lượng. Được tin tưởng sử dụng từ năm 19xx.  </p>
                        <br>
                        <div class="info-block-v2">
                            <i class="icon icon-layers"></i>
                            <div class="info-block-in">
                                <h3>Chất lượng quốc tế</h3>
                                <p>Nước hoa của D3 mang tới một mùi hương mang phong vị đặc trưng cá biệt và lôi cuốn cho phái nữ. Kết hợp của phong cách phóng khoáng và vẻ cổ điển nhưng lại trẻ trung năng động</p>
                            </div>
                        </div>
                        <div class="info-block-v2">
                            <i class="icon icon-settings"></i>
                            <div class="info-block-in">
                                <h3>Trợ giúp kịp thời</h3>
                                <p>
                                    Shop nước hoa D3 cam kết phục vụ quý khách hàng 24/7
                                </p>
                            </div>
                        </div>
                        <div class="info-block-v2">
                            <i class="icon icon-paper-plane"></i>
                            <div class="info-block-in">
                                <h3>Giao hàng miễn phí và nhanh chóng</h3>
                                <p>Với hệ thống các cửa hàng rộng khắp đất nước. chúng tôi cam kết dịch vụ giao hàng tới quý khách luôn được đảm bảo về thời gian cũng như chất lượng sản phẩm</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <form id="sky-form1" class="log-reg-block sky-form" action="login"
                              method="post">
                            <h2>Đăng Nhập</h2>
                            <h3 style="color: red">${alert }</h3>


                            <section>
                                <label class="input login-input">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" placeholder="User name" name="username"
                                               class="form-control">
                                    </div>
                                </label>
                            </section>
                            <section>
                                <label class="input login-input no-border-top">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password" placeholder="Password" name="password"
                                               class="form-control">
                                    </div>
                                </label>
                            </section>
                            <div class="row margin-bottom-5">
                                <div class="col-xs-6">
                                    <label class="checkbox"> <input type="checkbox"
                                                                    name="checkbox" /> <i></i> Lưu tài khoản
                                    </label>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <a href="#">Quên mật khẩu</a>
                                </div>
                            </div>
                            <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20"
                                    type="submit">Đăng Nhập</button>

                           
                        </form>

                        <div class="margin-bottom-20"></div>
                        <p class="text-center">
                           Bạn chưa có tài khoản? Vui lòng <a
                                href="${pageContext.request.contextPath }/register">Đăng ký</a> tại đây
                        </p>
                    </div>
                </div>
                <!--/end row-->
            </div>
            <!--/end container-->
        </div>
        <!--=== End Login ===-->

        
    </body>
</html>
