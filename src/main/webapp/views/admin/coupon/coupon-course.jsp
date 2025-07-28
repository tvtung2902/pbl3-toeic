<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>
        <%@ include file="../../../assets/admin-css/style-create.css" %>
    </style>
</head>

<body>
    <style>
        .menu .item li:nth-child(3) a {
            color: var(--color-one);
        }
        .menu .item li:nth-child(3) i {
            color: var(--color-one);
        }
    </style>
    
     <!-- Menu sidebar --> 
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->

    <div class="main" id="main">
        <div class="container">
        <div class="wrap-background">
        	 <h2 class="name">Áp Dụng Mã Giảm Giá</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên Khóa Học</th>
                        
                        <th scope="col">Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int i = 1;
                    for (Pair<CourseModel, Integer> p : (LinkedList<Pair<CourseModel, Integer>>) request.getAttribute("linkedLists")) { 
                    %>
                    <tr>
                        <td><%= p.getFirst().getCourseID() %></td>
                        <td><%= p.getFirst().getCourseName() %></td>
      
                        <td>
                            <% if (p.getSecond() != null) { %>
                                <form method="post" action="/MVC/admin/coupon-course/delete">
                                    <input type="hidden" name="courseID" value="<%= p.getFirst().getCourseID() %>">
                                    <input type="hidden" name="couponID" value="<%= request.getParameter("couponID") %>">
                                    <button class="cancel-btn" type="submit">Hủy</button>
                                </form>
                            <% } else { %>
                                <form method="post" action="/MVC/admin/coupon-course/create">
                                    <input type="hidden" name="courseID" value="<%= p.getFirst().getCourseID() %>">
                                    <input type="hidden" name="couponID" value="<%= request.getParameter("couponID") %>">
                                    <button class="apply-btn" type="submit">Áp dụng</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <div class="wrap-button" style="display:flex; justify-content: end;">
                <a href="/MVC/admin/coupon" class="btn add-btn back-btn">Quay lại</a>
            </div>
        </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
        function closefunc() {
            const menu = document.getElementById("menu");
            const main = document.getElementById("main");
            menu.style.left = "-210px";
            main.style.marginLeft = "0";
            main.style.width = "100%";
            document.getElementById("close-btn").classList.add("hidden");
            document.getElementById("open-btn").classList.remove("hidden");
        }
        function openfunc() {
            const menu = document.getElementById("menu");
            const main = document.getElementById("main");
            menu.style.left = "0";
            main.style.marginLeft = "250px";
            main.style.width = "calc(100% - 250px)";
            document.getElementById("open-btn").classList.add("hidden");
            document.getElementById("close-btn").classList.remove("hidden");
        }
    </script>
</body>

</html>
