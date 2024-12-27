<%@page import="com.pbl3.model.DataQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="com.pbl3.model.TypeQuestionModel"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.btn-submit {
	background-color: var(--color-one);
	border: 0;
	padding: 5px 20px;
	border-radius: 20px;
		font-size: 18px;
    font-weight: 500;
}
.modal .form-group{
margin:0;
margin-bottom:20px;
width:100%;
padding:0 20px;
}
</style>
<%
int iAdd = Integer.parseInt(request.getParameter("partID"));

%>
<div class="row">

	<div class="col-6">
		<!-- ordernumber -->
		<div class="form-group">
			<label for="ordernumber">Số Thứ Tự</label> 
			<input name="orderNumber"
				id="ordernumber" type="number" class="form-control">
				<p class="error-orderNumber" style="color:red;"></p>
		</div>
	</div>
	<div class="col-6">
		<!-- loai cau hoi -->
	<div class="form-group">
		<label for="type">Loại Câu Hỏi</label> <select
			class="form-control custom-autofill-selected" id="type"
			name="typeQuestionID">
			<%
			@SuppressWarnings("unchecked")
			LinkedList<TypeQuestionModel> typeQuestionModels = (LinkedList<TypeQuestionModel>) request
					.getAttribute("typeQuestionModels");
			if (typeQuestionModels != null) {
				for (TypeQuestionModel t : typeQuestionModels) {
			%>
			<option value="<%=t.getTypeQuestionID()%>"><%=t.getTypeQuestionName()%></option>
			<%
			}
			}
			%>
		</select>
	</div>
	</div>

		<%
		if (iAdd == 1 || iAdd == 2) {
		%>
	<div class="col-6">
		<!-- audio -->
		<div class="form-group">
			<label for="audio">Audio</label> <input id="audio" name="audio"
				type="file" class="form-control" required>
		</div>
	</div>
		<%
		}
		%>
		<!-- transcript -->
		<%
		if (iAdd == 1 || iAdd == 2) {
		%>
			<div class="col-12">
		<div class="form-group">
			<label for="transcript">Transcript</label>
			<textarea name="transcript" class="form-control" id="transcript"
				rows="6"></textarea>
		</div>
	</div>
		<%
		}
		%>
		<!-- anh mo ta -->
		<%
		if (iAdd == 1 ||iAdd==3 || iAdd==4) {
		%>
			<div class="col-6">
		<div class="form-group">
			<label for="img">Ảnh Mô Tả</label> <input id="img" name="image"
				type="file" class="form-control" <%if(iAdd==1) {%>required<%} %>>
		</div>
			</div>
		<%
		}
		%>
		<%
		if (iAdd == 5 || iAdd==3 || iAdd==4 || iAdd==6 || iAdd==7) {
		%>
			<div class="col-12">
		<!-- nội dung câu hỏi -->
		<%if(iAdd!=6){ %>
				<div class="form-group">
			<label for="content">Nội Dung Câu Hỏi</label>
			<textarea name="questionContent" class="form-control" id="content"
				rows="4" required></textarea>
		</div>
		<%} %>

		<!-- noi dung dap an-->
		<div class="form-group">
			<label for="answerA">Nội Dung Đáp Án A</label> <input type="text"
				class="form-control" id="answerA" aria-describedby="emailHelp"
				name="contentAnswerA" required="required">
		</div>

		<div class="form-group">
			<label for="answerB">Nội Dung Đáp Án B</label> <input type="text"
				class="form-control" id="answerB" aria-describedby="emailHelp"
				name="contentAnswerB" required="required">
		</div>

		<div class="form-group">
			<label for="answerC">Nội Dung Đáp Án C</label> <input type="text"
				class="form-control" id="answerC<"
				aria-describedby="
				emailHelp" name="contentAnswerC" required="required">
		</div>

		<div class="form-group">
			<label for="answerD">Nội Dung Đáp Án D</label> <input type="text"
				class="form-control" id="answerD" aria-describedby="emailHelp"
				name="contentAnswerD" required="required">
			</div>
		</div>
		<%
		}
		%>
	<div class="col-6">
		<!-- đáp án đúng -->
		<div class="form-group">
			<label for="answerCorrect">Đáp Án Đúng</label> <select
				class="form-control custom-autofill-selected" id="answerCorrect"
				name="answerCorrect">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<%
				if (iAdd != 2) {
				%>
				<option value="D">D</option>
				<%
				}
				%>
			</select>
		</div>
	</div>
	<div class="col-12">
		<!-- giải thích -->
		<div class="form-group">
			<label for="explain">Giải Thích</label>
			<textarea name="answerExplain" class="form-control" id="explain"
				rows="4"></textarea>
		</div>
		</div>

		<!-- testsID -->
			<input type="hidden" name="testsID"
				value="<%=request.getParameter("testsID")%>">

		<!-- partID -->
			<input type="hidden" name="partID"
				value="<%=request.getParameter("partID")%>">
	</div>