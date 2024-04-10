<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.HistoryOfTestModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
  	<style>
		
	</style>
	<div class="container">
		<h1 style="display: flex;">DAY LA TRANG MY ACCOUNT</h1>
		<br>
		<br>
		<a href="/MVC"> trang chu
		</a>
		<br>
		<a href="/MVC/logout">
			dang xuat
		</a>
		    <div class="section-one">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-tab" data-toggle="tab" data-target="#profile"
                                    type="button" role="tab" aria-controls="profile" aria-selected="true">Khoa Hoc Cua
                                    Toi</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="contact-tab" data-toggle="tab" data-target="#contact" type="button"
                                    role="tab" aria-controls="contact" aria-selected="false">Lich Su Lam De</button>
                            </li>
                        </ul>
                    </div>


                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <h3>
                                KHOA  HOC DA DANG KI:
                            </h3>
                            
                        </div>


                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <h3>
                                LICH SU LAM DE: 
                            </h3>
                            <div>
					<%
					for (HistoryOfTestModel h : (LinkedList<HistoryOfTestModel>) request.getAttribute("historyOfTestModels")) {
					%>
					<div>
						<span>
							Ngày thực hiện: <%=h.showDate()%>, Diem: <%=h.getScore()%>
						</span>
						<a href="/MVC/tests/result?history-of-test=<%=h.getHistoryOfTestID()%>">xem chi tiết</a>
						<!-- Button trigger modal -->

					</div>
					<%
					}
					%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>  
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>