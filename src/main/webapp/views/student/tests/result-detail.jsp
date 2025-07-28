<%@page import="com.pbl3.libs.Pair"%>
<%@page import="java.util.ArrayList"%>
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
<style>
.sub-audio{
height:30px;
width:25%;
}
</style>

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
    	 <%@include file="../../../assets/css/styleResultDetail.css"%>
    </style>
    
	<!-- header  -->
	<%@include file="../re-use/header.jsp"%>
	<!--end  header  -->
 	<%
	TestsModel testsModel = (TestsModel) request.getAttribute("testsModel");
	ArrayList<Pair<QuestionModel, String>> pairs = (ArrayList<Pair<QuestionModel, String>>) request.getAttribute("pairs");
	%>
	<div class="section-one">
		<div class="container">
			<div class="name-test" style="margin-bottom: 20px"><%=testsModel.getTestsName()%></div>
			<div class="row">
				<div class="col-xl-10">
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
									TypeOneQuestionModel typeOneQuestionModel = (TypeOneQuestionModel) (pairs.get(i).getFirst());
								%>
								<div class="question-group">
									<div class="inner-img">
										<img src="/MVC/<%=typeOneQuestionModel.getImage()%>"
											alt="anh_mo_ta">
									</div>
							<div class="audio sub-audio">
								<audio src="/MVC/<%=typeOneQuestionModel.getAudio() %>" style="margin-top: -15px;" controls="controls"></audio>
							</div>
									<div class="content-text">
										<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
											Transcript <span class="fas fa-caret-down ml-1"></span>
										</span>
										<div id="coll<%=i%>" class="collapse">
											<div> 
												<pre class="transcript-content"><%=typeOneQuestionModel.getTranscript()%></pre>
											</div>
										</div>
									</div>

									<div class="question" id="question<%=i + 1%>">
										<div class="order-number">
											<p class="order-number-text"><%=i + 1%></p>
										</div>
										<div class="answer">
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>A.</label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>B.</label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>C.</label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>D.</label>
											</div>
										</div>
									</div>

									<div class="answer-correct">
										<p style="color: green">
											Đáp án đúng:
											<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
									</div>

									<div class="content-text">
										<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
											Lời Giải <span class="fas fa-caret-down ml-1"></span>
										</span>
										<div id="collEx<%=i%>" class="collapse">
											<div>
												<pre class="transcript-content"><%=typeOneQuestionModel.getAnswerExplain()%></pre>
											</div>
										</div>
									</div>

								</div>
								<%
								}
								%>
							</div>


							<div class="tab-pane fade" id="pills-part-2" role="tabpanel"
								aria-labelledby="pills-part-2-tab">
								<%
								for (int i = 6; i <= 30; i++) {
									TypeOneQuestionModel typeOneQuestionModel = (TypeOneQuestionModel) (pairs.get(i).getFirst());
								%>
								<div class="question-group">
							<div class="audio sub-audio">
								<audio src="/MVC/<%=typeOneQuestionModel.getAudio() %>" style="margin-top: -15px;" controls="controls"></audio>
							</div>
									<div class="content-text">
										<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
											Transcript <span class="fas fa-caret-down ml-1"></span>
										</span>
										<div id="coll<%=i%>" class="collapse">
											<div>
												<pre class="transcript-content"><%=typeOneQuestionModel.getTranscript()%></pre>
											</div>
										</div>
									</div>

									<div class="question" id="question<%=i + 1%>">
										<div class="order-number">
											<p class="order-number-text"><%=i + 1%></p>
										</div>
										<div class="answer">
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>A.</label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>B.</label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>C.</label>
											</div>
										</div>
									</div>

									<div class="answer-correct">
										<p style="color: green">
											Đáp án đúng:
											<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
									</div>

									<div class="content-text">
										<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
											Lời Giải <span class="fas fa-caret-down ml-1"></span>
										</span>
										<div id="collEx<%=i%>" class="collapse">
											<div>
												<pre class="transcript-content"><%=typeOneQuestionModel.getAnswerExplain()%></pre>
											</div>
										</div>
									</div>
									<br> <br>

								</div>
								<%
								}
								%>
							</div>

							<div class="tab-pane fade" id="pills-part-3" role="tabpanel"
								aria-labelledby="pills-part-3-tab">

								<%
								int image = 0;
								for (int i = 31; i <= 69; i++) {
									TypeTwoQuestionModel typeTwoQuestionModel = (TypeTwoQuestionModel) (pairs.get(i).getFirst());
									if (typeTwoQuestionModel != null) {
										boolean check = true;
										for (int j = i; j < i + 3; j++) {
									TypeTwoQuestionModel typeTwoQuestionModel1 = (TypeTwoQuestionModel) (pairs.get(j).getFirst());
									if (typeTwoQuestionModel1.getImage() != null) {
										check = false;
										image = j;
										break;
									}
										}
										if (check) {
									int j = i;
									for (; i < j + 3; i++) {
										if ((i - 31) % 3 == 0) {
								%>
															<div class="audio sub-audio">
								<audio src="/MVC/<%=typeTwoQuestionModel.getDataQuestionModel().getDataQuestion()%>" style="margin-top: -15px;" controls="controls"></audio>
							</div>
								<div class="content-text">
									<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
										Transcript <span class="fas fa-caret-down ml-1"></span>
									</span>
									
									<div id="coll<%=i%>" class="collapse">
										<div>
											<pre class="transcript-content"><%=typeTwoQuestionModel.getDataQuestionModel().getTranscript()%></pre>
										</div>
									</div>
								</div>
								<%
								}
								%>
								<div class="question-group">
									<div class="question" id="question<%=i + 1%>">
										<div class="order-number">
											<p class="order-number-text"><%=i + 1%></p>
										</div>
										<div class="answer">
											<p class="question-text"><%=((TypeTwoQuestionModel) pairs.get(i).getFirst()).getQuestionContent()%></p>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
											</div>
											<div class="answer-correct">
												<p style="color: green">
													Đáp án đúng:
													<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
											</div>

											<div class="content-text">
												<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
													Lời Giải <span class="fas fa-caret-down ml-1"></span>
												</span>
												<div id="collEx<%=i%>" class="collapse">
													<div>
														<pre class="transcript-content"><%=pairs.get(i).getFirst().getAnswerExplain()%></pre>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
								}
								i--;
								} else {
								%>
								<div class="questions-group">
									<div class="row">
										<div class="col-xl-7">
											<div class="inner-wrap-img">
												<div class="inner-img">
													<img src="/MVC/<%=pairs.get(image).getFirst().getImage()%>"
														alt="">
													<div class="audio sub-audio" style="width:40%">
														<audio src="/MVC/<%=typeTwoQuestionModel.getDataQuestionModel().getDataQuestion()%>" style="margin-top: 0px;" controls="controls"></audio>
													</div>
													<div class="content-text"style="margin-top: 15px;" >
														<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
															Transcript <span class="fas fa-caret-down ml-1"></span>
														</span>
														<div id="coll<%=i%>" class="collapse">
															<div>
																<pre class="transcript-content"><%=typeTwoQuestionModel.getDataQuestionModel().getTranscript()%></pre>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-5">
											<div class="inner-wrap-question">
												<%
												int j = i;
												for (; i < j + 3; i++) {
												%>
												<div class="question" id="question<%=i + 1%>">
													<div class="order-number">
														<p class="order-number-text"><%=i + 1%></p>
													</div>

													<div class="answer">
														<p class="question-text"><%=((TypeTwoQuestionModel) pairs.get(i).getFirst()).getQuestionContent()%></p>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
														</div>
														<div class="answer-correct">
															<p style="color: green">
																Đáp án đúng:
																<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
														</div>

														<div class="content-text">
															<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
																Lời Giải <span class="fas fa-caret-down ml-1"></span>
															</span>
															<div id="collEx<%=i%>" class="collapse">
																<div>
																	<pre class="transcript-content"><%=(pairs.get(i).getFirst()).getAnswerExplain()%></pre>
																</div>
															</div>
														</div>
													</div>
												</div>

												<%
												}
												%>
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
									TypeTwoQuestionModel typeTwoQuestionModel = (TypeTwoQuestionModel) (pairs.get(i).getFirst());
									if (typeTwoQuestionModel != null) {
										boolean check = true;
										for (int j = i; j < i + 3; j++) {
									TypeTwoQuestionModel typeTwoQuestionModel1 = (TypeTwoQuestionModel) (pairs.get(j).getFirst());
									if (typeTwoQuestionModel1.getImage() != null) {
										check = false;
										image1 = j;
										break;
									}
										}
										if (check) {
									int j = i;
									for (; i < j + 3; i++) {
										if ((i - 31) % 3 == 0) {
								%>
									<div class="audio sub-audio">
								<audio src="/MVC/<%=typeTwoQuestionModel.getDataQuestionModel().getDataQuestion()%>" style="margin-top: -15px;" controls="controls"></audio>
							</div>
								<div class="content-text">
									<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
										Transcript <span class="fas fa-caret-down ml-1"></span>
									</span>
									<div id="coll<%=i%>" class="collapse">
										<div>
											<pre class="transcript-content"><%=typeTwoQuestionModel.getDataQuestionModel().getTranscript()%></pre>
										</div>
									</div>
								</div>
								<%
								}
								%>
								<div class="question-group">
									<div class="question" id="question<%=i + 1%>">
										<div class="order-number">
											<p class="order-number-text"><%=i + 1%></p>
										</div>
										<div class="answer">
											<p class="question-text"><%=((TypeTwoQuestionModel) pairs.get(i).getFirst()).getQuestionContent()%></p>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
											</div>
											<div class="wrap-answer">
												<input type="radio" disabled
													<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
													<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
											</div>
											<div class="answer-correct">
												<p style="color: green">
													Đáp án đúng:
													<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
											</div>

											<div class="content-text">
												<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
													Lời Giải <span class="fas fa-caret-down ml-1"></span>
												</span>
												<div id="collEx<%=i%>" class="collapse">
													<div>
														<pre class="transcript-content"><%=pairs.get(i).getFirst().getAnswerExplain()%></pre>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
								}
								i--;
								} else {
								%>
								<div class="questions-group">
									<div class="row">
										<div class="col-xl-7">
											<div class="inner-wrap-img">
												<div class="inner-img">
													<img
														src="/MVC/<%=pairs.get(image1).getFirst().getImage()%>"
														alt="">
												</div>
												<div class="audio sub-audio" style="width:40%">
														<audio src="/MVC/<%=typeTwoQuestionModel.getDataQuestionModel().getDataQuestion()%>" style="margin-top: 0px;" controls="controls"></audio>
													</div>
												<div class="content-text" style="margin-top:15px;">
												<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
													Transcript <span class="fas fa-caret-down ml-1"></span>
												</span>
												<div id="coll<%=i%>" class="collapse">
													<div>
														<pre class="transcript-content"><%=typeTwoQuestionModel.getDataQuestionModel().getTranscript()%></pre>
													</div>
												</div>
											</div>
											</div>
										
										</div>
										<div class="col-xl-5">
											<div class="inner-wrap-question">
												<%
												int j = i;
												for (; i < j + 3; i++) {
												%>
												<div class="question" id="question<%=i + 1%>">
													<div class="order-number">
														<p class="order-number-text"><%=i + 1%></p>
													</div>

													<div class="answer">
														<p class="question-text"><%=((TypeTwoQuestionModel) pairs.get(i).getFirst()).getQuestionContent()%></p>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
														</div>
														<div class="answer-correct">
															<p style="color: green">
																Đáp án đúng:
																<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
														</div>

														<div class="content-text">
															<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
																Lời Giải <span class="fas fa-caret-down ml-1"></span>
															</span>
															<div id="collEx<%=i%>" class="collapse">
																<div>
																	<pre class="transcript-content"><%=(pairs.get(i).getFirst()).getAnswerExplain()%></pre>
																</div>
															</div>
														</div>
													</div>
												</div>
												<%
												}
												%>
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
									if (pairs.get(i).getFirst() != null) {
								%>
								<div class="question-group">
									<div class="question" id="question<%=i + 1%>">
										<div class="order-number">
											<p class="order-number-text"><%=i + 1%></p>
										</div>
										<div class="answer">
											<p class="question-text"><%=((TypeTwoQuestionModel) pairs.get(i).getFirst()).getQuestionContent()%></p>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
														</div>
														<div class="answer-correct">
															<p style="color: green">
																Đáp án đúng:
																<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
														</div>

														<div class="content-text">
															<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
																Lời Giải <span class="fas fa-caret-down ml-1"></span>
															</span>
															<div id="collEx<%=i%>" class="collapse">
																<div>
																	<pre class="transcript-content"><%=(pairs.get(i).getFirst()).getAnswerExplain()%></pre>
																</div>
															</div>
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
															src="/MVC/<%=((TypeTwoQuestionModel)pairs.get(i).getFirst()).getDataQuestionModel().getDataQuestion()%>"
															alt="anh_mo_ta">
													</div>
													<div class="content-text">
												<span data-toggle="collapse" data-target="#coll<%=i%>">Xem
													Transcript <span class="fas fa-caret-down ml-1"></span>
												</span>
												<div id="coll<%=i%>" class="collapse">
													<div>
														<pre class="transcript-content"><%=((TypeTwoQuestionModel)pairs.get(i).getFirst()).getDataQuestionModel().getTranscript()%></pre>
													</div>
												</div>
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
															<input type="radio" disabled
																<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
														</div>
														<div class="answer-correct">
															<p style="color: green">
																Đáp án đúng:
																<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
														</div>

														<div class="content-text">
															<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
																Lời Giải <span class="fas fa-caret-down ml-1"></span>
															</span>
															<div id="collEx<%=i%>" class="collapse">
																<div>
																	<pre class="transcript-content"><%=(pairs.get(i).getFirst()).getAnswerExplain()%></pre>
																</div>
															</div>
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
									if((pairs.get(j).getFirst()).getDataQuestionModel().getDataQuestionID() != 0){%>
									<div class="questions-group">
										<div class="row"> 
											<div class="col-xl-7">
												<div class="inner-wrap-img">
													<img
															src="/MVC/<%=((TypeTwoQuestionModel)pairs.get(j).getFirst()).getDataQuestionModel().getDataQuestion()%>"
															alt="anh_mo_ta">
													<div class="content-text">
												<span data-toggle="collapse" data-target="#coll<%=j%>">Xem
													Transcript <span class="fas fa-caret-down ml-1"></span>
												</span>
												<div id="coll<%=j%>" class="collapse">
													<div>
														<pre class="transcript-content"><%=((TypeTwoQuestionModel)pairs.get(j).getFirst()).getDataQuestionModel().getTranscript()%></pre>
													</div>
												</div>
												</div> 
												</div>
											</div>
											<div class="col-xl-5">
												<div class="inner-wrap-question">
														<% int i = j;	
													while(i != 200 && ((TypeTwoQuestionModel)pairs.get(i).getFirst()).getDataQuestionID() == ((TypeTwoQuestionModel)pairs.get(j).getFirst()).getDataQuestionID()) {%>
														<div class="question" id="question<%=i + 1%>">
														<div class="order-number">
															<p class="order-number-text"><%=i + 1%></p>
														</div>
														<div class="answer">
															<p class="question-text"><%=((TypeTwoQuestionModel)pairs.get(j).getFirst()).getQuestionContent()%></p>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("A".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>A. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerA()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("B".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>B. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerB()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("C".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>C. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerC()%></label>
														</div>
														<div class="wrap-answer">
															<input type="radio" disabled
																<%if ("D".equals(pairs.get(i).getSecond())) {%> checked
																<%}%>> <label>D. <%=((TypeTwoQuestionModel) (pairs.get(i).getFirst())).getContentAnswerD()%></label>
														</div>
														<div class="answer-correct">
															<p style="color: green">
																Đáp án đúng:
																<%=pairs.get(i).getFirst().getAnswerCorrect()%></p>
														</div>

														<div class="content-text">
															<span data-toggle="collapse" data-target="#collEx<%=i%>">Xem
																Lời Giải <span class="fas fa-caret-down ml-1"></span>
															</span>
															<div id="collEx<%=i%>" class="collapse">
																<div>
																	<pre class="transcript-content"><%=(pairs.get(i).getFirst()).getAnswerExplain()%></pre>
																</div>
															</div>
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
				</div>
				<div class="col-xl-2" id="sidebar">
					<div class="sidebar top">
						<p class="number-part">Part 1</p>
						<ul class="sidebar-1">
							<%
							for (int i = 1; i <= 6; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null) {
									strColor = "yellow";
								} else {
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())) {
								strColor = "green";
									} else {
								strColor = "red";
									}
								}
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 2</p>

						<ul class="sidebar-2">
							<%
							for (int i = 7; i <= 31; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null) {
									strColor = "yellow";
								} else {
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())) {
								strColor = "green";
									} else {
								strColor = "red";
									}
								}
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>

						<p class="number-part">Part 3</p>
						<ul class="sidebar-3">
							<%
							for (int i = 32; i <= 70; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null) {
									strColor = "yellow";
								} else {
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())) {
								strColor = "green";
									} else {
								strColor = "red";
									}
								}
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>

						<p class="number-part">Part 4</p>
						<ul class="sidebar-4">
							<%
							for (int i = 71; i <= 100; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null) {
									strColor = "yellow";
								} else {
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())) {
								strColor = "green";
									} else {
								strColor = "red";
									}
								} 
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 5</p>

						<ul class="sidebar-5">
							<%
							for (int i = 101; i <= 130; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null){
									strColor = "yellow";
								} 
								else{
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())){
										strColor = "green";
									}
									else {
										strColor = "red";
									}
								}
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 6</p>

						<ul class="sidebar-6">
							<%
							for (int i = 131; i <= 146; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null){
									strColor = "yellow";
								}
								else{
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())){
										strColor = "green";
									}
									else {
										strColor = "red";
									}
								}
							%>
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
							<%
							}
							%>
						</ul>
						<p class="number-part">Part 7</p>

						<ul class="sidebar-7">
							<%
							for (int i = 147; i <= 200; i++) {
								String strColor = "";
								if (pairs.get(i - 1).getSecond() == null){
									strColor = "yellow";
								}
								else{
									if (pairs.get(i - 1).getSecond().equals(pairs.get(i - 1).getFirst().getAnswerCorrect())){
										strColor = "green";
									}
									else {
										strColor = "red";
									}
								}
							%> 
							<li><a href="#question<%=i%>" style="color: <%=strColor%>"><%=i%></a></li>
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
                    }
                });
            });
        });

    </script>
</body>

</html>