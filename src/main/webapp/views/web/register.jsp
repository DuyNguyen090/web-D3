<%-- 
    Document   : register
    Created on : Jun 13, 2020, 5:19:03 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Đăng Ký</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span> 
                </h1>
                <ul class="breadcrumb-v4-in">
                     <li><a href="${pageContext.request.contextPath }/home">Trang chủ</a></li>
                    <li class="active">Đăng ký</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->

        <!--=== Registre ===-->
        <div class="log-reg-v3 content-md margin-bottom-30">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 md-margin-bottom-50">
                        <h2 class="welcome-title">Chào mừng đến với WebShop D3</h2>
                        <p>Đây là trang web hàng đầu về nước hoa nhập khẩu, luôn đem đến cho khách hàng những sản phẩm chính hãng, chất lượng. Được tin tưởng sử dụng từ năm 19xx  </p>
                        <br>
                        <div class="row margin-bottom-50">
                            <div class="col-sm-4 md-margin-bottom-20">
                                <div class="site-statistics">
                                    <span>Hơn 1000</span> <small>sản phẩm</small>
                                </div>
                            </div>
                            <div class="col-sm-4 md-margin-bottom-20">
                                <div class="site-statistics">
                                    <span>Các thương hiệu nổi tiếng</span>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="site-statistics">
                                    <span>Khuyến mãi đến 50%</span> 
                                </div>
                            </div>
                        </div>
                        <div class="members-number">
                            <h3>
                                Hơn  <span class="shop-green">13,000</span> thành viên
                            </h3>
                            <img class="img-responsive" src="${url}/img/map.png" alt="">
                        </div>
                    </div>

                    <div class="col-md-5">
                        <form id="sky-form4" class="log-reg-block sky-form"
                              action="register" method="post">
                            <h2>Đăng Ký</h2>
                            <p style="color: red">${alert}</p>
                            <div class="login-input reg-input">
                                <section>
                                    <label class="input"> <input type="text"
                                                                 name="username" placeholder="Username" class="form-control">
                                    </label>
                                </section>
                                <section>
                                    <label class="input"> <input type="email" name="email"
                                                                 placeholder="Email address" class="form-control">
                                    </label>
                                </section>
                                <section>
                                    <label class="input"> <input type="password"
                                                                 name="password" placeholder="Password" id="password"
                                                                 class="form-control">
                                    </label>
                                </section>
                                <section>
                                    <label class="input"> <input type="password"
                                                                 name="passwordConfirm" placeholder="Confirm password"
                                                                 class="form-control">
                                    </label>
                                </section>
                            </div>
                            </label> <label class="checkbox margin-bottom-20"> <input
                                    type="checkbox" name="checkbox" /> <i></i>Tôi đã đọc đồng ý với các điều khoản và điều kiện</a>
                            </label>
                            <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20"
                                    type="submit">Đăng ký</button>
                        </form>

                        <div class="margin-bottom-20"></div>
                        <p class="text-center">
                            Bạn đã có tài khoản? <a
                                href="${pageContext.request.contextPath }/login">Đăng nhập</a>
                        </p>
                    </div>
                </div>
                <!--/end row-->
            </div>
            <!--/end container-->
        </div>
        <!--=== End Registre ===-->

      
    </body>
</html>
