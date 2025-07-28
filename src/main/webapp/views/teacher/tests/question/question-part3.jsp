<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="com.pbl3.model.DataQuestionModel"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="java.util.ArrayList"%>
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
    	<%@include file="../../../../assets/css/style-vocab.css"%>
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
             <%
             @SuppressWarnings("unchecked")
             ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>> arrayList = (ArrayList<Pair<DataQuestionModel, LinkedList<QuestionModel>>>)request.getAttribute("questionModels");
				for (Pair<DataQuestionModel, LinkedList<QuestionModel>> p : arrayList) {%>
					<div class="wrap-question" style="border: 1px solid black; margin-bottom: 30px; padding: 20px; border-radius: 8px;">
					<div style= "text-align: center; color: white; border-radius: 8px; background: var(--color-two); padding: 6px 19px; display: flex; margin-bottom: 22px;justify-content: space-between;">
						<h3 style="margin-bottom: 0">Cụm câu hỏi <%=p.getFirst().getOrderNumber()%></h3>  
						<div style="display: flex; align-items: center;">
								<div class="edit">  
										<a class="button-add" data-toggle="modal" 
											data-target="#edit<%=p.getFirst().getDataQuestionID()%>">
											<i class="fa-regular fa-pen-to-square" style="color: var(--color-one)"></i>
										</a>
									</div> 
									<div class="delete" style="margin-left: 15px">
										<a class="button-delete" data-toggle="modal"  
											data-target="#delete<%=p.getFirst().getDataQuestionID()%>">
											<i class="fa-solid fa-trash-can" style="color: red;"></i>  
										</a>
									</div>
						</div>
						
						<div class="modal fade modal-form" id="edit<%=p.getFirst().getDataQuestionID()%>"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">  
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<div class="modal-header">
													<h5 class="inner-title" id="add-listvocab">Sửa cụm câu hỏi</h5>
												</div>
												<div class="modal-body">
													<form method="post" action="/MVC/teacher/tests/part/edit-data"
														enctype="multipart/form-data" class="editQuessionForm3">
														<% 
							                                request.setAttribute("dataQuestionModel", p.getFirst());
															request.setAttribute("partID", Integer.parseInt(request.getParameter("partID")));
							                            %>     
														<%@include file="../re-use/form-editData.jsp"%>
														<div class="form-group" style="min-width: 89%;">
															<button type="submit" class="btn-submit">Sửa</button>
														</div> 
													</form> 
												</div>
											</div>  
										</div>
									</div>

									<div class="modal fade" id="delete<%=p.getFirst().getDataQuestionID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <form action="/MVC/teacher/tests/part/delete-data" method="post">
														            <!-- questionID -->   
																		<input name="dataQuestionID" type="hidden"
																			value="<%=p.getFirst().getDataQuestionID()%>">
																	<%@include file="../re-use/form-delete.jsp"%>
													            </form> 
													          </div>
													        </div>
									</div>
					</div>
					<%if (p.getSecond().size() < (int)request.getAttribute("questionCount")){%>
					<button type="submit" class="add-btn" data-toggle="modal" data-target="#add-question<%=p.getFirst().getDataQuestionID()%>">Thêm</button>
					
					<div class="modal fade modal-form" id="add-question<%=p.getFirst().getDataQuestionID()%>"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true"> 
							<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
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
											enctype="multipart/form-data" class="addDataQuessionForm1">   
										  <%@include file="../re-use/form-add.jsp"%>
	  					 				<div class="form-group">  
												<input type="hidden" name="dataQuestionID"
													value="<%=p.getFirst().getDataQuestionID()%>">
													<input type="hidden" name="orderNumberData"
													value="<%=p.getFirst().getOrderNumber() %>">
														<input type="hidden" name="listOrderNumberData"
													value="<% for( QuestionModel q: p.getSecond()){%><%=q.getOrderNumber() %>,<% }%>">
													
											</div>
											<br>
											<div class="form-group" style="min-width: 89%;">
												<button type="submit" class="btn-submit">Thêm</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					<%} %>
					<%for (QuestionModel q : p.getSecond()) {
						TypeTwoQuestionModel temp = (TypeTwoQuestionModel) q;
					%>   
						<div class="wrap-part"
							style="display: flex; justify-content: space-between;">
						<h5>Câu <%=q.getOrderNumber()%></h5>  
						<div style="display: flex;"> 
								<div class="edit">
									<a class="button-add" data-toggle="modal"
										data-target="#edit<%=q.getQuestionID()%>"style="cursor: pointer; color:var(--color-one);">
										<i class="fa-regular fa-pen-to-square"></i>
									</a>
								</div>
								<div class="delete" style="margin-left: 15px">
									<a class="button-delete" data-toggle="modal"  
										data-target="#delete<%=q.getQuestionID()%>"style="cursor: pointer; color:red;">
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
														enctype="multipart/form-data" class="editDataQuessionForm1">
														<%
							                                request.setAttribute("temp", temp); 
						 								request.setAttribute("partID", Integer.parseInt(request.getParameter("partID"))); 
						 								%>
														<%@include file="../re-use/form-edit.jsp"%>  
													<input type="hidden" name="orderNumberData"
													value="<%=p.getFirst().getOrderNumber() %>">
														<input type="hidden" name="orderNumberDataOld"
														value="<%=q.getOrderNumber() %>">
														<input type="hidden" name="listOrderNumberData"
													value="<% for( QuestionModel k: p.getSecond()){%><%=k.getOrderNumber() %>,<% }%>">
														<div class="form-group" style="min-width: 89%;">
															<button type="submit" class="btn-submit">Sửa</button>
														</div>
													</form> 
												</div>
											</div>
										</div>
									</div>

									<div class="modal fade" id="delete<%=q.getQuestionID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <form action="/MVC/teacher/tests/part/delete" method="post">
														            <!-- questionID -->   
													
																		<input name="questionID" type="hidden"
																			value="<%=q.getQuestionID()%>">
																	
																	<%@include file="../re-use/form-delete.jsp"%>
													            </form>
													          </div>
													        </div>
													      </div>
									</div>
							</div> 
					<%}%>   
					</div>
				<%} 
				%>
			
			<div class="wrap-button">
				<%if((boolean)request.getAttribute("isFull")) {%><button type="submit" class="add-btn" data-toggle="modal" data-target="#add-data">Thêm</button> <%} %>
          		<a href="/MVC/teacher/tests/detail?testsID=<%=request.getParameter("testsID")%>" type="button" class="btn add-btn back-btn">Quay lại</a>
          	</div>
          	

						<div class="modal fade modal-form" id="add-data"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<div class="modal-header">
										<h5 class="inner-title" id="add-listvocab">Thêm Cụm Câu Hỏi</h5>
									</div>
									<div class="modal-body">
										<form method="post" action="/MVC/teacher/tests/part/create-data"
											enctype="multipart/form-data" class="addQuessionForm3"> 
											<%request.setAttribute("partID", Integer.parseInt(request.getParameter("partID")));%>
											<%@include file="../re-use/form-addData.jsp"%>
											<div class="form-group" style="min-width: 89%;">
												<button type="submit" class="btn-submit">Thêm</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>		    
        </div>  
      </div>
    </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  					<script>
  						<% int begin_data =0;
							int end_data=0;
							int part = Integer.parseInt(request.getParameter("partID"));
							if(part==3){
								begin_data=1;
								end_data=13;
							}
							else if(part==4){
								begin_data =1;
								end_data = 10;
							}
							else if(part==6){
								begin_data=1;
								end_data=4;
							}

						%>
			function validateFormAdd3(form) {
				var begin= <%=begin_data%>;
				var end=<%=end_data%>;
			    let isValid = true;
			    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
			    let orderNumber = parseInt(orderNumberInput.value);

			    if (isNaN(orderNumber) || orderNumber === null) {
			        isValid = false;
			        alert("Số thứ tự không được trống");
			    } else {
			        let orderNumbers = [];
			        <%for (Pair<DataQuestionModel, LinkedList<QuestionModel>> p : arrayList)if(p.getFirst().getOrderNumber()!=0) {%>
		            orderNumbers.push(<%=p.getFirst().getOrderNumber() %>);
		    	<% } %>			        
			        if (orderNumbers.includes(orderNumber)) {
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
	document.querySelectorAll('.addQuessionForm3').forEach(form => {
	    form.addEventListener('submit', function(event) {
	        if (!validateFormAdd3(form)) {
	            event.preventDefault();
	        }
	    });
	});
	
	function validateFormEdit3(form) {
		var begin= <%=begin_data%>;
		var end=<%=end_data%>;
	    let isValid = true;
	    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
	    let orderNumber = parseInt(orderNumberInput.value);

	    if (isNaN(orderNumber) || orderNumber === null) {
	        isValid = false;
	        alert("Số thứ tự không được trống");
	    } else {
	        let orderNumbers = [];
	        <%for (Pair<DataQuestionModel, LinkedList<QuestionModel>> p : arrayList)if(p.getFirst().getOrderNumber()!=0) {%>
            orderNumbers.push(<%=p.getFirst().getOrderNumber() %>);
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
	document.querySelectorAll('.editQuessionForm3').forEach(form => {
	    form.addEventListener('submit', function(event) {
	        if (!validateFormEdit3(form)) {
	            event.preventDefault();
	        }
	    });
	});
	
	function validateFormAddData1(form) {
	    let isValid = true;
	    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
	    let orderNumber = parseInt(orderNumberInput.value);
	    
	    let orderNumberDataInput = form.querySelector('input[name="orderNumberData"]');
	    let orderNumberData = parseInt(orderNumberDataInput.value);
	    
	    let listOrderNumberDataInput = form.querySelector('input[name="listOrderNumberData"]');
	    var listOrderNumberData=listOrderNumberDataInput.value;

	    
	    
	    var begin=0;
	    var end =0;
	    var part = <%=part %>;
	    
	    switch (part) {
	    case 3:
				begin = 32+(orderNumberData-1)*3;
				end = 31+(orderNumberData)*3;
	      break;
	    case 4:
			begin = 71+(orderNumberData-1)*3;
			end = 70+(orderNumberData)*3;
	      break;
	    case 6:
			begin = 131+(orderNumberData-1)*4;
			end = 130+(orderNumberData)*4;
		      break;
	  }
	    if (isNaN(orderNumber) || orderNumber === null) {
	        isValid = false;
	        alert("Số thứ tự không được trống");
	    } else {
	        const orderNumbers = convertStringToIntegerArray(listOrderNumberData);

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
document.querySelectorAll('.addDataQuessionForm1').forEach(form => {
form.addEventListener('submit', function(event) {
    if (!validateFormAddData1(form)) {
        event.preventDefault();
    }
});
});
function validateFormEditData1(form) {
    let isValid = true;
    let orderNumberInput = form.querySelector('input[name="orderNumber"]');
    let orderNumber = parseInt(orderNumberInput.value);
    
    let orderNumberDataInput = form.querySelector('input[name="orderNumberData"]');
    let orderNumberData = parseInt(orderNumberDataInput.value);
    
    let listOrderNumberDataInput = form.querySelector('input[name="listOrderNumberData"]');
    var listOrderNumberData=listOrderNumberDataInput.value;

    let orderNumberOldInput = form.querySelector('input[name="orderNumberDataOld"]');
    let orderNumberOld = parseInt(orderNumberOldInput.value);
    
    
    var begin=0;
    var end =0;
    var part = <%=part %>;
    
    switch (part) {
    case 3:
			begin = 32+(orderNumberData-1)*3;
			end = 31+(orderNumberData)*3;
      break;
    case 4:
		begin = 71+(orderNumberData-1)*3;
		end = 70+(orderNumberData)*3;
      break;
    case 6:
		begin = 131+(orderNumberData-1)*4;
		end = 130+(orderNumberData)*4;
	      break;
  }
    if (isNaN(orderNumber) || orderNumber === null) {
        isValid = false;
        alert("Số thứ tự không được trống");
    } else {
        const orderNumbers = convertStringToIntegerArray(listOrderNumberData);

        if (orderNumbers.includes(orderNumber) && orderNumber!= orderNumberOld) {
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
document.querySelectorAll('.editDataQuessionForm1').forEach(form => {
	form.addEventListener('submit', function(event) {
	    if (!validateFormEditData1(form)) {
	        event.preventDefault();
	    }
	});
	});
function convertStringToIntegerArray(inputString) {
    // Tách các số nguyên từ chuỗi đầu vào
    const numberStrings = inputString.split(',');

    // Chuyển đổi các chuỗi sang số nguyên và loại bỏ các giá trị không hợp lệ
    const integers = numberStrings.map(str => parseInt(str.trim(), 10))
                                   .filter(num => !isNaN(num));

    return integers;
}
	</script>
  </body>
</html>
 