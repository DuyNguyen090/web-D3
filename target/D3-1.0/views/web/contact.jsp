<%-- 
    Document   : contact
    Created on : Jun 10, 2020, 10:24:41 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <!--=== Breadcrumbs v4 ===-->
        <div class="breadcrumbs-v4">
            <div class="container">
                <span class="page-name">Sản Phẩm</span>
                <h1>
                    Nhóm <span class="shop-green">D3</span>
                </h1>
                <ul class="breadcrumb-v4-in">
                    <li><a href="${pageContext.request.contextPath }/home">Trang chủ</a></li>
                    <li class="active">Liên hệ</li>
                </ul>
            </div>
            <!--/end container-->
        </div>
        <!--=== End Breadcrumbs v4 ===-->
        <div class="container">

            <div class="page-titles text-center">
                <br/>
                <h1>Liện hệ với chúng tôi</h1>
                <br/>

            </div>
            <div class="container">
                <div class="row row-info-contact">
                    <div class=" col-sm-4">
                        <div class="panel-heading panel panel-default" style="text-align: center">
                            <h2><i class="fa fa-phone"></i> Hotline</h2>
                            <p><a href="tel:0343071475">0343071475</a></p>
                        </div>
                    </div>
                    <div class=" col-sm-4">
                        <div class="panel-heading panel panel-default" style="text-align: center">
                            <h2><i class="fa fa-envelope"></i> Email</h2>
                            <p><a href="mailto:info@charmeperfume.com">16520305@gm.uit.edu.vn</a></p>
                        </div>
                    </div>
                    <div class=" col-sm-4">
                        <div class="panel-heading panel panel-default" style="text-align: center">
                            <h2><i class="fa fa-globe"></i> Website</h2>
                            <p><a href="<c:url value='/home'/>">www.D3.vn</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="row" >
                <br/>
                <br/>
                <div class="col-sm-6 md-6">
                    <hr/>
                    <p><i class="fa fa-arrow-right"></i> Địa chỉ: Trường Đại Học Công Nghệ Thông Tin - Đại Học Quốc Gia TP.HCM</p>
                    <hr/>
                    <p><i class="fa fa-arrow-right"></i> Hoặc điền đầy đủ thông tin dưới đây và gửi cho Charme Perfume, chúng tôi sẽ liên lạc với quý khách trong thời gian sớm nhất.</p>
                    <hr/>
                </div>
                <div class="form-contactus col-sm-6 md-6" style=" padding: 0 50px 0 50px; background-color: #a7c9d475" >
                    <br/>
                    <div class="heading heading-v1 margin-bottom-20">
                        <h2 style="color: black">Liên hệ</h2>
                    </div>
                    <p>${alert}</p>
                    <form action="contact" method="post" class="form-contact-us" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Họ và tên:   </label>
                            <input type="text" class="form-control" name="name" placeholder="Họ và tên" required>
                        </div>
                        <div class="form-group">
                            <label>Email:   </label>
                            <input type="email" class="form-control" name="email"  placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại:   </label>
                            <input type="tel"  class="form-control"  name="tel"  placeholder="Điện thoại" maxlength="15"  required>
                        </div>
                        <div class="form-group">
                            <label>Nội dung:   </label>
                            <textarea class="form-control" name="message" rows="5" placeholder="Nội dung" required></textarea>
                        </div>
                        <div class="form-group" style="text-align: center"> 
                            <button class="btn btn-default " style="background:#783cbb75; " type="submit" name="send">Liên hệ</button>
                        </div>
                    </form>
                </div>
            </div>
            <br/>

            <div style="padding: 50px " class="col-sm-12 md-12  ">
                <div class="heading heading-v1 margin-bottom-20">
                    <h2>Bản đồ vị trí của shop</h2>
                </div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2323596338038!2d106.8016194153346!
                        3d10.869923660432034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527587e9ad5bf%3A0xafa66f9c8be3c91!
                        2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2jhu4cgVGjDtG5nIHRpbiDEkEhRRyBUUC5IQ00!5e0!3m2!1svi!2s!4v1591802878953!5m2!1svi!2s" 
                        width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
    </body>
</html>
