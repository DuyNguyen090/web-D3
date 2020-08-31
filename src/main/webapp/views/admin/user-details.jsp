<%-- 
    Document   : order-details
    Created on : Jun 8, 2020, 8:45:33 AM
    Author     : DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <div style="text-align: center">
            <h3>Thông tin khách hàng</h3>
            <br/>
            <br/>
        </div>

        <div class="container" >

            <div class="row col-xs-12">
                <div class="col-xs-6 md-6">
                    <c:url value="/table/user-details-edit" var="edit"></c:url>
                    <form role="form" action="${edit }" method="post"
                          enctype="multipart/form-data" >    
                        <input name="id" value="${ud.id}"  hidden="">
                        <div class="form-group">
                            <label>Tên Tài khoản:</label> 
                            <input class="form-control" name="username" value="${ud.user.username}" disabled="" />
                        </div>
                        <div class="form-group">
                            <label>Tên Khách hàng:</label> 
                            <input class="form-control" name="fullName" value="${ud.fullName}"/>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại:</label> 
                            <input class="form-control" name="tel" value="${ud.tel}"  type="number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==15) return false;"/>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ:</label> 
                            <br/>
                            <textarea style="width: 100%" rows="3" cols="250" name="address" id="editer" >${ud.address}</textarea>
                        </div>
                        <button type="submit" class="btn btn-default">Save</button>
                    </form>
                </div>
                <div class="col-xs-6 md-6" style="text-align: right">
                    <img width="60%" height="300" src="<c:url value='/Images/${ud.user.avatar}'/>">      
                </div>
            </div> 
        </div>

    </body>
</html>