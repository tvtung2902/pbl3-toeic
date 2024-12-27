<%@page import="com.pbl3.model.DataQuestionModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Integer i = (Integer) request.getAttribute("partID");
%>
<style>
.modal .form-group {
	margin: 0;
	margin-bottom: 20px;
	width: 100%;
	padding: 0 20px;
}
.btn-submit {
	background-color: var(--color-one);
	border: 0;
	padding: 5px 20px;
	border-radius: 20px;
	font-size: 18px;
    font-weight: 500;
}
</style>
<div class="row">
	<div class="col-6">
		<!-- orderNumber -->
		<div class="form-group">
			<label>Số Thứ Tự</label> <input name="orderNumber" type="number">
		</div>
	</div>
	<%
	if (i == 6 || i == 7) {
	%>
	<div class="col-6">
		<!-- anh mo ta -->
		<div class="form-group">
			<label for="imgDESC">Ảnh Mô Tả</label> <input id="imgDESC"
				name="data" type="file" class="form-control" placeholder="anh mo ta"
				required="required">
		</div>
</div>
		<%
		} else if (i == 3 || i == 4) {
		System.out.println("vao vi day co i = : " + i);
		%>
		<div class="col-6">
		<div class="form-group">
			<label for="audioDESC">Audio</label> <input name="data" type="file"
				id="audioDESC" class="form-control" placeholder="audio"
				required="required">
		</div>
	</div>
	<%
	}
	%>
	<div class="col-12">
		<!-- transcript -->
		<div class="form-group">
			<label for="TranscriptDATA">Transcript</label>
			<textarea name="transcript" class="form-control" id="TranscriptDATA"
				rows="6"></textarea>
		</div>
	</div>
	<!-- testsID -->
		<input type="hidden" name="testsID"
			value="<%=request.getParameter("testsID")%>">
	<!-- part -->
		<input type="hidden" name="partID" value="<%=i%>">

</div>