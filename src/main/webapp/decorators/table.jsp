<%-- 
    Document   : table
    Created on : Jun 8, 2020, 12:26:11 PM
    Author     : DUY
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
        <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />
        <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
        <link rel="stylesheet"
              href="<c:url value='/template/table/bootstrap.min.css'/>">
   
        <link rel="stylesheet" href="<c:url value='/template/table/style.css'/>">
    </head>
    <body>

        <div class="main-container" id="main-container">
            <!-- Preloader Start -->
            <div id="preloader-active">
                <div class="preloader d-flex align-items-center justify-content-center">
                    <div class="preloader-inner position-relative">
                        <div class="preloader-circle"></div>
                    </div>
                </div>
            </div>
            <!-- Preloader Start -->
            <script type="text/javascript">
                try {
                    ace.settings.check('main-container', 'fixed')
                } catch (e) {
                }
            </script>
            <br/>
            <dec:body/>
        </div>
        <script src="<c:url value='/template/table/jquery-1.12.4.min.js'/>"></script>
        <script src="<c:url value='/template/table/main.js'/>"></script>
    </body>
</html>
