<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.HistoryOfTestModel"%>
<%@page import="com.pbl3.model.Register_CourseModel"%>
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
    	<%@include file="../../../assets/css/base.css"%>
    	 <%@include file="../../../assets/css/styleMyAccount.css"%>
    	
    footer .container{
        max-width: 1296px;
    }
      
    </style>
    <!-- header  -->
	<%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
     <% UserModel user = (UserModel)request.getAttribute("userModel"); 
     ArrayList<Register_CourseModel> courseRegisteds =(ArrayList<Register_CourseModel>)request.getAttribute("courseRegisteds");
     ArrayList<Register_CourseModel> courseWaitings =(ArrayList<Register_CourseModel>)request.getAttribute("courseWaitings");
     %>
    <!-- Profile -->
        <div class="profile">
        <div class="container">
            <div class="inner-banner">
            </div>
            <div class="inner-main">
                <div class="row">
                    <div class="col-12">
                        <div class="inner-img">
                            <img <%if(user.getImage() != null){%>src="/MVC/<%=user.getImage()%>"<%}else{%>src = "https://thumbs.dreamstime.com/b/worried-man-avata-avatar-worried-man-vector-illustration-107469775.jpg" <%} %> alt="avatar">
                        </div>
                            <a href="/MVC/my-account/setting"> 
                                <i class="fa-solid fa-pencil"></i>
                            </a>
                        <h3 class="inner-name"><%=user.getName() %></h3>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <!-- End Profile -->
    
    
        <div class="section-tow">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-tab" data-toggle="tab" data-target="#profile"
                                    type="button" role="tab" aria-controls="profile" aria-selected="true">Khóa học của tôi</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="contact-tab" data-toggle="tab" data-target="#contact" type="button"
                                    role="tab" aria-controls="contact" aria-selected="false">Lịch sử làm đề</button>
                            </li>
                        </ul>
                    </div>


                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <%if(courseWaitings.size()!=0) {%>
                                                    <h3>
                                Các khóa học đang chờ xác nhận:
                            </h3>
                            <%} %>
                            <div class="row">
                                                            <% 
                            for(Register_CourseModel register_CourseModel: courseWaitings){
                            	CourseModel courseModel=register_CourseModel.getCourseModel();
                            %>
                                <div class="col-xl-4">
                                    <a href="/MVC/course/course-detail?courseID=<%=courseModel.getCourseID() %>">
                                        <div class="inner-wrap">
                                            <!-- <div class="inner-img">
                                                <img src="https://static-images.vnncdn.net/files/publish/2023/5/15/nhung-loai-hoa-dep-nhung-chua-doc-to-co-the-gay-chet-nguoi-882.jpg" alt="listvocab">
                                            </div> -->
                                            <div class="inner-content">
                                                <h4 class="inner-name">
                                                    <%=courseModel.getCourseName() %>
                                                </h4>
                                                                            <%if(courseModel.getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=courseModel.getInput() %>+ và mục tiêu đạt điểm <%=courseModel.getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=courseModel.getTarget() %>+</p>
                            <%} %>
                                            </div>
                                            <div class="inner-number">
                                                <p><%=CourseModel.getPriceCH(register_CourseModel.getAmount()) %></p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <%
                                } %>
                            </div> 
                            <h3>
                                Các khóa học đang sỡ hữu:
                            </h3>
                            <div class="row">
                            <% 
                            int count_registed=0;
                            for(Register_CourseModel register_CourseModel: courseRegisteds){
                            	CourseModel courseModel=register_CourseModel.getCourseModel();
                            	long day=register_CourseModel.getDayOfCoure();
                            	if(day>=0){
                            		count_registed++;
                            %>
								<div class="col-xl-4">
                                    <a href="/MVC/course/course-detail?courseID=<%=courseModel.getCourseID() %>">
                                        <div class="inner-wrap">
                                            <!-- <div class="inner-img">
                                                <img src="https://static-images.vnncdn.net/files/publish/2023/5/15/nhung-loai-hoa-dep-nhung-chua-doc-to-co-the-gay-chet-nguoi-882.jpg" alt="listvocab">
                                            </div> -->
                                            <div class="inner-content">
                                                <h4 class="inner-name">
                                                    <%=courseModel.getCourseName() %>
                                                </h4>
                                                <%if(courseModel.getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=courseModel.getInput() %>+ và mục tiêu đạt điểm <%=courseModel.getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=courseModel.getTarget() %>+</p>
                            <%} %>
                                            </div>
                                            <div class="inner-number">
                                                <p>Còn lại: <%=day %> ngày</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <%
                                }} 
                            if(count_registed==0){
                                %>
                                   <p style="margin:20px">Bạn chưa đăng kí khóa học nào</p>
                                <%} %>
                            </div> 
                            <h3>
                                Các khóa học đã hết hạn:
                            </h3>
                            <div class="row">
                            <% 
                            int count_outTime=0;
                            for(Register_CourseModel register_CourseModel: courseRegisteds){
                            	CourseModel courseModel=register_CourseModel.getCourseModel();
                            	long day=register_CourseModel.getDayOfCoure();
                            	if(day<0){
                            		count_outTime++;
                            %>
                                <div class="col-xl-4">
                                    <a href="/MVC/course/course-detail?courseID=<%=courseModel.getCourseID() %>">
                                        <div class="inner-wrap">
                                            <!-- <div class="inner-img">
                                                <img src="https://static-images.vnncdn.net/files/publish/2023/5/15/nhung-loai-hoa-dep-nhung-chua-doc-to-co-the-gay-chet-nguoi-882.jpg" alt="listvocab">
                                            </div> -->
                                            <div class="inner-content">
                                                <h4 class="inner-name">
                                                    <%=courseModel.getCourseName() %>
                                                </h4>
                                                <%if(courseModel.getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=courseModel.getInput() %>+ và mục tiêu đạt điểm <%=courseModel.getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=courseModel.getTarget() %>+</p>
                            <%} %>
                                            </div>
                                            <div class="inner-number">
                                            	<p>Gia hạn</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <%
                                }} 
                            if(count_outTime==0){
                                %>
                                   <p style="margin:20px">Chưa có khóa học nào đã hết hạn</p>
                                <%} %>
                            </div> 
                        </div>
 

                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                             <%
							int number = ((LinkedList<Pair<HistoryOfTestModel, String>>) request.getAttribute("historyOfTestModels")).size();
                        	if (number != 0) {
							%>
                            <h3>
                                Lịch sử làm đề:
								<!-- code lịch sử đề thi ở đây -->
                            </h3>
                            <br>
                            <div>
                                <div>
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">Số thứ tự</th>
                                <th scope="col">Ngày làm</th>
                                <th scope="col">Tên Đề Thi</th>
                                <th scope="col">Kết quả</th>
                              </tr>
                            </thead>
                            <tbody>
                            	<%
                            	int i = 1; 
								for (Pair<HistoryOfTestModel, String> p : (LinkedList<Pair<HistoryOfTestModel, String>>) request.getAttribute("historyOfTestModels")) {
								%>
                              <tr>
                                <th scope="row"><%=i++%></th>
                                <td><%=p.getFirst().getDate()%></td>
                                <td><%=p.getSecond()%></td>
                                <td><a href="/MVC/tests/result?history-of-test=<%=p.getFirst().getHistoryOfTestID()%>">Xem chi tiết</a></td>
                              </tr>
                              <%} %> 
                            </tbody>
                        </table>
                        <%}%>
						<%if(number == 0){%>
							<h3>Bạn chưa làm đề thi nào!</h3>                          
						<%}%>

                                </div>
                            </div>
                        </div>
                </div>
                </div>
            </div>
        </div>
    </div>

    <!-- foooter -->
    <%@include file="../re-use/footer.jsp" %>
     <!-- end foooter -->
     
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