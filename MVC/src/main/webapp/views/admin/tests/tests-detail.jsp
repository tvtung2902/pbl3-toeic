<%@page import="com.pbl3.model.User_TestsModel"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
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
	 <style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>
                <%@include file="../../../../assets/css/style-tests.css"%>
    </style>
</head>
<body>
	<style>
.menu .item li:nth-child(5) a {
	color: var(--color-one);
}
  
.menu .item li:nth-child(5) i {
	color: var(--color-one);
}
.card-test {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 15px;
    transition: transform 0.4s
}
.card-test:hover {
    transform: scale(1.02); /* Phóng to card khi di chuột qua */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.text-test {
    margin-bottom: 10px;
    display: block;
}

.text-title-test {
    margin-bottom: 10px;
    font-size: 300;
    font-weight: 600;
    color: var(--color-one);
}

.text-desc-test {
    display: inline-block;
    font-size: 300;
    color: var(--color-text);
    font-weight: 500;
}
.col-3 {
    margin-top: 25px;
    margin-bottom: 15px;
}
</style>
	<!-- Menu sidebar -->
	<%@ include file="../re-use/header.jsp"%>
	<!-- Main -->
		<div class="main" id="main">  
			<div class="container">
			<div class="wrap-background"> 
			<%if(((LinkedList<User_TestsModel>)request.getAttribute("teacher_tests")).size() != 0){ %> 
			<h2 class="name">Các Đề Thi Của Giáo Viên <%=((UserModel)request.getAttribute("teacher")).getName()%> </h2>
			<div class="row tests" style="margin-top: 15px">
			<%for(User_TestsModel t : (LinkedList<User_TestsModel>)request.getAttribute("teacher_tests")){ %>
                <div class="col-xl-3">
                    <a>
                        <div class="inner-wrap">
                            <div class="inner-img">
                                <img src="https://images.unsplash.com/photo-1513258496099-48168024aec0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="listvocab">
                            </div>
                            <div class="inner-content">
                                <h3 class="inner-listname">
                                    <%=t.getTestName() %>
                                </h3>  
							<!-- 
							    <div class="link">
                            		<a href="/MVC/teacher/tests/detail?testsID=<%//u.getTestsID()%>"> 
										<button class="button-detail">
											Xem Chi Tiết
										</button>
									</a>
                            	</div>
							 -->
                            </div>
                            <div class="inner-number" style="position: static;
    width: 100%;">
                            <p style="display: flex;
    justify-content: space-between;"> 
                            <span><i class="fa-solid fa-user-pen"></i> <%=t.getCountUser()%></span> 
                            <span> Lượt thi: <%=t.getCountTimes()%></span>
                            <%if(t.getStatus()){ %>
                            <p style="margin-top:5px; color:var(--color-one);text-align: end;">Đã phát hành</p>
                            <%}else{ %>
                            <p style="margin-top:5px;color:red;text-align: end;">Chưa phát hành</p>
                            <%} %>
                            
                            </p>
                            </div>
                        </div>
                    </a>
                </div>
				<%} %>  
			</div>  
			<%}else{ %>
				<h3 class = "name" >Giáo Viên <%=((UserModel)request.getAttribute("teacher")).getName()%> Chưa Tạo Đề Thi Nào !</h3>
			<%} %>
		</div>
		</div>
	</div>

	<!-- end main -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script>
		function sortTable(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("mytable");
			switching = true;
			dir = "asc";
			while (switching) {
				switching = false;
				rows = table.rows;
				for (i = 1; i < (rows.length - 1); i++) {
					shouldSwitch = false;
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					// Check if x and y are both numbers
					if (!isNaN(Number(x.innerHTML))
							&& !isNaN(Number(y.innerHTML))) {
						if (dir == "asc") {
							if (Number(x.innerHTML) > Number(y.innerHTML)) {
								shouldSwitch = true;
								break;
							}
						} else if (dir == "desc") {
							if (Number(x.innerHTML) < Number(y.innerHTML)) {
								shouldSwitch = true;
								break;
							}
						}
					} else {
						// If either x or y is not a number, compare them as strings
						if (dir == "asc") {
							if (x.innerHTML.toLowerCase() > y.innerHTML
									.toLowerCase()) {
								shouldSwitch = true;
								break;
							}
						} else if (dir == "desc") {
							if (x.innerHTML.toLowerCase() < y.innerHTML
									.toLowerCase()) {
								shouldSwitch = true;
								break;
							}
						}
					}
				}
				if (shouldSwitch) {
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					switchcount++;
				} else {
					if (switchcount == 0 && dir == "asc") {
						dir = "desc";
						switching = true;
					}
				}
			}
		}
	    function closefunc() {
	        const menu = document.getElementById("menu");
	        const main = document.getElementById("main");
	        menu.style.left = "-210px";
	        main.style.marginLeft = "0";
	        main.style.width = "100%"
	        document.getElementById("close-btn").classList.add("hidden");
	        document.getElementById("open-btn").classList.remove("hidden");
	    }
	    function openfunc() {
	        const menu = document.getElementById("menu");
	        const main = document.getElementById("main");
	        menu.style.left = "0"; 
	        main.style.marginLeft = "250px";
	        main.style.width = "calc(100% - 250px)"
	        document.getElementById("open-btn").classList.add("hidden");
	        document.getElementById("close-btn").classList.remove("hidden");
	    }
	</script>
</body>
</html>
