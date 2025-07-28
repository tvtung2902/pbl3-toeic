<%@page import="com.pbl3.model.TypeTwoQuestionModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="com.pbl3.model.TestsModel"%>
<%@page import="com.pbl3.model.VocabListsModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>Study TOIEC</title>
</head>
<body style="color: var(--color-two);">

	    <style>
    	<%@include file="../../../assets/css/base.css"%>
    	 <%@include file="../../../assets/css/styleStart.css"%>    
    </style>
    
	<!-- header  -->
	<%@include file="../re-use/header.jsp"%>
	<!--end  header  -->
	<%
	TestsModel testsModel = (TestsModel) request.getAttribute("testsModel");
	QuestionModel[] arr = (QuestionModel[]) request.getAttribute("questionModels");
	%>
	<div class="section-one">
		<div class="container">
			<div class="name-test" style="margin-bottom: 20px"><%=testsModel.getTestsName()%></div>
			<div class="row">
				<div class="col-xl-10">
					<form method="post" id="form-test">
						<div class="content-wrap">
							<!-- <div class="button-hightlight">
                        hightlight
                    </div> -->
							<div class="audio">
								<audio src="/MVC/<%=testsModel.getAudio()%>" controls></audio>
							</div>
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								<%
								for (int i = 1; i <= 7; i++) {
								%>
								<li class="nav-item" role="presentation">
									<button class="nav-link <%if (i == 1) {%>active<%}%>"
										id="pills-part-<%=i%>-tab" data-toggle="pill"
										data-target="#pills-part-<%=i%>" type="button" role="tab"
										aria-controls="pills-part-<%=i%>" aria-selected="true">
										Part
										<%=i%></button>
								</li>
								<%
								}
								%>
							</ul>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-part-1"
									role="tabpanel" aria-labelledby="pills-part-1-tab">
									<%
									for (int i = 0; i <= 5; i++) {
										if (arr != null && arr[i] != null) {
									%>
									<div class="question-group">
										<div class="inner-img">
											<img src="/MVC/<%=arr[i].getImage()%>" alt="anh_mo_ta">
										</div>
										<div class="question" id="question<%=i + 1%>">
											<div class="order-number">
												<p class="order-number-text"><%=i + 1%></p>
											</div>
											<div class="answer">
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="A"
														id="q<%=i%>-a"> <label for="q<%=i%>-a">A.</label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="B"
														id="q<%=i%>-b"> <label for="q<%=i%>-b">B.</label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="C"
														id="q<%=i%>-c"> <label for="q<%=i%>-c">C.</label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="D"
														id="q<%=i%>-d"> <label for="q<%=i%>-d">D.</label>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									%>
								</div>
								<div class="tab-pane fade" id="pills-part-2" role="tabpanel"
									aria-labelledby="pills-part-2-tab">
									<%
									for (int i = 6; i <= 30; i++) {
										if (arr != null && arr[i] != null) {
									%>
									<div class="question-group">
										<div class="question" id="question<%=i + 1%>">
											<div class="order-number">
												<p class="order-number-text"><%=i + 1%></p>
											</div>
											<div class="answer">
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="A"
														id="q<%=i%>-a"> <label for="q<%=i%>-a">A.</label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="B"
														id="q<%=i%>-b"> <label for="q<%=i%>-b">B.</label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="C"
														id="q<%=i%>-c"> <label for="q<%=i%>-c">C.</label>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									%>
								</div>
								<div class="tab-pane fade" id="pills-part-3" role="tabpanel"
									aria-labelledby="pills-part-3-tab">

									<%
									int image = 0;
									for (int i = 31; i <= 69; i++) {
										if (arr != null && arr[i] != null) {
											boolean check = true;
											for (int j = i; j < i + 3; j++) {
										if (arr[j].getImage() != null && arr[j].getImage() != "") {
											check = false;
											image = j;
											break;
										}
											}
											if (check) {
										int j = i;
										for (; i < j + 3; i++) {
									%>
									<div class="question-group">
										<div class="question" id="question<%=i + 1%>">
											<div class="order-number">
												<p class="order-number-text"><%=i + 1%></p>
											</div>
											<div class="answer">
												<p class="question-text"><%=((TypeTwoQuestionModel) arr[i]).getQuestionContent()%></p>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="A"
														id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="B"
														id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="C"
														id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="D"
														id="q<%=i%>-d"> <label for="q<%=i%>-d">D.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
												</div>

											</div>
										</div>
									</div>
									<%
									}
									i--;
									} else {%>
									<div class="questions-group">
										<div class="row">
											<div class="col-xl-7">
												<div class="inner-wrap-img">
													<div class="inner-img">
														<img src="/MVC/<%=arr[image].getImage()%>" alt="">
													</div>
												</div>
											</div>
											<div class="col-xl-5">
												<div class="inner-wrap-question">
													<%int j = i;
													for (; i < j + 3; i++) {
													%>
													<div class="question" id="question<%=i + 1%>">
														<div class="order-number">
															<p class="order-number-text"><%=i + 1%></p>
														</div>
														<div class="answer">
															<p class="question-text"><%=((TypeTwoQuestionModel) arr[i]).getQuestionContent()%></p>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="A"
																	id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="B"
																	id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="C"
																	id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="D"
																	id="q<%=i%>-d"> <label for="q<%=i%>-d">D.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
															</div>
														</div>
													</div>
													<%} %>
												</div>
											</div>
										</div>
									</div>
									<%
									i--;
									}
									}
									}
									%>

								</div>

								<div class="tab-pane fade" id="pills-part-4" role="tabpanel"
									aria-labelledby="pills-part-4-tab">
									<%
									int image1 = 0;
									for (int i = 70; i <= 99; i++) {
										if (arr != null && arr[i] != null) {
											boolean check = true;
											for (int j = i; j < i + 3; j++) {
										if (arr[j].getImage() != null && arr[j].getImage() != "") {
											check = false;
											image1 = j;
											break;
										}
											}
											if (check) {
										int j = i;
										for (; i < j + 3; i++) {
									%>
									<div class="question-group">
										<div class="question" id="question<%=i + 1%>">
											<div class="order-number">
												<p class="order-number-text"><%=i + 1%></p>
											</div>
											<div class="answer">
												<p class="question-text"><%=((TypeTwoQuestionModel) arr[i]).getQuestionContent()%></p>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="A"
														id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="B"
														id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="C"
														id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="D"
														id="q<%=i%>-d"> <label for="q<%=i%>-d">D.
														<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
												</div>

											</div>
										</div>
									</div>
									<%
									}
									i--;
									} else {%>
									<div class="questions-group">
										<div class="row">
											<div class="col-xl-7">
												<div class="inner-wrap-img">
													<div class="inner-img">
														<img src="/MVC/<%=arr[image1].getImage()%>" alt="">
													</div>
												</div>
											</div>
											<div class="col-xl-5">
												<div class="inner-wrap-question">
													<%int j = i;
													for (; i < j + 3; i++) {
													%>
													<div class="question" id="question<%=i + 1%>">
														<div class="order-number">
															<p class="order-number-text"><%=i + 1%></p>
														</div>
														<div class="answer">
															<p class="question-text"><%=((TypeTwoQuestionModel) arr[i]).getQuestionContent()%></p>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="A"
																	id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="B"
																	id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="C"
																	id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="D"
																	id="q<%=i%>-d"> <label for="q<%=i%>-d">D.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
															</div>
														</div>
													</div>
													<%} %>
												</div>
											</div>
										</div>
									</div>
									<%
									i--;
									}
									}
									}
									%>

								</div>
								<div class="tab-pane fade" id="pills-part-5" role="tabpanel"
									aria-labelledby="pills-part-5-tab">
									<%
									for (int i = 100; i <= 129; i++) {
										if (arr != null && arr[i] != null) {
									%>
									<div class="question-group">
										<div class="question" id="question<%=i + 1%>">
											<div class="order-number">
												<p class="order-number-text"><%=i + 1%></p>
											</div>
											<div class="answer">
												<p class="question-text"><%=((TypeTwoQuestionModel)arr[i]).getQuestionContent()%></p>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="A"
														id="q<%=i%>-a"> <label for="q<%=i%>-a">A. <%=((TypeTwoQuestionModel)arr[i]).getContentAnswerA()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="B"
														id="q<%=i%>-b"> <label for="q<%=i%>-b">B. <%=((TypeTwoQuestionModel)arr[i]).getContentAnswerB()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="C"
														id="q<%=i%>-c"> <label for="q<%=i%>-c">C. <%=((TypeTwoQuestionModel)arr[i]).getContentAnswerC()%></label>
												</div>
												<div class="wrap-answer">
													<input type="radio"
														name="answer<%=arr[i].getQuestionID()%>" value="D"
														id="q<%=i%>-d"> <label for="q<%=i%>-d">D. <%=((TypeTwoQuestionModel)arr[i]).getContentAnswerD()%></label>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									}
									%>
								</div>
								<div class="tab-pane fade" id="pills-part-6" role="tabpanel"
									aria-labelledby="pills-part-6-tab">
									<%for(int i = 130; i <= 145; i++){%>
									<div class="questions-group">
										<div class="row">
											<div class="col-xl-7">
												<div class="inner-wrap-img">
													<div class="inner-img">
														<img
															src="/MVC/<%=((TypeTwoQuestionModel)arr[i]).getDataQuestionModel().getDataQuestion()%>"
															alt="anh_mo_ta">
													</div>
												</div>
											</div>
											<div class="col-xl-5">
												<div class="inner-wrap-question">
													<%int j = i;
													for (; i < j + 4; i++) {
													%>
													<div class="question" id="question<%=i + 1%>">
														<div class="order-number">
															<p class="order-number-text"><%=i + 1%></p>
														</div>
														<div class="answer">
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="A"
																	id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="B"
																	id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="C"
																	id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="D"
																	id="q<%=i%>-d"> <label for="q<%=i%>-d">D.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
															</div>
														</div>
													</div>
													<%}i--; %>	
												</div>
											</div>
										</div>
									</div>
									<%} %>
								</div>
								<div class="tab-pane fade" id="pills-part-7" role="tabpanel"
									aria-labelledby="pills-part-7-tab">
									<%for(int j = 146; j <= 199; j++){ 
									if(arr[j].getDataQuestionModel().getDataQuestionID() != 0){%>
									<div class="questions-group">
										<div class="row"> 
											<div class="col-xl-7">
												<div class="inner-wrap-img">
													<img
															src="/MVC/<%=((TypeTwoQuestionModel)arr[j]).getDataQuestionModel().getDataQuestion()%>"
															alt="anh_mo_ta">
												</div>
											</div>
											<div class="col-xl-5">
												<div class="inner-wrap-question">
														<% int i = j;	
													while(i != 200 && ((TypeTwoQuestionModel)arr[j]).getDataQuestionID() == ((TypeTwoQuestionModel)arr[i]).getDataQuestionID()) {%>
														<div class="question" id="question<%=i + 1%>">
														<div class="order-number">
															<p class="order-number-text"><%=i + 1%></p>
														</div>
														<div class="answer">
															<p class="question-text"><%=((TypeTwoQuestionModel)arr[i]).getQuestionContent()%></p>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="A"
																	id="q<%=i%>-a"> <label for="q<%=i%>-a">A.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerA()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="B"
																	id="q<%=i%>-b"> <label for="q<%=i%>-b">B.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerB()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="C"
																	id="q<%=i%>-c"> <label for="q<%=i%>-c">C.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerC()%></label>
															</div>
															<div class="wrap-answer">
																<input type="radio"
																	name="answer<%=arr[i].getQuestionID()%>" value="D"
																	id="q<%=i%>-c"> <label for="q<%=i%>-c">D.
																	<%=((TypeTwoQuestionModel) arr[i]).getContentAnswerD()%></label>
															</div>
														</div>
													</div>	
													<%i++;} j = --i;%>
												</div>
											</div> 
										</div>
									</div>
									<%}} %>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-xl-2" id="sidebar">
					<div class="sidebar top">
						<p>
							Thời gian còn lại: <br> <span id="countdown"></span>
						</p>
						<button id="submit" type="submit">Nộp bài</button>
						<p class="number-part">Part 1</p>
						<ul class="sidebar-1">
							<%
							for (int i = 1; i <= 6; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 2</p>

						<ul class="sidebar-2">
							<%
							for (int i = 7; i <= 31; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 3</p>
						<ul class="sidebar-3">
							<%
							for (int i = 32; i <= 70; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 4</p>
						<ul class="sidebar-4">
							<%
							for (int i = 71; i <= 100; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 5</p>

						<ul class="sidebar-5">
							<%
							for (int i = 101; i <= 130; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 6</p>

						<ul class="sidebar-6">
							<%
							for (int i = 131; i <= 146; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 7</p>

						<ul class="sidebar-7">
							<%
							for (int i = 147; i <= 200; i++) {
							%>
							<li><a href="#question<%=i%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- <footer> -->
	<%@include file="../re-use/footer.jsp"%>
	<!-- end footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('hidentop');
                }
                else
                    $('header').removeClass('hidentop');
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-1 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-1-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-1').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-2 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-2-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-2').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                        //const offset = targetElement.offsetTop - (window.innerHeight / 2);
                        //window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-3 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-3-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-3').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                       // const offset = targetElement.offsetTop - (window.innerHeight / 2);
                       // window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-4 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-4-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-4').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                       // const offset = targetElement.offsetTop - (window.innerHeight / 2);
                       // window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-5 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-5-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-5').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                       // const offset = targetElement.offsetTop - (window.innerHeight / 2);
                      //  window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-6 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-6-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-6').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                       // const offset = targetElement.offsetTop - (window.innerHeight / 2);
                      //  window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi click vào các liên kết trong sidebar
            document.querySelectorAll('.sidebar-7 a').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault(); // Ngăn chặn mặc định hành vi chuyển hướng
                    document.querySelector('.nav-link.active').classList.remove('active');
                    document.getElementById('pills-part-7-tab').classList.add('active');
                    document.querySelector('.tab-pane.fade.show.active').classList.remove('active');
                    document.getElementById('pills-part-7').classList.add('show', 'active');

                    const targetId = this.getAttribute('href'); // Lấy ID của phần tử mục tiêu
                    const targetElement = document.querySelector(targetId); // Tìm phần tử mục tiêu
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
                        window.scrollBy(0, -150); // Điều chỉnh khoảng cách
                       // const offset = targetElement.offsetTop - (window.innerHeight / 2);
                       // window.scrollTo({ top: offset, behavior: 'smooth' });
                    }
                });
            });
        });


        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi chọn đáp án
            document.querySelectorAll('.question input[type="radio"]').forEach(radio => {
                radio.addEventListener('change', function () {
                    const questionId = this.closest('.question').getAttribute('id');
                    const sidebarLink = document.querySelector(`.sidebar a[href="#` + questionId + `"]`);
                    if (sidebarLink) {
                        sidebarLink.classList.add('selected');
                    }
                });
            })
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Lắng nghe sự kiện khi chọn đáp án
            document.querySelectorAll('.question .order-number-text').forEach(ordernumber => {
                ordernumber.addEventListener('click', function () {
                    if (ordernumber.classList.contains('ticked')) {
                        ordernumber.classList.remove('ticked');
                    }
                    else {
                        ordernumber.classList.add('ticked');
                    }
                    const questionId = this.closest('.question').getAttribute('id');
                    const sidebarLink = document.querySelector(`.sidebar a[href="#` + questionId + `"]`);
                    if (sidebarLink) {
                        if (sidebarLink.classList.contains('ticked')) { sidebarLink.classList.remove('ticked'); }
                        else { sidebarLink.classList.add('ticked'); }
                    }
                });
            })
        });


        // đồng hồ đếm giờ
        // Lấy thời gian hiện tại
        const startTime = new Date().getTime();

        // Thời gian kết thúc là 120 phút sau thời điểm bắt đầu
        const endTime = startTime + (120 * 60 * 1000 + 2000);
        // const endTime = startTime + (5 * 1000);


        // Phần tử HTML chứa thời gian đếm ngược
        const countdownElement = document.getElementById('countdown');

        // Cập nhật thời gian đếm ngược mỗi giây
        const countdownInterval = setInterval(function () {
            // Lấy thời gian hiện tại
            const currentTime = new Date().getTime();

            // Tính toán thời gian còn lại
            const timeRemaining = endTime - currentTime;

            // Kiểm tra xem thời gian còn lại có âm không
            if (timeRemaining <= 0) {
                clearInterval(countdownInterval); // Dừng đếm ngược nếu đã kết thúc
                // Gọi sự kiện khi hết thời gian
                timeUpEvent();
            } else {
                // Chuyển thời gian từ mili giây thành giờ, phút và giây
                const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

                // Hiển thị thời gian đếm ngược
                countdownElement.textContent = hours + ":" + minutes + ":" + seconds;
            }
        }, 1000); // Mỗi giây

        // Hàm sự kiện khi hết thời gian
        function timeUpEvent() {
            // Thực hiện các hành động cần thiết khi hết thời gian
            document.getElementById('submit').click();
        }

        // Lấy phần tử nút submit và form
        const submitButton = document.getElementById('submit');
        const form = document.getElementById('form-test');

        // Thêm sự kiện click cho nút submit
        submitButton.addEventListener('click', function (event) {
            // Ngăn chặn hành động mặc định của nút submit
            event.preventDefault();
            // Gọi phương thức submit() của form khi nút được nhấn
            form.submit();
        });
        window.addEventListener('beforeunload', function (e) {
            // Hủy sự kiện thoát mặc định
            e.preventDefault();
            // Hiển thị hộp thoại xác nhận
            var confirmationMessage = 'Bạn có chắc muốn rời khỏi trang? Nếu rời đi, bài thi sẽ không được nộp.';
            e.returnValue = confirmationMessage;
            return confirmationMessage;
        });
    </script>
</body>

</html>   