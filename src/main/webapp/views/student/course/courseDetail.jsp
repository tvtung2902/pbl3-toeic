<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.pbl3.model.LessionModel"%>
<%@page import="com.pbl3.model.PartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pbl3.service.CourseService"%>
<%@page import="com.pbl3.libs.Pair"%>
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
    
     <style>
    	<%@include file="../../../../assets/css/base.css"%>
    	 <%@include file="../../../../assets/css/styleCourseDetail.css"%>  
    	 
    footer .container{
        max-width: 1296px;
    }
       
    </style> 
  </head>
  <body>
    <!-- header  -->
	<%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
    
    <%	
    	CourseModel courseModel= (CourseModel)request.getAttribute("courseModel");
    	UserModel teacher= (UserModel)request.getAttribute("teacher");
    	ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList= (ArrayList<Pair<PartModel,LinkedList<LessionModel>>>)request.getAttribute("arraylist");
   		String status=(String)request.getAttribute("statusString");
   		System.out.printf("trạng thái:"+status);
    	%>
  
     <!-- welcome -->
    <div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-main">
                        <h2 class="inner-title"><%=courseModel.getCourseName() %></h2>
                        <div class="inner-bar"></div>
                       <%if(courseModel.getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=courseModel.getInput() %>+ và mục tiêu đạt điểm <%=courseModel.getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=courseModel.getTarget() %>+</p>
                            <%} %>
                        </p>
                        <p class="inner-desc">Chúng tôi cung cấp các khóa học TOEIC từ trình độ căn bản đến nâng cao, phù hợp với nhiều mục tiêu đầu ra khác nhau như 450+, 600+, 750+ và 900+. Khóa học được thiết kế bài bản, bám sát cấu trúc đề thi thật, giúp học viên phát triển toàn diện kỹ năng nghe và đọc, từ vựng, ngữ pháp, cũng như chiến lược làm bài hiệu quả.</p>
                        <div class="inner-button">
                            <!-- <div class="button-two button-1">
                                    <a href="#"class="button1">Khóa Học</a>
                            </div> -->
                            <div class="button-two button-2">
                                <a class="button2" id="overreview-button" method="post">Xem Chi Tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End welcome -->


    <div class="course-detail">
        <div class="container">
            <div class="row">
                <div class="col-xl-8">
                    <div class="row">
                        <div class="col-12">
                            <div class="inner-content">

                                <!-- header-tab  -->
                                <div class="inner-head">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="overreview-tab" data-toggle="tab"
                                                data-target="#overreview" type="button" role="tab"
                                                aria-controls="overreview" aria-selected="true">Tổng quan</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="lession-tab" data-toggle="tab"
                                                data-target="#lession" type="button" role="tab" aria-controls="lession"
                                                aria-selected="false">Chương trình học</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="teacher-tab" data-toggle="tab"
                                                data-target="#teacher" type="button" role="tab" aria-controls="teacher"
                                                aria-selected="true">Giảng viên</button>
                                        </li>
                                    </ul>
                                </div>
                                <!-- content-tab  -->

                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="overreview" role="tabpanel"
                                        aria-labelledby="profile-tab">
                                        <p><%=courseModel.getCourseDesc() %></p>
                                    </div>
                                    <div class="tab-pane fade" id="lession" role="tabpanel"
                                        aria-labelledby="lession-tab">
                                        <p>
                                        <div class="accordion" id="accordionExample">
						<% for(int i=1;i<=7;i++){ %>
											  <div class="card">
                                                <div class="card-header" id="headingOne">
                                                    <h2 class="mb-0">
                                                        <button class="btn btn-link btn-block text-left" type="button"
                                                            data-toggle="collapse" data-target="#part<%=i%>"
                                                            aria-expanded="true" aria-controls="part<%=i%>">
                                                            Part <%=i%>: <%=arrayList.get(i).getFirst().getPartName() %>
                                                        </button>
                                                    </h2>
                                                </div>

                                                <div id="part<%=i%>" class="collapse" aria-labelledby="headingOne"
                                                    data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <div class="part<%=i%>-body">
                                                        <%if(arrayList.get(i).getSecond().get(0)==null){ %>
                                                        	<div class="inner-wrap">
                                                                <p class="check-lock">Chưa có bài học nào</p>
                                                            </div>
														<%}
                                                        else{
														for(LessionModel lessionModel:(arrayList.get(i).getSecond())){ %>
														     <div class="inner-wrap">
                                                                <p class="check-lock">Bài <%=lessionModel.getOrderNumber() %>: <%=lessionModel.getLessionName() %></p>
                                                          <ul>
                                                          
                                                          			<%if(lessionModel.getVideo() !=null){ %>
                                                                    <li>
                                                                        <a href="/MVC/course/course-detail/learn?lessionID=<%=lessionModel.getLessionID()%>" class="check"><strong>Lý thuyết: </strong> 
                                                                            video bài giảng</a>
                                                                    </li> 
                                                                    <%}%>
																	<%if(lessionModel.getExercise() != null){ %>
																	<li>
																	
                                                                        <a href="/MVC/<%=lessionModel.getExercise()%>?lessionID=<%=lessionModel.getLessionID()%>" class="check"><strong>Luyện tập: </strong> Bài tập về: <%=lessionModel.getLessionName()%></a>
                                                                    </li> 
																	<%} %>
																<%if(lessionModel.getVocabListsModel()!=null){ %>
																    <li>
                                                                        <a href="/MVC/course/course-detail/vocab-lists/vocab?lessionID=<%=lessionModel.getLessionID()%>" class="check"><strong>Từ vựng: </strong><%=lessionModel.getVocabListsModel().getNameList() %></a>
                                                                    </li>
																<%} %>
                                                                </ul>
                                                            </div>
														<%}} %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
						<%} %>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="teacher" role="tabpanel"
                                        aria-labelledby="teacher-tab">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="inner-teacher">
                                                    <div class="inner-img">
                                                        <img src="/MVC/<%=teacher.getImage()%>"
                                                            alt="gn">
                                                    </div>
                                                    <div class="inner-main">
                                                        <div class="inner-name"><%=teacher.getName() %></div>
                                                        <%if(teacher.getDescription() != null ){ %>
                                                        <div class="inner-desc"><%=teacher.getDescription()%></div>
                                                        <%} %>
                                                        <div class="inner-email">
                                                            <i class="fa-regular fa-envelope"></i>
                                                            <span><%=teacher.getEmail() %></span>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="inner-buy" id="button-buy">
                                <div class="inner-button">
                                    <div class="button-two button-1">
                                        <a href="/MVC/course/course-detail/pay?action=buy&courseID=<%=courseModel.getCourseID() %>" class="button1">Mua Khóa Học</a>
                                    </div>
                                    <!-- <div class="button-two button-2">
                                            <a href="#"class="button2" method="post"></a>
                                    </div> -->
                                </div>
                            </div>
                            <div class="inner-buy hidden" id="button-extend">
                                <div class="inner-button">
                                    <div class="button-two button-1">
                                        <a href="/MVC/course/course-detail/pay?action=extend&courseID=<%=courseModel.getCourseID()%>" class="button1">Gia hạn</a>
                                    </div> 
                                    <!-- <div class="button-two button-2">
                                            <a href="#"class="button2" method="post"></a>
                                    </div> -->
                                </div> 
                            </div>
							<p class="hidden"id="waiting">Đang chờ xác nhận </P>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-sidebar">
                        <div class="inner-title">
                            <h3>Khóa học gần đây</h3>
                        </div>
                        <div class="inner-content">
          					<ul>
                        	<%for(CourseModel c : (LinkedList<CourseModel>)request.getAttribute("courseModels")){ %>
                        	    <a href="/MVC/course/course-detail?courseID=<%=c.getCourseID()%>"> 
                        		<li class="single-course row">
                        			<div class= "image col-3">
                        				<img alt="anh" src="/MVC/<%=c.getImage()%>">
                        			</div>
                        			<div class="name col-9">
                
                        				<h6><%=c.getCourseName() %></h6>	
                        			</div>
                        		</li>
                        		</a>
                        		<%} %>
                        	</ul> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- <footer> -->
          <%@include file="../re-use/footer.jsp" %>
            </footer>
            <!-- end footer -->

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
    <script>
        <%if(status.equals("isRegister")){%>
        document.getElementById("button-buy").classList.add("hidden");
        <%}%>
        
        <%if(status.equals("outTime")){%>
        document.getElementById("button-buy").classList.add("hidden");
        document.getElementById("button-extend").classList.remove("hidden");
        <%}%>
        
        <%if(!status.equals("isRegister")){%>
        var divElements = document.getElementsByClassName("check");
        for (var i = 0; i < divElements.length; i++) {
            var div = divElements[i];
                div.classList.add("disabled"); // Thêm lớp 'disabled'
        }
        var divElements = document.getElementsByClassName("check-lock");
        for (var i = 0; i < divElements.length; i++) {
        var div = divElements[i];
        var icon = document.createElement("i");
	    icon.classList.add("fa-solid", "fa-lock");
        div.appendChild(icon); 
        }
        <%}%>
        
        <%if(status.equals("waiting")){%>
        document.getElementById("button-buy").classList.add("hidden");
        document.getElementById("waiting").classList.remove("hidden");
        <%}%>




        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('hidentop');
                }
                else
                    $('header').removeClass('hidentop');
            });
        });
    </script>
  </body>
</html>