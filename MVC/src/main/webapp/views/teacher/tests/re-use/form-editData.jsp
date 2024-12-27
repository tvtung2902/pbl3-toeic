<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pbl3.model.DataQuestionModel"%>
<%
DataQuestionModel d1 = (DataQuestionModel) request.getAttribute("dataQuestionModel");
Integer i11 = (Integer) request.getAttribute("partID");

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
		<div class="form-group" style="text-align: left;">
			<label style="align-items: left;">Số Thứ Tự</label> <input name="orderNumber" type="number"

				value="<%=d1.getOrderNumber()%>">
		</div>
	</div>
	<%
	if (i11 == 6 || i11 == 7) {
	%>
	<div class="col-12">
		<!-- anh mo ta -->
				<div class="form-group"style="align-items: start;">
			<a href="/MVC/<%=d1.getDataQuestion()%>" target="blank"><i>Xem
					Ảnh Mô Tả Hiện Tại</i></a>
			</div> 
					<div class="form-group"style="align-items: start;">
			<label style="text-align: left" for="img2<%=d1.getDataQuestionID()%>" >Thay Đổi Ảnh Mô
				Tả</label> <input id="img2<%=d1.getDataQuestionID()%>" name="dataQuestion"  
				type="file" class="form-control" placeholder="thay doi anh mo ta">
		</div>
</div>
		<%
		} else if (i11 == 3 || i11 == 4) {
		System.out.println("vao vi day co i = : " + i11);
		%>
		<div class="col-12">
		<div class="form-group"style="align-items: start;">
			<a href="/MVC/<%=d1.getDataQuestion()%>" target="blank"><i>Xem
					Audio Mô Tả Hiện Tại</i></a>
		</div>

		<div class="form-group"style="align-items: start;">
			<label for="audio1<%=d1.getDataQuestionID()%>">Thay Đổi Audio</label>
			<input id="audio1<%=d1.getDataQuestionID()%>" name="dataQuestion"
				type="file" class="form-control" placeholder="thay doi audio">
		</div>
	</div>
	<%
	}
	%>
	<div class="col-12">
			<!-- transcript -->
		<div class="form-group">
			<label for="Transcript<%=d1.getDataQuestion()%>" style="text-align: left;">Transcript</label>
			<textarea name="transcript" class="form-control"
				id="Transcript<%=d1.getDataQuestion()%>" rows="6"><%=d1.getTranscript()%></textarea>
		</div>
	</div>
		<!-- orderNumberOld -->
		<input type="hidden" name="orderNumberOld"
				value="<%=d1.getOrderNumber() %>"> 
		<!-- data question -->
			<input type="hidden" name="dataQuestionString"
				value="<%=d1.getDataQuestion()%>">  
				  
		<!-- testsID -->
			<input type="hidden" name="testsID"
				value="<%=request.getParameter("testsID")%>">
		<!-- dataQuestionID -->
			<input type="hidden" name="dataQuestionID"
				value="<%=d1.getDataQuestionID()%>">
		<!-- partID -->
			<input type="hidden" name="partID"
				value="<%=request.getParameter("partID")%>">
</div>