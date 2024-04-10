<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
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
	text-align: center;
}

.box {
	width: 100%;
	height: auto;
	color: red;
	border: 1px solid red;
	margin-bottom: 30px;
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
		<h1>DAY LA TRANG VOCAB</h1>
		<br>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal">Them Tu Vung</button>
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
						<form method="post"
							action="/MVC/vocab-lists/vocab/create?listID=<%=request.getParameter("listID")%>">
							<div class="row">
								<div class="col-12">

									<div class="form-group">
										<input name="vocab" type="text" class="form-control"
											placeholder="Nghia tieng anh">

									</div>
									<div class="form-group">
										<input name="mean" type="text" class="form-control"
											placeholder="Nghia tieng viet">

									</div>

									<div class="form-group">
										<input name="wordType" type="text" class="form-control"
											placeholder="Tu Loai">

									</div>

									<textarea name="example" id="" cols="30" rows="10"></textarea>

									<button class="button">Them</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <a
			href="vocab/review?listID=<%=request.getAttribute("listID")%>">
			luyen tap</a> <br> <br>
		<div class="row">
			<%
			int i = 0;
			%>
			<%
			for (VocabModel v : (LinkedList<VocabModel>) request.getAttribute("vocabModels")) {
			%>
			<div class="col-12">
				<div class="box">
					<p>
						ID:
						<%=v.getVocabID()%></p>
					<p>
						TA:
						<%=v.getVocab()%></p>

					<p>
						TV:
						<%=v.getMean()%></p>

					<p>
						TL:
						<%=v.getWordType()%></p>

					<p>
						VD:
						<%=v.getExample()%></p>
					<%
					i++;
					%>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal<%=i%>">SUA</button>
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
									<form method="post"
										action="/MVC/vocab-lists/vocab/edit?listID=<%=request.getParameter("listID")%>">
										<div class="row">
											<div class="col-12">

												<div class="form-group">
													<input name="vocabID" type="hidden" class="form-control"
														placeholder="Nghia tieng anh" value="<%=v.getVocabID()%>">

												</div>

												<div class="form-group">
													<input name="vocab" type="text" class="form-control"
														placeholder="Nghia tieng anh" value="<%=v.getVocab()%>">

												</div>
												<div class="form-group">
													<input name="mean" type="text" class="form-control"
														placeholder="Nghia tieng viet" value="<%=v.getMean()%>">

												</div>

												<div class="form-group">
													<input name="wordType" type="text" class="form-control"
														placeholder="Tu Loai" value="<%=v.getWordType()%>">

												</div>

												<textarea name="example" id="" cols="30" rows="10" value=""><%=v.getExample()%></textarea>

												<button class="button">Gui Di</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<form
						action="/MVC/vocab-lists/vocab/delete?vocabID=<%=v.getVocabID()%>&listID=<%=request.getParameter("listID")%>"
						method="post">
						<input type="submit" value="Xóa" />
					</form>

				</div>

			</div>


			<%
			}
			%>
		</div>


	</div>
	</div>
	</div>
	<script>
		
	</script>
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