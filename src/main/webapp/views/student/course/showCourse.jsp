<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.service.CourseService"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Study TOIEC</title>
  </head>
  <body>

    <style>
    	<%@include file="../../../../assets/css/base.css"%>
    	 <%@include file="../../../../assets/css/styleCourse.css"%> 
    	
        .header .main-header .khoa-hoc{
            color: var(--color-one);
        }
    footer .container{
        max-width: 1296px;
    }
      
    </style>
    <!-- header  -->
	<%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
    
    	<!-- welcome -->
    <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-main">
                        <h2 class="inner-title">Khóa Học</h2>
                        <div class="inner-bar"></div>
                        <p class="inner-desc">Chúng tôi cung cấp các khóa học TOEIC từ trình độ căn bản đến nâng cao, phù hợp với nhiều mục tiêu đầu ra khác nhau như 450+, 600+, 750+ và 900+. Khóa học được thiết kế bài bản, bám sát cấu trúc đề thi thật, giúp học viên phát triển toàn diện kỹ năng nghe và đọc, từ vựng, ngữ pháp, cũng như chiến lược làm bài hiệu quả.
                        </p>
                        <div class="inner-button">
                            <!-- <div class="button-two button-1">
                                    <a href="#"class="button1">Khóa Học</a>
                            </div> -->
                            <div class="button-two button-2">
                                    <a class="button2" method="post">Xem Khóa Học</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--end welcome -->

    <!-- course -->
    <div class="course">
        <div class="container">
            <div class="row">
            <%
            int i = 0;
            LinkedList<Pair<CourseModel,Integer>> list=(LinkedList<Pair<CourseModel,Integer>>)request.getAttribute("courseModels");
			
            for (Pair<CourseModel,Integer> c :list) {
			%>
                <div class="col-xl-4">
                    <a href="/MVC/course/course-detail?courseID=<%=c.getFirst().getCourseID()%>">
                        <div class="inner-wrap">
                            <div class="inner-img">
                                <img src="/MVC/<%=c.getFirst().getImage()%>" alt="picCourse">
                               <div class="inner-price">  
                                    <%=c.getFirst().getPriceCH()%>
                                </div>
                            </div>
                            <div class="inner-content">
                                <h3 class="inner-name">
                                    <%=c.getFirst().getCourseName() %>
                                </h3>
                                <%if(c.getFirst().getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=c.getFirst().getInput() %>+ và mục tiêu đạt điểm <%=c.getFirst().getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=c.getFirst().getTarget() %>+</p>
                            <%} %> 
                            </div>
                            <div class="inner-number">
                                <p>
								Số lượng học viên: <%=c.getSecond() %>                     
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
	<%
	i++;
	} %>
            </div>
        </div>
    </div>
    <!-- end course -->
        <!-- <footer> -->
        <%@include file="../re-use/footer.jsp" %>
            <!-- end footer -->

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
    <script>
        $(document).ready(function(){
            $(window).scroll(function(){
                if($(this).scrollTop()){
                    $('header').addClass('hidentop');
                }
                else
                $('header').removeClass('hidentop');
            });
        });
    </script>
  </body>
</html>