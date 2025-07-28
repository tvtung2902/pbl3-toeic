<%@page import="com.pbl3.libs.PriceStandardization"%>
<%@ page import="com.pbl3.model.Register_CourseModel"%>
<%@ page import="java.util.LinkedList"%>
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
	<style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>
    </style>  
</head>
<body>
	<style>
.menu .item li:nth-child(4) a {
	color: var(--color-one);
}

.menu .item li:nth-child(4) i {
	color: var(--color-one);
}
</style>
	<!-- Menu sidebar -->
	<%@ include file="../re-use/header.jsp"%>
	<!-- Main -->

	<div class="main" id="main">
		<div class="container">   
		<div class="wrap-background">
			<h3 class="name">Xác Nhận Đăng Kí Khóa Học</h3>
			<div class="inner-search" style="flex-direction: row">
				<form action="" style="display: flex;">
					<select name="method" id="search-option" class="method">
						<option value="CourseID"
							<%="CourseID".equals(request.getParameter("method")) ? "selected" : ""%>>ID
							Khóa Học</option>
						<option value="UserID"
							<%="UserID".equals(request.getParameter("method")) ? "selected" : ""%>>ID
							Người Dùng</option>
						<option value="Date"
							<%="Date".equals(request.getParameter("method")) ? "selected" : ""%>>Ngày
							Đăng Kí</option>
						<option value="ConfirmDate"
							<%="ConfirmDate".equals(request.getParameter("method")) ? "selected" : ""%>>Ngày
							Xác Nhận</option>
					</select>
					<div class="search">
						<i class="fa fa-search" style="cursor: pointer;"></i> <input
							value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>"
							name="keyword">
					</div>
					<button class="add-btn" type="submit" style="margin-left: 10px">Search</button>
				</form>
			</div>
			<div class="last-main">
				<table class="table verticle-middle table-responsive-md"
					id="mytable">
					<thead>
						<tr>
							<th onclick="sortTable(0)" scope="col">ID Học viên</th>
							<th onclick="sortTable(1)" scope="col">ID Khóa học</th>
							<th onclick="sortTable(2)" scope="col">Thành Tiền</th>
							<th onclick="sortTable(3)" scope="col">Tiền Trả GV</th>
							<th onclick="sortTable(4)" scope="col">Lợi Nhuận</th>
							<th onclick="sortTable(5)" scope="col">Ngày Đăng Kí</th>
							<th onclick="sortTable(6)" scope="col">Ngày Xác Nhận</th>
							<th onclick="sortTable(6)" scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<%
						@SuppressWarnings("unchecked")
						LinkedList<Register_CourseModel> registerCourses = (LinkedList<Register_CourseModel>) request
								.getAttribute("registerCourses");
						%>
						<%
						if (registerCourses != null) {
						%>
						<%
						for (Register_CourseModel r : registerCourses) {
						%>
						<tr>
							<td><%=r.getUserID()%></td>
							<td><%=r.getCourseID()%></td>
							<td><%=PriceStandardization.getPriceCH(r.getAmount())%></td>
							<td><%=PriceStandardization.getPriceCH(r.getAmountOfTeacher())%></td>
							<td><%=PriceStandardization.getPriceCH(r.getAmount() - r.getAmountOfTeacher())%></td>
							<td><%=r.getDate().toString()%></td>
							<td>
								<%
								if (r.getConfirmDate() != null) {
								%> <%=r.getConfirmDate().toString()%>
								<%
								} else if ("waiting".equals(r.getStatus())) {
								%> Chờ xác nhận <%
								} else {
								%>
								Đã hủy bỏ <%
								}
								%>
							</td>
							<td>
								<%
								if ("waiting".equals(r.getStatus())) {
								%>
							<div style="display:flex;justify-content: space-around; justify-content: flex-start;">
								<div class="inner-td" style="display: inline-block;" >                            
									<i data-toggle="modal" data-target="#confirmModal<%=r.getRegisterCourseID()%>" class="fa-solid fa-circle-check" style="margin-right: 13px"></i>
								</div>
								<div class="modal fade"
									id="confirmModal<%=r.getRegisterCourseID()%>" 
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Người
													dùng đã chuyển khoản đầy đủ?</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="/MVC/admin/register-course/confirm"
													method="post">
													<input type="hidden" name="registerCourseID"
														value="<%=r.getRegisterCourseID()%>">
													<button type="submit" class="btn btn-success">Xác
														nhận</button>
												</form>

											</div>
										</div>
									</div>
								</div>
								
								<div class="inner-td" style="display: inline-block; color: red;">
									<i data-toggle="modal" data-target="#cancelModal<%=r.getRegisterCourseID()%>" class="fa-solid fa-trash-can"></i>
								</div>
								<div class="modal fade"
									id="cancelModal<%=r.getRegisterCourseID()%>"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">   
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Người
													dùng chưa chuyển khoản đầy đủ?</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="/MVC/admin/register-course/cancel"
													method="post">
													<input type="hidden" name="registerCourseID"
														value="<%=r.getRegisterCourseID()%>">
													<button type="submit" class="btn btn-danger">Không
														Xác Nhận</button>
												</form>

											</div>
										</div>
									</div>
								</div>
							</div> <%
 } else if ("confirmed".equals(r.getStatus())) {
 %> Đã xác nhận <%
 } else if ("cancel".equals(r.getStatus())) {
 %>
								Đã hủy bỏ <%
 }
 %>
							</td>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="pag">
					<div class="pagination">
								<%
								// Lấy tổng số trang từ thuộc tính của yêu cầu
								int totalPage = (Integer) request.getAttribute("totalPage");
								// Lấy phương thức tìm kiếm và từ khóa tìm kiếm từ tham số yêu cầu
								String method = request.getParameter("method");
								String keyword = request.getParameter("keyword");

								// Kiểm tra nếu tổng số trang lớn hơn 1
								if (totalPage > 1) {
									// Lấy trang hiện tại từ tham số yêu cầu
									int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

									// Hiển thị nút "previous" nếu trang hiện tại không phải là trang đầu tiên
									if (currentPage != 1) {
								%>
								<a
									href="/MVC/admin/register-course?page=<%=currentPage - 1%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>">&laquo;</a>
								<%
								}

								// Hiển thị các liên kết cho từng trang và thêm lớp 'active' cho trang hiện tại
								for (int i = 1; i <= totalPage; i++) {
								%>
								<a
									href="/MVC/admin/register-course?page=<%=i%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>"
									<%=currentPage == i ? "class='active'" : ""%>><%=i%></a>
								<%
								}

								// Hiển thị nút "next" nếu trang hiện tại không phải là trang cuối cùng
								if (currentPage != totalPage) {
								%>
								<a
									href="/MVC/admin/register-course?page=<%=currentPage + 1%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>">&raquo;</a>
								<%
								} 
								}
								%>
							</div>
				</div>
			</div>
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
					if (!isNaN(Number(x.innerHTML))
							&& !isNaN(Number(y.innerHTML))) {
						if (dir == "asc"
								&& Number(x.innerHTML) > Number(y.innerHTML)) {
							shouldSwitch = true;
							break;
						} else if (dir == "desc"
								&& Number(x.innerHTML) < Number(y.innerHTML)) {
							shouldSwitch = true;
							break;
						}
					} else {
						if (dir == "asc"
								&& x.innerHTML.toLowerCase() > y.innerHTML
										.toLowerCase()) {
							shouldSwitch = true;
							break;
						} else if (dir == "desc"
								&& x.innerHTML.toLowerCase() < y.innerHTML
										.toLowerCase()) {
							shouldSwitch = true;
							break;
						}
					}
				}
				if (shouldSwitch) {
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
					switchcount++;
				} else if (switchcount == 0 && dir == "asc") {
					dir = "desc";
					switching = true;
				}
			}
		}
	</script>
</body>
</html>
