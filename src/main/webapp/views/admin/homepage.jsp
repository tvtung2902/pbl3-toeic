<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>

<body>
<style>
		<%@ include file="../../assets/admin-css/base.css" %>
		<%@ include file="../../assets/admin-css/styleHomepage.css" %>
</style>
 
    <!-- Menu sidebar --> 
     <%@ include file="re-use/header.jsp" %>
    <!-- Main -->

    <div class="main" id="main">
        <div class="container">
        <div class="wrap-background"> 
        	<h2 class="name">Tổng Quan</h2>
        	            <div class="row">
                <div class="col-3">
                    <div class="inner-box">
                        <i class="fa fa-users"></i>
                        <div>
                            <h3><%=(int)request.getAttribute("countUsers")%></h3>
                            <span>Học viên</span>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="inner-box">
                        <i class="fa-solid fa-book-open-reader"></i>
                        <div>
                            <h3><%=(int)request.getAttribute("countCourse")%></h3>
                            <span>Khoá học</span>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="inner-box">
                        <i class="fa-solid fa-file-lines"></i>
                        <div>
                            <h3><%=(int)request.getAttribute("countTest")%></h3>
                            <span>Tổng Đề thi</span>
                        </div>
                    </div>
                </div> 
                <div class="col-3">
                    <div class="inner-box">
                        <i class="fa-solid fa-person-chalkboard"></i>
                        <div>
                            <h3><%=(int)request.getAttribute("countTeacher")%></h3>
                            <span>Giáo viên</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		
			<div class="wrap-background"> 		
            <h3 style="margin: 20px 0;">Khoá Học Tiêu Biểu</h3> 
            <div class="row">
				<%for( Pair<CourseModel, Integer> c : (LinkedList<Pair<CourseModel, Integer>>)request.getAttribute("courseModels")){%>
					<div class="col-xl-4">
                    <a>
                        <div class="inner-main">
                            <div class="inner-img">  
                                <img src="/MVC/<%=c.getFirst().getImage()%>"
                                    alt="picCourses">
                                <div class="inner-price">
                                    <%=c.getFirst().getPriceCH()%>
                                </div>
                            </div>
                            <h2 class="inner-title"><%=c.getFirst().getCourseName()%></h2>
                                                        <%if(c.getFirst().getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=c.getFirst().getInput() %>+ và mục tiêu đạt điểm <%=c.getFirst().getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=c.getFirst().getTarget() %>+</p>
                            <%} %>
                        </div>
                    </a>
                </div>	
				<%}%>
            </div>
            </div>
            
            <div class="wrap-background"> 
            <div class="last-main">
                <div class="title">
                    <h3 style="margin: 20px 0;">Người Dùng Mới</h3>
                </div>
										<table class="table verticle-middle table-responsive-md"
							id="mytable">
							<thead>
								<tr>
									<th onclick="sortTable(0)" scope="col">ID</th>
									<th onclick="sortTable(1)" scope="col">Tên Đăng Nhập</th>
									<th onclick="sortTable(2)" scope="col">Tên Người Dùng</th>
									<th onclick="sortTable(3)" scope="col">Số Điện Thoại</th>
									<th onclick="sortTable(4)" scope="col">Email</th>
									<th onclick="sortTable(5)" scope="col">Trạng Thái</th>
									<th onclick="sortTable(6)" scope="col">Giới tính</th>
									<th onclick="sortTable(7)" scope="col">Phân Quyền</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (UserModel u : (LinkedList<UserModel>) request.getAttribute("userRecent")) {
								%>
								<tr>
									<td><%=u.getUserID()%></td>
									<td><%=u.getUserName() == null ? "Chưa cập nhật" : u.getUserName()%></td>
									<%
									String img = "/MVC/" + u.getImage();
									%>
									<td><img
										src="<%=u.getImage() == null
		? "https://thumbs.dreamstime.com/b/worried-man-avata-avatar-worried-man-vector-illustration-107469775.jpg"
		: img%>"
										style="vertical-align: middle; display: inline-block; margin-right: 5px">
										<%=u.getName() == null ? "N/A" : u.getName()%></td>
									<td><%=u.getPhone() == null ? "N/A" : u.getPhone()%></td>
									<td><%=u.getEmail() == null ? "N/A" : u.getEmail()%></td>
									<td class="<%=u.getStatus() ? "Active" : "Inactive"%>"><p><%=u.getStatus() ? "Active" : "Inactive"%></p></td>
									<td><%=u.getGender() == null ? "N/A" : u.getGender() ? "Nam" : "Nữ"%>
									</td>
									<td><%=u.getRoleModel().getRoleName()%></td>
								</tr>
								<%
								}
								%> 
							</tbody>
						</table>  
            </div>
             </div>

        </div>
    </div>







    <!-- end Main -->

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>


</body>
<script>
    var ascending = true;

    function sortTable(columnIndex) {
        var table, rows, switching, i, x, y;
        table = document.getElementById("mytable");
        switching = true;
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                var shouldSwitch = false;
                x = rows[i].getElementsByTagName("td")[columnIndex];
                y = rows[i + 1].getElementsByTagName("td")[columnIndex];
                if (ascending) {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
        ascending = !ascending;
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