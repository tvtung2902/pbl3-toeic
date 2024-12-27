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
.main-create .item{
witdth:30% !important;
}
.main-create .wrap-input{
display: flex;

}
        <%@ include file="../../../assets/admin-css/style-create.css" %>
  </style>
	    <!-- menu  -->
	 <%@include file="../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">
        <div class="container">
			    <div class="section-one" style=" margin-bottom: 10px;">       
      <div class="head">  
        <h2 class="add">Thêm bài học</h2>
      </div>
      <div class="main-create"> 
        <div class="wrap"> 
                    		<%int part=(int)request.getAttribute("part"); 
                    		int courseID=(int)request.getAttribute("courseID"); 
                    		System.out.println(part);
                    		System.out.println(courseID);
                    		%>
                    <form action="/MVC/teacher/course/course-detail/create" method="post" enctype="multipart/form-data">   
           			<input readonly type="hidden" name="courseID" class="form-control" id="courseID" value="<%=courseID %>">
            		<div class="form-group" >
            		<label for="part">Part</label>
              			<input type="text" name="partID" class="form-control" id="part" value="<%=part %>" readonly style="width:20%;" >
            		</div>
            		<div class="form-group" >
            			<label for="orderNumber">Số thứ tự</label>
              			<input name="orderNumber" type="number" class="form-control" id="orderNumber" style="width:20%;">
            		</div>       		   
            <div class="form-group" >
            		<label for="nameLession">Tên bài giảng</label>
              		<input name="nameLession" type="text" class="form-control" id="nameLession">
            </div>
            
			
			  <div class="item">
                <div class="form-group">
                  <label for="video">Video bài giảng</label>
                  <input name="video" type="file" class="form-control" id="video">
                </div>
              </div>
              <div class="item">
                <div class="form-group">
                  <label >Danh sách từ vựng</label>
                  <br>
                  <input name="vocabList" list="encodings" value="" class="col-sm-6 custom-select custom-select-sm">
                  <datalist id="encodings">
                  <%
                  LinkedList<VocabListsModel> vocabListsModels = (LinkedList<VocabListsModel>)request.getAttribute("vocabListsModels");
                		if(vocabListsModels.size()!=0&&vocabListsModels!=null){
                              for (VocabListsModel v : vocabListsModels){%>
                              <option value="<%=v.getListID() %>"><%=v.getNameList() %></option>
                              <%} 
                		  }
                  %>
                  </datalist> 
                </div>  
              </div>

              <div class="item">
                <div class="form-group">
                  <label for="exercise">Bài tập</label>
                  <input name="exercise" type="file" class="form-control" id="exercise">
                </div>
              </div>
            <div class="wrap-button">
				<button type="submit" class="add-btn">Thêm</button>
          		<a href="/MVC/teacher/course/course-detail?courseID=<%=request.getParameter("courseID")%>" type="button" class="btn add-btn back-btn">Quay lại</a>
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
 