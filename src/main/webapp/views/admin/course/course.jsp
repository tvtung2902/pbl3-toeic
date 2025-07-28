<%@page import="com.pbl3.libs.Pair"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		<%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>
        <%@ include file="../../../assets/admin-css/styleCard.css" %>
	</style>  
</head>
   
<body>
<style>
.menu .item li:nth-child(2) a{
    color: var(--color-one);
}
.menu .item li:nth-child(2) i{
    color: var(--color-one);
}</style>
		 <!-- Menu sidebar --> 
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->  
    
        <div class="main" id="main">
        <div class="container">  
        <div class="wrap-background">
            <h2 class="name">Quản Lí Khóa Học</h2> 
            <%if(request.getAttribute("error") != null){ %>
            	<h3 style="color: red; text-align: center"><%=request.getAttribute("error")%></h3>
            <%} %>      
             <div class="inner-search">
                <a href="/MVC/admin/course/create" class="add-btn">Thêm Mới</a>
				<form action="/MVC/admin/course" style="display: flex;">
					<div class="search">
						<i class="fa fa-search"></i> <input
							value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>"
							name="keyword">
					</div>
					<button class="add-btn" type="submit" style="margin-left: 10px">Search</button>
				</form>
            </div>
            <div class="row">
            <%for(Pair<CourseModel, Integer> c : (LinkedList<Pair<CourseModel, Integer>>)request.getAttribute("courseModels")){%>
                <div class="col-xl-4">
                    <a href="#">
                        <div class="inner-main">
                            <div class="inner-img">
                                <img class="img-fluid" src="/MVC/<%=c.getFirst().getImage()%>" alt="anh mo ta">
                                <div class="inner-price">
                                    <%=c.getFirst().getPriceCH()%>
                                </div>
                            </div>
                            <h2 class="inner-title"><%=c.getFirst().getCourseName()%></h2>
                            <%if(c.getFirst().getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=c.getFirst().getInput() %>+ và mục tiêu đạt điểm <%=c.getFirst().getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=c.getFirst().getTarget() %>+</p>
                            <%} %>
                            <div class="inner-quality">
                                <p class="quality">Số lượng học viên: <%=c.getSecond() %></p>
                            </div>
                         <div class="button"> 
                                <a href="/MVC/admin/course/edit?courseID=<%=c.getFirst().getCourseID()%>" class="btn-edit"><i class="fa-regular fa-pen-to-square"></i></a>
                                <a style="cursor: pointer;" class="btn-delete"data-toggle="modal" data-target="#delete-vocab<%=c.getFirst().getCourseID() %>" ><i class="fa-solid fa-trash-can"></i></a>
                                           <form
                                                action="/MVC/admin/course/delete?courseID=<%=c.getFirst().getCourseID()%>"
                                                method="post">
                                                          <div class="modal-delete-vocab">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="delete-vocab<%=c.getFirst().getCourseID() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn xóa khóa học này?
													            </div>
													            <div class="modal-footer">
													              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
													              <button type="submit" class="btn btn-danger">Xóa</button>
													            </div>
													          </div>
													        </div>
													      </div>
													    </div>
                                           	 </form>
                            </div>  
                        </div>
                    </a>
                </div>
                				<%} %>
            </div>
            </div>
    </div>
</div>

    <!-- end main -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>
    <script>
    function closefunc() {
        const menu = document.getElementById("menu");
        const main = document.getElementById("main");
        menu.style.left = "-210px";
        main.style.marginLeft = "0";
        main.style.width = "100%"
        document.getElementById("close-btn").classList.add("hidden");
        document.getElementById("open-btn").classList.remove("hidden");
    }
    function openfunc() {
        const menu = document.getElementById("menu");
        const main = document.getElementById("main");
        menu.style.left = "0"; 
        main.style.marginLeft = "250px";
        main.style.width = "calc(100% - 250px)"
        document.getElementById("open-btn").classList.add("hidden");
        document.getElementById("close-btn").classList.remove("hidden");
    }
    </script>


</body>

</html>