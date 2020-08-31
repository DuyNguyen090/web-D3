<%-- 
    Document   : web
    Created on : May 27, 2020, 1:16:37 PM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Trang chủ" /></title>
        <link rel="icon" href="<c:url value='/template/web/img/icon-logo.png'/>" type="image/gif" sizes="16x16">
        <!-- CSS here -->
        <link rel='stylesheet' type='text/css'
              href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

        <!-- CSS Global Compulsory -->

        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/bootstrap/css/bootstrap.min.css'/>">
        <link rel="stylesheet" href="<c:url value='/template/web/css/shop.style.css'/>">

        <!-- CSS Header and Footer -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/headers/header-v5.css'/>">
        <link rel="stylesheet" href="<c:url value='/template/web/css/footers/footer-v4.css'/>">

        <!-- CSS Implementing Plugins -->
        <link rel="stylesheet" href="<c:url value='/template/web/plugins/animate.css'/>">
        <link rel="stylesheet" href="<c:url value='/template/web/plugins/line-icons/line-icons.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/font-awesome/css/font-awesome.min.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/scrollbar/css/jquery.mCustomScrollbar.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/owl-carousel/owl-carousel/owl.carousel.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/revolution-slider/rs-plugin/css/settings.css'/>">

        <!-- CSS Theme -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/theme-colors/default.css'/>"
              id="style_color'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/sky-forms-pro/skyforms/css/sky-forms.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css'/>">
        <link rel="stylesheet"
              href="<c:url value='/template/web/plugins/master-slider/quick-start/masterslider/style/masterslider.css'/>">
        <link rel='stylesheet'
              href="<c:url value='/template/web/plugins/master-slider/quick-start/masterslider/skins/default/style.css'/>">
        <!-- CSS Customization -->
        <link rel="stylesheet" href="<c:url value='/template/web/css/custom.css'/>">
    </head>
    <body>

        <script>
            (function (s, u, b, i, z) {
                u[i] = u[i] || function () {
                    u[i].t = +new Date();
                    (u[i].q = u[i].q || []).push(arguments);
                };
                z = s.createElement('script');
                var zz = s.getElementsByTagName('script')[0];
                z.async = 1;
                z.src = b;
                z.id = 'subiz-script';
                zz.parentNode.insertBefore(z, zz);
            })(document, window, 'https://widget.mysubiz.com/static/js/app.js', 'subiz');
            subiz('setAccount', 'acqrwdpraiuqqsbykqtv');
        </script>
        
    <body class="header-fixed">
        <div class="wrapper">

            <!-- Header Start -->
            <div class="header-v5 header-static">
                <!-- Topbar v3 -->

                <%@ include file="/common/web/topbar.jsp" %>
                <!-- End Topbar v3 -->

                <!-- Navbar -->

                <%@ include file="/common/web/navbar.jsp" %>

                <!-- End Navbar -->
            </div>
            <!-- Header End -->
            <main>
                <dec:body/>
            </main>
            <footer>

                <!-- Footer Start-->
                <%@ include file="/common/web/footer.jsp" %>
                <!-- Footer End-->

            </footer>

        </div>

    </body>

    <!-- JS here -->
    <!-- All JS Custom Plugins Link Here here -->
    <script src="<c:url value='/template/web/plugins/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/template/web/plugins/jquery/jquery-migrate.min.js'/>"></script>
    <script src="<c:url value='/template/web/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- JS Implementing Plugins -->
    <script src="<c:url value='/template/web/plugins/back-to-top.js'/>"></script>
    <script src="<c:url value='/template/web/plugins/smoothScroll.js'/>"></script>
    <script src="<c:url value='/template/web/plugins/jquery.parallax.js'/>"></script>
    <script src="<c:url value='/template/web/plugins/owl-carousel/owl-carousel/owl.carousel.js'/>"></script>
    <script
    src="<c:url value='/template/web/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js'/>"></script>
    <script
    src="<c:url value='/template/web/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js'/>"></script>
    <script
    src="<c:url value='/template/web/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js'/>"></script>
    <!-- JS Customization -->
    <script src="<c:url value='/template/web/js/custom.js'/>"></script>
    <script src="<c:url value='/template/web/js/forms/product-quantity.js'/>"></script>
    <!-- JS Page Level -->
    <script src="<c:url value='/template/web/js/shop.app.js'/>"></script>
    <script src="<c:url value='/template/web/js/plugins/owl-carousel.js'/>"></script>
    <script src="<c:url value='/template/web/js/plugins/revolution-slider.js'/>"></script>
    <script>
            jQuery(document).ready(function () {
                App.init();
                App.initScrollBar();
                App.initParallaxBg();
                OwlCarousel.initOwlCarousel();
                RevolutionSlider.initRSfullWidth();
            });

    </script>
</script>

</body>
</html>
