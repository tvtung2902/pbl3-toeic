<%@page import="com.pbl3.model.DataQuestionModel"%>
<%@page import="com.pbl3.model.TypeQuestionModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.apache.tomcat.jakartaee.commons.io.function.Uncheck"%>
<%@page import="com.pbl3.model.TypeTwoQuestionModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
QuestionModel d = (QuestionModel) request.getAttribute("temp");
Integer i = (Integer) request.getAttribute("partID");
%>


<style>
.btn-submit {
	background-color: var(--color-one);
	border: 0;
	padding: 5px 20px;
	border-radius: 20px;
	font-size: 18px;
	font-weight: 500;
}

.modal .form-group {
	margin: 0;
	margin-bottom: 20px;
	width: 100%;
	padding: 0 20px;
}
</style>
<div class="row">
	<div class="col-6">
		<!-- ordernumber -->
		<div class="form-group">
			<label for="ordernumber">Số Thứ Tự</label> <input name="orderNumber" 
				type="number" value="<%=d.getOrderNumber()%>"
				>
		</div>
	</div>
	<div class="col-6">
		<!-- loai cau hoi -->
		<div class="form-group">
			<label for="type<%=d.getQuestionID()%>">Loại Câu Hỏi</label> <select
				class="form-control custom-autofill-selected"
				id="type<%=d.getQuestionID()%>" name="typeQuestionID">
				<%
				@SuppressWarnings("unchecked")
				LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
						.getAttribute("typeQuestionModels");
				for (TypeQuestionModel t : typeQuestionModels) {
				%>
				<option value="<%=t.getTypeQuestionID()%>"
					<%if ((t.getTypeQuestionName()).equals(d.getTypeQuestionModel().getTypeQuestionName())) {%>
					selected="selected" <%}%>><%=t.getTypeQuestionName()%></option>
				<%
				}
				%>
			</select>
		</div>
	</div>

	<!-- audio -->
	<%
	if (i == 1 || i == 2) {
	%>
	<div class="col-6">
		<%
		if (((TypeOneQuestionModel) d).getAudio() == null) {
		%>

		<div class="form-group">
			<label for="img<%=d.getQuestionID()%>">Audio</label> <input
				id="Audio<%=d.getQuestionID()%>" name="audio" type="file"
				class="form-control" placeholder="Audio" required="required">
		</div>
		<%
		} else {
		%>
		<div class="form-group"style="margin:0;">
			<a href="/MVC/<%=((TypeOneQuestionModel) d).getAudio()%>"
				target="blank"><i>Xem audio mô tả hiện tại</i></a>
		</div>
		<div class="form-group">
			<input type="hidden" name="audioString"
				value="<%=((TypeOneQuestionModel) d).getAudio()%>">
		</div>
		<div class="form-group">
			<label for="Audio2<%=d.getQuestionID()%>">Thay Đổi Audio</label> <input
				id="Audio2<%=d.getQuestionID()%>" name="audio" type="file"
				class="form-control" placeholder="thay doi audio">
		</div>

		<%
		}
		%>
	</div>
	<%
	}
	%>


	<!-- transcript -->
	<%
	if (i == 1 || i == 2) {
	%>
	<div class="col-12">
		<div class="form-group">
			<label for="Transcript<%=d.getQuestionID()%>">Transcript</label>
			<textarea name="transcript" class="form-control"
				id="Transcript<%=d.getQuestionID()%>" rows="5"><%=((TypeOneQuestionModel) d).getTranscript()%></textarea>
		</div>
	</div>
	<%
	}
	%>


	<!-- anh mo ta -->
	<%
	if (i == 1 || i == 3 || i == 4) {
	%>
	<div class="col-6">
		<%
		if ((d.getImage() == null)) {
		%>
		<div class="form-group">
			<label for="img<%=d.getQuestionID()%>">Ảnh Mô Tả</label> <input
				id="img<%=d.getQuestionID()%>" name="image" type="file"
				class="form-control" placeholder="anh mo ta" <%if (i == 1) {%> <%}%>>
		</div>
		<%
		} else {
		%>
		<div class="form-group" style="margin:0;">
			<a href="/MVC/<%=d.getImage()%>" target="blank"><i>Xem ảnh mô
					tả hiện tại</i></a>
		</div>
		<div class="form-group">
			<input type="hidden" name="imageString" value="<%=d.getImage()%>">
		</div>
		<div class="form-group">
			<label for="img2<%=d.getQuestionID()%>">Thay Đổi Ảnh Mô Tả</label> <input
				id="img2<%=d.getQuestionID()%>" name="image" type="file"
				class="form-control" placeholder="thay doi anh mo ta">
		</div>
		<%
		}
		%>
	</div>
	<%
	}
	%>


	<%
	if (i == 5 ||i==3 ||i==4 ||i==6 ||i==7) {
	%>

	<!-- nội dung câu hỏi -->
	<div class="col-12">
		<% if(i!=6){%>
				<div class="form-group">
			<label for="content<%=d.getQuestionID()%>">Nội Dung Câu Hỏi</label>
			<textarea name="questionContent" class="form-control" required
				id="content<%=d.getQuestionID()%>" rows="4"> <%=((TypeTwoQuestionModel) d).getQuestionContent()%></textarea>
		</div>
		<%} %>

		<!-- noi dung dap an-->
		<div class="form-group">
			<label for="answerA<%=d.getQuestionID()%>">Nội Dung Đáp Án A</label>
			<input type="text" class="form-control"
				id="answerA<%=d.getQuestionID()%>" aria-describedby="emailHelp" required
				name="contentAnswerA"
				value="<%=((TypeTwoQuestionModel) d).getContentAnswerA()%>">
		</div>

		<div class="form-group">
			<label for="answerB<%=d.getQuestionID()%>">Nội Dung Đáp Án B</label>
			<input type="text" class="form-control"
				id="answerB<%=d.getQuestionID()%>" aria-describedby="emailHelp" required
				name="contentAnswerB"
				value="<%=((TypeTwoQuestionModel) d).getContentAnswerB()%>">
		</div>

		<div class="form-group">
			<label for="answerC<%=d.getQuestionID()%>">Nội Dung Đáp Án C</label>
			<input type="text" class="form-control"
				id="answerC<%=d.getQuestionID()%>" aria-describedby="emailHelp" required
				name="contentAnswerC"
				value="<%=((TypeTwoQuestionModel) d).getContentAnswerC()%>">
		</div>

		<div class="form-group">
			<label for="answerD<%=d.getQuestionID()%>">Nội Dung Đáp Án D</label>
			<input type="text" class="form-control"
				id="answerD<%=d.getQuestionID()%>" aria-describedby="emailHelp" required
				name="contentAnswerD"
				value="<%=((TypeTwoQuestionModel) d).getContentAnswerD()%>">
		</div>
	</div>
	<%
	}
	%>

	<div class="col-12">
		<!-- đáp án đúng -->
		<div class="form-group">
			<label for="answerCorrect<%=d.getQuestionID()%>">Đáp Án Đúng</label>
			<select class="form-control custom-autofill-selected"
				id="answerCorrect<%=d.getQuestionID()%>" name="answerCorrect">
				<option value="A" <%if ((d.getAnswerCorrect()).equals("A")) {%>
					selected="selected" <%}%>>A</option>
				<option value="B" <%if ((d.getAnswerCorrect()).equals("B")) {%>
					selected="selected" <%}%>>B</option>
				<option value="C" <%if ((d.getAnswerCorrect()).equals("C")) {%>
					selected="selected" <%}%>>C</option>
				<%
				if (i != 2) {
				%>
				<option value="D" <%if ((d.getAnswerCorrect()).equals("D")) {%>
					selected="selected" <%}%>>D</option>
				<%
				}
				%>
			</select>
		</div>
	</div>
	<div class="col-12">
		<!-- giải thích -->
		<div class="form-group">
			<label for="explain<%=d.getQuestionID()%>">Giải Thích</label>
			<textarea name="answerExplain" class="form-control"
				id="explain<%=d.getQuestionID()%>" rows="4"><%=d.getAnswerExplain()%></textarea>
		</div>
	</div>
</div> 
<!-- testsID -->
<input type="hidden" name="testsID"
	value="<%=request.getParameter("testsID")%>">

<!-- questionID -->
<input name="questionID" type="hidden" value="<%=d.getQuestionID()%>">
<!-- partID -->
<input type="hidden" name="partID"
	value="<%=request.getParameter("partID")%>">
	
	<input name="orderNumberOld" type="hidden" value="<%=d.getOrderNumber() %>">