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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>   
    	<%@include file="../../../../assets/css/style-tests.css"%>
    	<%@include file = "../../../assets/css/style-vocablists.css"%>
    </style>
</head>  
<body>
	<style>
.menu .item li:nth-child(3) a {
	color: var(--color-one);
}

.menu .item li:nth-child(3) i {
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
.inner-search .buttonThem {
    background-color: var(--color-one);
    border: 0;
    padding: 5px 20px;
    border-radius: 20px;
}    
</style>
	<!-- Menu sidebar -->
	<%@include file="../re-use/sidebar.jsp"%>
	<!-- Main -->      
		<div class="main" id="main">
				<div class="container wrap-background"> 
			<h2 class="name">Quản Lí Đề Thi</h2> 
		<div class="inner-search">  
				<a class="button-add" data-toggle="modal" data-target="#add-listvocab">
                   <button class="add-btn">Thêm</button>
                </a>             
				<form action="" method="get" style="display: flex;"> 
                <div class="search">
                    <i class="fa fa-search" style="cursor: pointer;"></i>
                    <input
                        value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>"
                        name="keyword">
                </div>
                <button class="add-btn" type="submit" style="margin-left: 10px">Tìm Kiếm</button>
            </form>
			</div>
			<%
			if (((LinkedList<User_TestsModel>) request.getAttribute("teacher_tests")).size() != 0) {
			%>
			<div class="row tests" style="margin-top: 15px">
				<%
				for (User_TestsModel t : (LinkedList<User_TestsModel>) request.getAttribute("teacher_tests")) {
				%>
                <div class="col-xl-3">
                    <a href="/MVC/teacher/tests/detail?testsID=<%=t.getTestsID()%>">
                        <div class="inner-wrap">
                            <div class="inner-img">
                                <img src="https://images.unsplash.com/photo-1513258496099-48168024aec0?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="listvocab">
                            </div>
                            <div class="inner-content">
                                <h3 class="inner-listname">
                                    <%=t.getTestName() %>
                                </h3>  
                                <!-- <p class="inner-number">số lượng</p> -->
                            	<div class="link">
                            		<a href="/MVC/teacher/tests/detail?testsID=<%=t.getTestsID()%>"> 
										<button class="button-detail">
											Xem Chi Tiết
										</button>
									</a>
                            	</div>
                            </div>
                            <div class="inner-number" style="bottom:0px;border:none;">
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
				<%
				}
				%>
			</div>
			<%
			} else {
			%>
			<h3 class="name">
				Không tìm thấy đề thi nào !  
			</h3>
			<%
			}
			%>
		</div>
	</div>
	
	<div class="list-vocab">
				<div class="modal fade modal-form" id="add-listvocab" tabindex="-1"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>      
                                    <div class="modal-header">
                                        <h5 class="inner-title" id="add-listvocab">Thêm đề thi</h5>
                                    </div>
                                    <div class="modal-body">
                                         <form method="post" action="/MVC/teacher/tests/create" enctype="multipart/form-data" onsubmit="return validateForm();">
                                            <div class="row ">
                                                <div class="col-12" style="display:flex;     justify-content: center;">
                                                    <div class="form-group" style="width: 80%;
    margin: 0;
    padding: 0;">
                                                    <div class="form-group" style="padding:0;">
                                                        <label for="nameTest">Tên đề thi*:</label>
                                                        <input id="nameTest" name="testsName" type="text" onblur="checkNameTest();">
                                                        <p id="error-nameTest" style="color:red;"></p>
                                                        <label for="anh">Audio*:</label>
                                                        <input id="anh" type="file" name="audio" required="required">
                                                        <button class="buttonThem">Thêm</button>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
	    function checkNameTest(){
	    	var isValid=false;
	        var ten= document.getElementById('nameTest').value;
	        var regexTen = /^.{1,40}$/;
	        var errorTen=document.getElementById('error-nameTest');
	        if(ten==''||ten==null){
	             errorTen.textContent="Tên đề thi không được để trống!";
	        }else 
	        if(!regexTen.test(ten)){
	             errorTen.textContent="Tên đề thi không quá 40 kí tự";
	        }
	        else{
	        	isValid=true;
	             errorTen.textContent="";
	             
	        }
	        return isValid;
	     }
	    function validateForm() {
			if(checkNameTest() ){
	            alert("Thêm thành công!");
	            return true;
			}else{
				return false;
			}
	    }
	</script>
</body>
</html>
