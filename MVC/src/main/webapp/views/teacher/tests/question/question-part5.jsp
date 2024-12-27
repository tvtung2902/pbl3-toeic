<%@page import="com.pbl3.model.TypeTwoQuestionModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
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
    <title>Study Toiec</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<style type="text/css">
		.wrap-part{
	margin-top: 20px; 
	padding: 10px;
	border: 1px solid var(--color-two);
	border-radius: 8px;
}
	</style>
</head>

  <body>
  <style>
        <%@ include file="../../../../assets/teacher-css/base.css" %>
    	<%@ include file="../../../../assets/admin-css/style.css" %>
.menu .item li:nth-child(4) a{
    color: var(--color-one);
}
.menu .item li:nth-child(4) i{
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
    <%@ include file="../../../../assets/admin-css/style-create.css" %>
  </style>
	    <!-- menu  -->
	 <%@include file="../../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">
        <div class="container">
			    <div class="section-one" style=" margin-bottom: 10px;">       
      <div class="head">  
        <h2 class="add">Part <%=request.getParameter("partID") %></h2>
      </div>
      <div class="main-create"> 
        <div class="wrap">
        	<%	QuestionModel[] questionModels = (QuestionModel[]) request.getAttribute("questionModels");    
        		for (QuestionModel q : questionModels) {
        			if(q.getQuestionID() == 0) continue;
        			TypeTwoQuestionModel temp = (TypeTwoQuestionModel)q;
        	%>        	 		
        	 		<div class="wrap-part">
        	 				<h5>Câu <%=temp.getOrderNumber()%></h5>
        	 		</div>
        	 	<%} %>        			
        	<div class="wrap-button">
          		<a href="/MVC/teacher/tests/detail?testsID=<%=request.getParameter("testsID")%>" type="button" class="btn add-btn back-btn">Quay lại</a>
         	</div> 
        </div>  
      </div>
    </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>
 