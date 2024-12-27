<%@page import="com.pbl3.model.TypeQuestionModel"%>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style type="text/css">
.wrap-part {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid var(--color-two);
	border-radius: 8px;
}

.btn-submit {
	background-color: var(--color-one);
	border: 0;
	padding: 5px 20px;
	border-radius: 20px;
	min-height:
}
</style>
</head>

<body>
  <style>
        <%@ include file="../../../../assets/teacher-css/base.css" %>
    	<%@ include file="../../../../assets/admin-css/style.css" %>
.menu .item li:nth-child(3) a{
    color: var(--color-one);
}
.menu .item li:nth-child(3) i{
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
    <%@include file="../../../../assets/css/style-vocab.css"%>
  </style>
	<!-- menu  -->
	<%@include file="../../re-use/sidebar.jsp"%>
	<!--end  menu  -->
	<div class="main" id="main">
		<div class="container">
			<div class="section-one" style="margin-bottom: 10px;">
				<div class="head">
					<h2 class="add">
						Part
						<%=request.getParameter("partID")%></h2>
				</div>
				<div class="main-create">
					<div class="wrap">
						<%
						if ((Boolean) request.getAttribute("isFull")) {
						%>
						<a class="button-add" data-toggle="modal"
							data-target="#add-listvocab">
							<button class="add-btn" style="cursor: pointer;">Thêm</button>
						</a>
						<div class="modal fade modal-form" id="add-listvocab"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered  modal-lg modal-dialog-scrollable">
								<div class="modal-content">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<div class="modal-header">
										<h5 class="inner-title" id="add-listvocab">Thêm câu hỏi</h5>
									</div>
									<div class="modal-body">
										<form method="post" action="/MVC/teacher/tests/part/create"
											enctype="multipart/form-data" class="addQuessionForm1">
											<%@include file="../re-use/form-add.jsp"%>
											<div class="form-group" style="min-width: 89%;">
												<button type="submit" class="btn-submit">Thêm</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<%
						}
						%>
						<%
						QuestionModel[] questionModels = (QuestionModel[]) request.getAttribute("questionModels");
						for (QuestionModel q : questionModels) {
							if (q.getQuestionID() == 0)
								continue;
							QuestionModel temp;
							if(Integer.parseInt(request.getParameter("partID"))!=5){
								temp = new TypeOneQuestionModel();
								temp=q;
							}else{
								temp = new TypeTwoQuestionModel();
								temp=q;
							}

							
						%>
						<div class="wrap-part"
							style="display: flex; justify-content: space-between;">
							<h5>
								Câu
								<%=temp.getOrderNumber()%></h5>
							<div style="display: flex;">
								<div class="edit">
									<a class="button-add" data-toggle="modal"
										data-target="#edit<%=q.getQuestionID()%>" style="cursor: pointer; color:var(--color-one);">
										<i class="fa-regular fa-pen-to-square"></i>
									</a>
								</div>
								<div class="delete" style="margin-left: 15px">
									<a class="button-delete" data-toggle="modal"  
										data-target="#delete<%=q.getQuestionID()%>" style="cursor: pointer;color:red;">
										<i class="fa-solid fa-trash-can"></i>
									</a>
								</div>
									<div class="modal fade modal-form" id="edit<%=q.getQuestionID()%>"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">  
										<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
											<div class="modal-content">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<div class="modal-header">
													<h5 class="inner-title" id="add-listvocab">Sửa câu hỏi</h5>
												</div>
												<div class="modal-body">
													<form method="post" action="/MVC/teacher/tests/part/edit"
														enctype="multipart/form-data" class="editQuessionForm1">
														<%
							                                request.setAttribute("temp", temp); 
															request.setAttribute("partID", Integer.parseInt(request.getParameter("partID"))); 
							                            %> 
														<%@include file="../re-use/form-edit.jsp"%>
														<div class="form-group" style="min-width: 89%;">
															<button type="submit" class="btn-submit">Sửa</button>
														</div>
													</form> 
												</div>
											</div>
										</div>
									</div>

									<div class="modal fade" id="delete<%=q.getQuestionID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog ">
													          <div class="modal-content">
													            <form action="/MVC/teacher/tests/part/delete" method="post">
														            <!-- questionID -->   
																	
																		<input name="questionID" type="hidden"
																			value="<%=q.getQuestionID()%>">
																
																	<!-- testsID -->
																	
																		<input type="hidden" name="testsID"
																			value="<%=request.getParameter("testsID")%>">
																	
														            	<!-- partID --> 
												
																		<input type="hidden" name="partID"
																			value="<%=request.getParameter("partID")%>">
																	
														            
														            <div class="modal-body"style="text-align: left;">
														            Bạn chắc chắn muốn xóa câu hỏi?
														            </div>
														            <div class="modal-footer">
														              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
														              <button type="submit" class="btn btn-danger">Xóa</button>
														            </div>
													            </form>
													          </div>
													        </div>
													      </div>
							</div>
						</div>
						<%
						}
						%>
						<div class="wrap-button">
							<a
								href="/MVC/teacher/tests/detail?testsID=<%=request.getParameter("testsID")%>"
								type="button" class="btn add-btn back-btn">Quay lại</a>
						</div>
					</div>
				</div>
			</div>
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
						<script>
						
						<% int begin =0;
							int end=0;
							int part = Integer.parseInt(request.getParameter("partID"));
							if(part==1){
								begin=1;
								end=6;
							}
							else if(part==2){
								begin =7;
								end = 31;
							}
							else if(part==5){
								begin=101;
								end=130;
							}

						%>
			function validateFormAdd1(form) {
				var begin= <%=begin%>;
				var end=<%=end%>;
			    let isValid = true;
			    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
			    let orderNumber = parseInt(orderNumberInput.value);

			    if (isNaN(orderNumber) || orderNumber === null) {
			        isValid = false;
			        alert("Số thứ tự không được trống");
			    } else {
			        let orderNumbers = [];
			        <% for (QuestionModel q : (QuestionModel[])request.getAttribute("questionModels")) { %>
			            if (<%= q.getOrderNumber() %> !== 0) {
			                orderNumbers.push(<%= q.getOrderNumber() %>);
			            }
			        <% } %>

			        if (orderNumbers.includes(orderNumber)) {
			            isValid = false;
			            alert("Số thứ tự đã tồn tại");
			        }
			        else if(orderNumber<begin || orderNumber>end){
			        	isValid = false;
			        	alert("Số thứ tự nằm ngoài giá trị cho phép");
			        }
			        else
			        {
			        	isValid = true;
			        }
			    }

			    return isValid;
			}
	document.querySelectorAll('.addQuessionForm1').forEach(form => {
	    form.addEventListener('submit', function(event) {
	        if (!validateFormAdd1(form)) {
	            event.preventDefault();
	        }
	    });
	});
	
	function validateFormEdit1(form) {
		var begin= <%=begin%>;
		var end=<%=end%>;
	    let isValid = true;
	    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
	    let orderNumber = parseInt(orderNumberInput.value);

	    if (isNaN(orderNumber) || orderNumber === null) {
	        isValid = false;
	        alert("Số thứ tự không được trống");
	    } else {
	        let orderNumbers = [];
	        <% for (QuestionModel q : (QuestionModel[]) request.getAttribute("questionModels")) { %>
	            if (<%= q.getOrderNumber() %> != 0) {
	                orderNumbers.push(<%= q.getOrderNumber() %>);
	            }
	        <% } %>
	        let orderNumberOldInput = form.querySelector('input[name="orderNumberOld"]');
	        let orderNumberOld = parseInt(orderNumberOldInput.value);
	        console.log(orderNumberOld);

	        if (orderNumbers.includes(orderNumber) && orderNumber != orderNumberOld ) {
	            isValid = false;
	            alert("Số thứ tự đã tồn tại");
	        }else if(orderNumber<begin || orderNumber>end){
	        	isValid = false;
	        	alert("Số thứ tự nằm ngoài giá trị cho phép");
	        }
	        else{
	        	isValid = true;
	        }
	    }

	    return isValid;
	}
	document.querySelectorAll('.editQuessionForm1').forEach(form => {
	    form.addEventListener('submit', function(event) {
	        if (!validateFormEdit1(form)) {
	            event.preventDefault();
	        }
	    });
	});
	</script>
</body>
</html>
