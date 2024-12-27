<%@page import="com.pbl3.model.LessionModel"%>
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
    	<%@ include file="../../../assets/admin-css/style.css" %>
.menu .item li:nth-child(1) a{
    color: var(--color-one);
}
.menu .item li:nth-child(1) i{
    color: var(--color-one);
}
.search{
margin:0 !important;
}
        <%@ include file="../../../assets/admin-css/style-create.css" %>
.link-current{
	margin-left: 25px; 
}
</style>
	    <!-- menu  -->
	 <%@include file="../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">
        <div class="container">
			    <div class="section-one" style=" margin-bottom: 10px;">       
      <div class="head">
        <h2 class="add">Sửa bài giảng</h2>
      </div>
      <div class="main-create"> 
        <div class="wrap"> 
                    		<%LessionModel l=(LessionModel)request.getAttribute("lessionModel"); 
                    		int courseID=(int)request.getAttribute("courseID"); 
                    		%>
          <form action="/MVC/teacher/course/course-detail/edit" method="post" enctype="multipart/form-data">   
           			<input readonly type="hidden" name="courseID" class="form-control" id="courseID" value="<%=courseID %>">
           			<input readonly type="hidden" name="lessionID" class="form-control" id="lessionID" value="<%=l.getLessionID() %>">
            		<div class="form-group" >
            		<label for="part">Part</label>
              			<input type="text" name="partID" class="form-control" id="part" value="<%=l.getPartID() %>" style="width:20%;" readonly>
            		</div>
            		<div class="form-group" >
            			<label for="orderNumber">Số thứ tự</label>
              			<input name="orderNumber" type="number" class="form-control" id="orderNumber" value="<%=l.getOrderNumber() %>" style="width:20%;">
            		</div>       		   
            <div class="form-group" >
            		<label for="nameLession">Tên bài giảng</label>
              		<input name="nameLession" type="text" class="form-control" value="<%=l.getLessionName() %>" id="nameLession">
            </div>
            <div class="wrap-input">
            
			
			  <div class="item">
                <div class="form-group">
                  <%if(l.getVideo() != null) {%>
                  <label for="video">Thay đổi video bài giảng</label>
                  <a class="link-current" href="/MVC/<%=l.getVideo()%>?lessionID=<%=l.getLessionID()%>" target="blank"><i>Video hiện tại</i></a>
                  <input readonly type="hidden" name="videoOld" class="form-control" value="<%=l.getVideo() %>">
                  <%} else{%>
                  	<label>Thêm video</label>
                  	<br>
                  <%} %>
                  <input name="video" type="file" class="form-control" id="video">
                   <%if(l.getVideo() != null) {%>
                  <input type="checkbox" name="deleteVideo" value="yes" id="deleteVideo" style="margin-left: 20px;">
				  <label for="deleteVideo">Xóa</label>
				  <%} %> 
                </div>
              </div>
              <div class="item">
                <div class="form-group">
                  <%if(l.getVocabListsModel() != null) {%>	
                  <label>Thay đổi danh sách từ vựng</label>
                  <a class="link-current" href="/MVC/teacher/vocab-lists/vocab?listID=<%=l.getVocabListsModel().getListID() %>" target="blank"><i>Danh sách từ vựng hiện tại</i></a>
                  <br>
                  <%} else {%>
                  	<label>Thêm danh sách từ vựng</label>
                  	<br>  
                  <%} %>
                  <input name="vocabList" list="encodings" <%if(l.getVocabListsModel()!=null){%>value="<%=l.getVocabListsModel().getListID()	 %>" <%}%> class="col-sm-6 custom-select custom-select-sm">
                  <datalist id="encodings">
                  <%   
                  LinkedList<VocabListsModel> vocabListsModels = (LinkedList<VocabListsModel>)request.getAttribute("vocabListsModels");
                  System.out.print(vocabListsModels.size());	
                  if(vocabListsModels.size()!=0 && vocabListsModels!=null){
                              for (VocabListsModel v : vocabListsModels){%>
                              <option value="<%=v.getListID()%>"><%=v.getNameList() %></option>
                              <%} 
                		  }%> 
                  </datalist> 
                  <br>
                 	
                </div>  
              </div>
              
              <div class="item"> 
                <div class="form-group">
            
                 <%if(l.getExercise() != null) {%>	
                  <label for="exercise">Thay đổi bài tập</label>
                   <a class="link-current" href="/MVC/<%=l.getExercise()%>?lessionID=<%=l.getLessionID()%>" target="blank"><i>Bài tập hiện tại</i></a>
                   <input readonly type="hidden" name="exerciseOld" class="form-control" value="<%=l.getExercise() %>">
                  <%}else{ %>
                  	<label>Thêm bài tập</label>
                  <%} %>
                  <input name="exercise" type="file" class="form-control" id="exercise">
                 <%if(l.getExercise() != null) {%>
                 <input type="checkbox" name="deleteEx" value="yes" id="deleteEx" style="margin-left: 20px;">
				<label for="deleteEx">Xóa</label>
				<%} %>
                </div>
              </div>
            </div> 
            <div class="wrap-button">
				<button type="submit" class="add-btn">Sửa</button>
          		<a href="/MVC/teacher/course/course-detail?courseID=<%=l.getCourseID()%>" type="button" class="btn add-btn back-btn">Quay lại</a>
          	</div>       
          </form>
        </div>  
      </div>
    </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>
 