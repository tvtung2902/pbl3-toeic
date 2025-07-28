<%@page import="com.pbl3.model.TestsModel"%>
<%@page import="com.pbl3.model.TypeOneQuestionModel"%>
<%@page import="com.pbl3.model.QuestionModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.libs.Result"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Study TOIEC</title>
</head>

<body style="color: black;">
    <style>
	<%@include file="../../../assets/css/base.css"%>
    <%@include file="../../../assets/css/styleResult.css"%>  
	</style>

	<!-- header  -->
	<%@include file="../re-use/header.jsp"%>
	<!--endheader  -->
	<%
	Result result = (Result) request.getAttribute("result");
	TestsModel testsModel = (TestsModel) request.getAttribute("testsModel");
	%>
    <div class="section-one">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                        <div class="content-wrap">
                            <div class="name-test">Kết Quả Bài Thi: <%=testsModel.getTestsName()%></div>
                            <div class="result">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="result-box-one">
                                            <div class="result-box-one-item">
                                                <span class="icon"><i class="fa-regular fa-circle-check"></i></span>        
                                                <span class="label">Kết quả bài thi</span>
                                                <span class="text"><%=result.getRightAnswerListening() + result.getRightAnswerReading()%>/200</span>
                                            </div>
                                            <div class="result-box-one-item">
                                                <span class="icon"><i class="fa-regular fa-circle-dot"></i></span>         
                                                <span class="label">Độ chính xác </span>
                                                <span class="text"><%=1.0*(result.getRightAnswerListening() + result.getRightAnswerReading()) / 2%>%</span>
                                            </div> 
                                            <div class="result-box-one-btn">  
                                                    <a href="/MVC/tests/result-detail?history-of-test=<%=request.getParameter("history-of-test")%>" class="button-main button-main-two">
                                                        Xem Chi Tiết Đáp Án  
                                                    </a>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-3">
                                                <div class="result-box-two">
                                                    <div class="icon-true"><span class="fas fa-check-circle"></span></div>
                                                    <div class="result-text-true">Trả lời đúng</div>
                                                    <div class="number"><%=result.getRightAnswerListening() + result.getRightAnswerReading()%></div>
                                                    <div class="text"><span>câu hỏi</span></div>
                                                </div>
                                            </div>    
                                            <div class="col-3">   
                                                <div class="result-box-two">
                                                    <div class="icon-false"><span class="fas fa-times-circle"></span></span></div>
                                                    <div class="result-text-false">Trả lời sai</div>
                                                    <div class="number"><%=result.getWrongAnswer()%></div>
                                                    <div class="text"><span>câu hỏi</span></div>
                                                </div>
                                            </div>
                                            <div class="col-3">      
                                                <div class="result-box-two">
                                                    <div class="icon-skip"><span class="fas fa-minus-circle"></span></div>
                                                    <div class="result-text-skip">Bỏ Qua</div>
                                                    <div class="number"><%=result.getSkip()%></div>
                                                    <div class="text"><span>câu hỏi</span></div>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="result-box-two">
                                                    <div class="icon-score"><i class="fa-solid fa-flag"></i></div>
                                                    <div class="result-text-score">Điểm</div>
                                                    <div class="score"><%=result.getScoreListening() + result.getScoreReading()%></div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="result-box-two">
                                                    <div class="toiec">Listening</div>
                                                    <div class="score-toiec"><%=result.getScoreListening()%></div>
                                                    <div class="text"><span>Trả Lời Đúng:  <%=result.getRightAnswerListening()%>/100 </span></div>
                                                </div>
                                            </div>   
                                            <div class="col-6"> 
                                                <div class="result-box-two">
                                                    <div class="toiec">Reading</div>
                                                    <div class="score-toiec"><%=result.getScoreReading()%></div>
                                                    <div class="text"><span>Trả Lời Đúng:  <%=result.getRightAnswerReading()%>/100 </span></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <!-- <footer> -->
	<%@include file="../re-use/footer.jsp"%>
	<!-- end footer -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
    </script>
   
</body>

</html>