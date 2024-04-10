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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>
<body>
	<style>
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

h1 {
	text-align: center;
}

.box {
	width: 250px;
	height: 300px;
	color: red;
	border: 1px solid red;
}

.inner-wrap {
	padding: 30px;
	border: 1px solid blue;
	width: 100%;
}

.row {
	margin-bottom: 30px;
}

a{
	font-size: 50px;
}

.modal-form .modal-body {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
	
	<div class="container">
		<h1>DAY LA TRANG Guide</h1>
		<div class="row">
			<div class="col-12">
				<div class="inner-wrap">
					<h2>
						Hướng dẫn chung: <br> Bài kiểm tra được chia ra làm hai phần:
						Phần Nghe và phần Đọc.
					</h2>
					<h4>Section I: Listening ( Phần I : Nghe)</h4>
					<p>Thời gian làm phần kiểm tra Nghe là 45 phút. Bao gồm 4 phần
						từ Part 1 – Part 4. Bạn sẽ lần lượt lắng nghe và chọn câu trả lời
						đúng nhất tương ứng với câu hỏi được đặt ra bằng cách chọn đáp án
						đúng trên hệ thống</p>
					<h4>Section II: Reading (Đọc – hiểu)</h4>
					<p>Chuyên mục Đọc- Hiểu. Thời gian cho phần này kéo dài 75
						phút. Mục này gồm có 3 phần, từ Part 5 – Part 7. Bạn được khuyến
						khích trả lời nhiều câu hỏi càng tốt trong thời gian cho phép. Bạn
						phải đánh dấu câu trả lời của bạn vào phiếu trả lời. Đừng viết câu
						trả lời của bạn trong đề thi.</p>
				</div>
				<%
				int number = ((LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")).size();
				%>
				<%
				if (number != 0) {
				%>
				<div>
					<h2>Lịch sử làm bài của bạn</h2>
					<%
					for (HistoryOfTestModel h : (LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")) {
					%>
					<div>
						<p>
							Ngày thực hiện:
							<%=h.showDate()%>, Diem:
							<%=h.getScore()%>
						</p>
						<!-- Button trigger modal -->

					</div>
					<%
					}
					%>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">LÀM LẠI ĐỀ THI</button>

					<!-- Modal -->
					<div class="modal fade modal-form" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<img class="inner-image"
										src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F"
										alt="">
									<h5 class="inner-title" id="exampleModalLabel">Bắt Đầu Làm
										Bài</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								
								<div class="modal-body">
								
												<%// the aaaa %>
								<a href="/MVC/tests/start?testsID=<%=request.getParameter("testsID")%>">
								DONG Y
								</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				} else {
				%>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal">LÀM ĐỀ THI</button>

				<!-- Modal -->
				<div class="modal fade modal-form" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<img class="inner-image"
									src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F"
									alt="">
								<h5 class="inner-title" id="exampleModalLabel">Bắt Đầu Làm
									Bài</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- <form method action="/MVC/tests/start?testsID=<%=request.getParameter("testsID")%>">
								the a
								</a>
									<div class="row">
										<div class="col-12">

											<button class="button">Đồng ý</button>
										</div>
									</div>
								</form>
								-->
								<a href="/MVC/tests/start?testsID=<%=request.getParameter("testsID")%>"> DONG Y </a>
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