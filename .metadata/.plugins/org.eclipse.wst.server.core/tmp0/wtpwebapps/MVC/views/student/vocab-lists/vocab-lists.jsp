<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabListsModel"%>
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
	margin-bottom: 30px;
}

.box {
	width: 250px;
	height: 300px;
	color: red;
	border: 1px solid red;
}

.modal-form .modal-header {
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	position: relative;
}

.modal-form .modal-header .close {
	position: absolute;
	top: -2px;
	right: -2px;
	opacity: .5;
	background-color: black;
	color: aliceblue;
	border-radius: 50%;
	/* padding: 10px; */
	width: 32px;
	height: 32px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-form .modal-header .inner-image {
	height: 40px;
	width: auto;
	margin-bottom: 6px;
}

.button {
	background: -webkit-linear-gradient(-30deg, #f57f20, #d62b08 100%);
	color: #fff;
	border-radius: 10px;
	border: 1px solid;
	padding: 10px 30px;
	width: 100%;
	font-weight: 600;
}
/*bo gốc cho form*/
.modal-form .modal-content {
	border-radius: 10px;
}

textarea {
	width: 100%;
	height: 200px;
}
</style>
	<div class="container">

		<h1 style="text-align: center;">DAY LA TRANG DANH SACH TU VUNG</h1>
		<div class="row">

			<div class="col-3">
				<div class="box">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">Them DSTV</button>

					<!-- Modal -->
					<div class="modal fade modal-form" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">

									<h5 class="inner-title" id="exampleModalLabel">THEM DS TU
										VUNG</h5>
									<p class="inner-desc"></p>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" action="/MVC/vocab-lists/create">
										<div class="row">
											<div class="col-12">

												<div class="form-group">
													<input name="name" type="text" class="form-control"
														placeholder="Ten">
												</div>

												<textarea name="desc" id="" cols="30" rows="10"></textarea>

												<button class="button">Gui Di</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			int i = 0;
			%>
			<%
			for (VocabListsModel v : (LinkedList<VocabListsModel>) request.getAttribute("vocabListsModels")) {
			%>
			<a href="vocab-lists/vocab?listID=<%=v.getListID()%>">

				<div class="col-3" id="vocabBox">
					<div class="box">
						<h5><%=v.getNameList()%></h5>
						<p><%=v.getDescription()%></p>
						<br> <a href="vocab-lists/delete?listID=<%=v.getListID()%>">
							XOA </a>


						<%
						//**********************************************
						%>
						<%
						i++;
						%>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal<%=i%>">SUA</button>

						</button>

						<!-- Modal -->
						<div class="modal fade modal-form" id="exampleModal<%=i%>"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">

										<h5 class="inner-title" id="exampleModalLabel">SUA DS TU
											VUNG</h5>
										<p class="inner-desc"></p>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-12">
												<h1>day la form</h1>

												<form action="/MVC/vocab-lists/edit" method="post">

													<div class="row">
														<div class="col-12">
															<div class="form-group">

																<input type="text" class="form-control"
																	placeholder="Ten" name="nameList"
																	value="<%=v.getNameList()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="listID"
																	, value="<%=v.getListID()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="userID"
																	, value="<%=v.getUserID()%>">
															</div>

															<div class="form-group">

																<input type="hidden" name="CourseID"
																	, value="<%=v.getCourseID()%>">
															</div>

															<textarea name="description" id="" cols="30" rows="2">
                                    	<%=v.getDescription()%>
                                    </textarea>
															<button class="button">Gui Di</button>
														</div>
													</div>
												</form>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

						<%
						//**********************************************
						%>


					</div>
				</div> <%
 }
 %>
			
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