<%@page import="com.pbl3.model.User_TestsModel"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.pbl3.model.TestsModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Study TOEIC</title>
    <style>
        <%@ include file="../../../assets/css/base.css" %>
        <%@ include file="../../../assets/css/style-tests.css" %>
    </style>
    <style>
    	.header .inner-main ul .de-thi {
       		color: var(--color-one);
      	 }
    </style>
</head>
<body>
	<%@include file="../re-use/header.jsp" %>
		
		 <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-main">
                        <h2 class="inner-title">Đề Thi</h2>
                        <div class="inner-bar"></div>
                        <p class="inner-desc">Chúng tôi cung cấp bộ đề thi thử sát với thực tế và tài liệu học tập phong phú, giúp bạn chuẩn bị tốt nhất cho các kỳ thi tiếng Anh quốc tế.</p>
                        <div class="inner-button">
                            <!-- <div class="button-two button-1">
                                    <a href="#"class="button1">Khóa Học</a>
                            </div> -->
                            <div class="button-two button-2">
                                    <a class="button2" method="post">Làm Đề Thi</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		
	    <div class="tests">
        <div class="container">
            <div class="row">
            	<% LinkedList<User_TestsModel> testsModels = (LinkedList<User_TestsModel>) request.getAttribute("testsModels");
            	if(testsModels != null) {
                for (User_TestsModel t : testsModels) if(t.getStatus()){ %>
                <div class="col-xl-3">
                    <a href="/MVC/tests/guide?testsID=<%= t.getTestsID()%>">
                        <div class="inner-wrap">
                            <div class="inner-img">
                                <img src="https://images.unsplash.com/photo-1513258496099-48168024aec0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="listvocab">
                            </div>
                            <div class="inner-content">
                                <h3 class="inner-listname">
                                    <%=t.getTestName() %>
                                </h3>  
                                <!-- <p class="inner-number">số lượng</p> -->
                            	<div class="link">
                            		<a href="/MVC/tests/guide?testsID=<%= t.getTestsID() %>"> 
										<button class="button-detail">
											Xem Chi Tiết
										</button>
									</a>
                            	</div>
                            </div>
                            <div class="inner-number">
                            <p style="display: flex;
    justify-content: space-between;"> 
                            <span><i class="fa-solid fa-user-pen"></i> <%=t.getCountUser()%></span> 
                            <span> Lượt thi: <%=t.getCountTimes()%></span>
                            </p>
                            </div>
                        </div>
                    </a>
                </div>
                   <% }
            } else { %>
             <p>Không có dữ liệu để hiển thị.</p>
            <% } %>
            </div>
        </div>
    </div>
	<%@include file="../re-use/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>
