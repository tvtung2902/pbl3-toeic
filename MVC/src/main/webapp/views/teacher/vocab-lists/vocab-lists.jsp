<%@page import="com.pbl3.model.VocabListsModel"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="com.pbl3.model.CouponModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.LinkedList"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý khóa học</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
  <body>
  <style> 
        <%@ include file="../../../assets/teacher-css/base.css" %>
    	<%@ include file="../../../assets/teacher-css/style.css" %>
      	<%@include file = "../../../assets/css/style-vocablists.css"%>
.menu .item li:nth-child(2) a{
    color: var(--color-one);
}
.menu .item li:nth-child(2) i{
    color: var(--color-one);
}
.search{
margin:0 !important;
}
.container{
max-width: 90%;
padding:0;
}
a{
color:black;
}
a:hover p, a:hover i{
color:var(--color-one);
}

  </style>
	    <!-- menu  -->
	 <%@include file="../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">
        <div class="container wrap-background"> 
            <h2 class="name">Danh sách từ vựng</h2>  
                    <div class="list-vocab" style="margin-top:0; padding: 0">
            <div class="row"> 
                <div class="col-xl-3">
                    <!-- Button trigger modal -->
                    <a class="button-add" data-toggle="modal" data-target="#add-listvocab">
                        <div class="inner-wrap inner-add" style="min-height: 200px;">
                        <i class="fa-solid fa-plus"></i>
                        <p>Thêm danh sách</p>
                        </div>   
                    </a>
                             <!-- Modal -->
                            <div class="modal fade modal-form" id="add-listvocab" tabindex="-1"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    <div class="modal-header">
                                        <h5 class="inner-title" id="add-listvocab">Thêm danh sách</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="/MVC/teacher/vocab-lists/create">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="ten">Tên danh sách*:</label>
                                                        <input id="ten" name="name" type="text" required>
                                                        <label for="mo-ta">Mô tả:</label>
                                                        <textarea id="mo-ta" name="desc"></textarea>
                                                        <label for="anh">Ảnh mô tả:</label>
                                                        <input id="anh" type="file" name="pic">
                                                        <button class="button">Thêm</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            <%
			int i = 0;
			%>
			<%
			for (VocabListsModel v : (LinkedList<VocabListsModel>) request.getAttribute("vocabListsModels")) {
			%>
                <div class="col-xl-3">
                    <a href="/MVC/teacher/vocab-lists/vocab?listID=<%=v.getListID()%>">
                        <div class="inner-wrap" style="min-height: 200px;">   
                            <div class="inner-img">
                                <img src="https://images.unsplash.com/photo-1581447109200-bf2769116351?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="listvocab">
                            </div>
                            <div class="inner-content" style="margin-bottom: 0">
                                <h3 class="inner-listname">
                                    <%=v.getNameList()%>
                                </h3>
                                <p class="inner-desc"><%=v.getDescription()%></p>
                                <!-- <p class="inner-number">số lượng</p> -->  
                            </div>
                        </div>
                    </a> 
                </div>
             <%
 				}
 			 %>
            </div>
    </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>
 