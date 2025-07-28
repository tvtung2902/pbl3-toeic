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
    	<%@ include file="../../../assets/teacher-css/styleCourseDetail.css" %>
.menu .item li:nth-child(1) a{
    color: var(--color-one);
}
.menu .item li:nth-child(1) i{
    color: var(--color-one);
}
.search{
margin:0 !important;
}
    .wrap-button{
      display: flex;
      justify-content: end;
      margin-top: 20px; 
    }
  </style>
	    <!-- menu  -->
	 <%@include file="../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">   
        <div class="container wrap-background">
            <%	
    	CourseModel courseModel= (CourseModel)request.getAttribute("courseModel");
    	ArrayList<Pair<PartModel, LinkedList<LessionModel>>> arrayList= (ArrayList<Pair<PartModel,LinkedList<LessionModel>>>)request.getAttribute("arraylist");
    	%>
    	   	<div class="inner-head">
                <h2><%=courseModel.getCourseName() %></h2>
            </div>
            <div class="course-detail">
                            <div class="inner-content">
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
                                                                <p class="check-lock">Bài <%=lessionModel.getOrderNumber() %>: <%=lessionModel.getLessionName() %>
                                                                    <a href="/MVC/teacher/course/course-detail/edit?lessionID=<%=lessionModel.getLessionID() %>" class="btn-edit"><i class="fa-regular fa-pen-to-square"></i></a>
                                                                </p>
                                                          <ul>		
                                                          			<%if(lessionModel.getVideo() != null){ %>
                                                                    <li>
                                                                        <a href="/MVC/<%=lessionModel.getVideo()%>?lessionID=<%=lessionModel.getLessionID()%>" target="blank" class="check"><strong>Lý thuyết: </strong> 
                                                                            video bài giảng</a>
                                                                    </li>
                                                                    <%}%> 
																	<%if(lessionModel.getExercise() != null){ %>
																	<li>   
																	
                                                                        <a href="/MVC/<%=lessionModel.getExercise()%>?lessionID=<%=lessionModel.getLessionID()%>" target="blank" class="check"><strong>Luyện tập: </strong> Bài tập về: <%=lessionModel.getLessionName() %></a>     
                                                                    </li>     
																	<%} %>
																<%if(lessionModel.getVocabListsModel()!= null){ %> 
																    <li>
                                                                        <a target="blank" href="/MVC/teacher/vocab-lists/vocab?listID=<%=lessionModel.getVocabListsModel().getListID()%>" class="check"><strong>Từ vựng: </strong><%=lessionModel.getVocabListsModel().getNameList() %></a>
                                                                    </li>   
																<%} %>      
                                                         </ul>   
                                            <form
                                                action="/MVC/teacher/course/course-detail/delete?lessionID=<%=lessionModel.getLessionID()%>&courseID=<%=lessionModel.getCourseID()%>"
                                                method="post">    
                                                   <div style="text-align:end;"> 
                                                   <a data-toggle="modal" data-target="#delete-lession<%=lessionModel.getLessionID() %>">
                                                    <i class="fa-solid fa-trash-can" style="color: red;"></i></div>
                                                    </a>
                                                          <div class="modal-delete-lession">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="delete-lession<%=lessionModel.getLessionID() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn xóa bài giảng?
													            </div>
													            <div class="modal-footer">
													              <button type="button" class="btn btn-secondary" data-dismiss="modal" style="color: white;">Hủy</button>
													              <button type="submit" class="btn btn-danger" style="color: white;">Xóa</button>
													            </div>
													          </div>
													        </div>
													      </div>
													    </div>
                                           	 </form>
                                                            </div>
														<%}} %> 
															<a href="/MVC/teacher/course/course-detail/create?courseID=<%=courseModel.getCourseID() %>&part=<%=i %>" class="btn add-btn">Thêm bài học</a>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
						<%} %>
                                        </div>
                            </div>
                        </div>
             <div class="wrap-button">
          		<a href="/MVC/teacher/course" type="button" class="btn add-btn back-btn">Quay lại</a>
          	</div> 
                    </div>
                </div>
                <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        Bạn có chắc chắn xóa bài giảng?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
        <button type="button" class="btn btn-primary">Xóa</button>
      </div>
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>
 