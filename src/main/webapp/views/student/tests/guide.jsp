<%@page import="com.pbl3.model.HistoryOfTestModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.TestsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Study TOIEC</title>
<style>
        <%@ include file="../../../assets/css/base.css" %>
        <%@ include file="../../../assets/css/styleGuide.css" %>
    </style>
</head>
<body style="color: black;">
	
	<%@include file="../re-use/header.jsp" %>
	    <div class="section-one">
        <div class="container" style="max-width: calc(100% - 450px);">
            <div class="row">
                <div class="col-xl-12">
                        <div class="content-wrap">
                            <div class="title">Hướng Dẫn Làm Đề Thi</div>
                            <div class="inner-wrap">
                                <h4>
                                    Bài kiểm tra được chia ra làm hai phần:
                                    Phần Nghe và phần Đọc.
                                </h4>
                                <h5>Listening (Phần I : Nghe)</h5>
                                <p>Thời gian làm phần kiểm tra Nghe là 45 phút. Bao gồm 4 phần
                                    từ Part 1 – Part 4. Bạn sẽ lần lượt lắng nghe và chọn câu trả lời
                                    đúng nhất tương ứng với câu hỏi được đặt ra bằng cách chọn đáp án
                                    đúng trên hệ thống</p>
                                <h5>Reading (Phần II : Đọc – hiểu)</h5>
                                <p>Chuyên mục Đọc- Hiểu. Thời gian cho phần này kéo dài 75
                                    phút. Mục này gồm có 3 phần, từ Part 5 – Part 7. Bạn được khuyến
                                    khích trả lời nhiều câu hỏi càng tốt trong thời gian cho phép. Bạn
                                    phải đánh dấu câu trả lời của bạn vào phiếu trả lời. Đừng viết câu
                                    trả lời của bạn trong đề thi.</p>
                            </div>

                        </div>
                        <br>
                        <%
						int number = ((LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")).size();
                        if (number != 0) {
						%>
                        <h4>Lịch sử làm đề thi này của bạn: </h4>
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">Số thứ tự</th>
                                <th scope="col">Ngày làm</th>
                                <th scope="col">Kết quả</th>
                              </tr>
                            </thead>
                            <tbody>
                            	<%
                            	int i = 1; 
								for (HistoryOfTestModel h : (LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")) {
								%>
                              <tr>
                                <th scope="row"><%=i++%></th>
                                <td><%=h.getDate()%></td>
                                <td><a href="/MVC/tests/result?history-of-test=<%=h.getHistoryOfTestID()%>">Xem chi tiết</a></td>
                              </tr>
                              <%} %> 
                            </tbody>
                        </table>
                        <%}%>
                        <div class="start">
                            <a class="button-main button-main-one" href="/MVC/tests/start?testsID=<%=request.getParameter("testsID")%>" style="padding-left: 35px; padding-right: 35px; "><%if(number == 0){%>Làm đề thi<%}else {%> Làm lại đề thi<%} %></a>
                        </div>        
                </div> 
            </div>
        </div>
    </div>
	<%@include file="../re-use/footer.jsp" %>
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