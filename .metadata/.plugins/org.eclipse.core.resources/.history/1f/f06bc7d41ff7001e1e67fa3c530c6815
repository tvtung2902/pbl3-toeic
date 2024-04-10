<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.TestsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>
<body>
	<style>
h1 {
	text-align: center;
}

.box {
	width: 250px;
	height: 300px;
	color: red;
	border: 1px solid red;
}

.col-12{
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #EAF0E4; 
}
</style>

	<div class="container">
		<h1>DAY LA TRANG START</h1>
		<div class="row">
			<form method="post">
			<%for( QuestionModel q : (LinkedList<QuestionModel>)request.getAttribute("questionModels")){ %>
			<div class="col-12">
				<h3>Câu <%= q.getOrderNumber()%>. <%=q.getQuestionContent()%> </h3>
					    <input type="radio" id="contentAnswerA<%=q.getQuestionID()%>" name="anwser<%=q.getQuestionID()%>" value="<%=q.getQuestionID()%>A">
	      				<label for="contentAnswerA<%=q.getQuestionID()%>"><%=q.getContentAnswerA()%></label><br>
	        			<input type="radio" id="contentAnswerB<%=q.getQuestionID()%>" name="anwser<%=q.getQuestionID()%>" value="<%=q.getQuestionID()%>B">
	        			<label for="contentAnswerB<%=q.getQuestionID()%>"><%=q.getContentAnswerB()%></label><br>
	        			<input type="radio" id="contentAnswerC<%=q.getQuestionID()%>" name="anwser<%=q.getQuestionID()%>" value="<%=q.getQuestionID()%>C">
	        			<label for="contentAnswerC<%=q.getQuestionID()%>"><%=q.getContentAnswerC()%></label><br>
						<input type="radio" id="contentAnswerD<%=q.getQuestionID()%>" name="anwser<%=q.getQuestionID()%>" value="<%=q.getQuestionID()%>D">
	        			<label for="contentAnswerD<%=q.getQuestionID()%>"><%=q.getContentAnswerD() %></label><br>
			</div>
			<%} %>
			<input type="submit" value="nop bai">
			</form>	
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>