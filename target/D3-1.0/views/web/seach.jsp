<%-- 
    Document   : seach
    Created on : Jun 10, 2020, 12:31:27 PM
    Author     : DUY
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="service.impl.CategoryServiceImpl"%>
<%@page import="service.CategoryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-md-3 filter-by-block md-margin-bottom-60">
    <h1>Tìm kiếm</h1>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne"> Tên sản phẩm <i class="fa fa-angle-down"></i>
                    </a>
                </h2>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <ul class="list-unstyled checkbox-list">


                        <form action="${pageContext.request.contextPath }/product/seach" method="get">
                            <input type="text" name="name" />
                            <input type="submit" value="Tìm kiếm" >

                        </form>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/end panel group-->

    <div class="panel-group" id="accordion-v2">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-v2"
                       href="#collapseTwo"> Danh cho <i
                            class="fa fa-angle-down"></i>
                    </a>
                </h2>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse in">
                <div class="panel-body">
                    <ul class="list-unstyled checkbox-list">
                        <a href="${pageContext.request.contextPath }/product/category?cate_sex=Nam" > Nam</a>
                        <br>
                        <a href="${pageContext.request.contextPath }/product/category?cate_sex=Nữ" > Nữ</a>
                        <br>
                        
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/end panel group-->


    <div class="panel-group" id="accordion-v3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-v3"
                       href="#collapseThree"> Thương hiệu <i
                            class="fa fa-angle-down"></i>
                    </a>
                </h2>
            </div>
            <%
                CategoryService categoryService = new CategoryServiceImpl();
                List<Category> categorys = categoryService.getName();             
            %>
            <div id="collapseThree" class="panel-collapse collapse in">
                <div class="panel-body">
                    <ul class="list-unstyled checkbox-list">
                        <% for (Category category : categorys) {%>
                        <a href="${pageContext.request.contextPath }/product/category?cate_name=<%=category.getName()%>" ><%=category.getName()%> </a>
                        <br>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/end panel group-->



<!--    <div class="panel-group margin-bottom-30" id="accordion-v6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-v6"
                       href="#collapseSix"> Đánh giá <i class="fa fa-angle-down"></i>
                    </a>
                </h2>
            </div>
            <div id="collapseSix" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="stars-ratings stars-ratings-label">
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
                </div>
            </div>
        </div>
    </div>
    /end panel group-->
<a href="<c:url value='/product/list'/>"> <button type="button"
            class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block">Reset</button></a>
</div>