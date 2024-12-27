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
    </style>
</head>
<body>
	<style>
.menu .item li:nth-child(6) a {
	color: var(--color-one);
}

.menu .item li:nth-child(6) i {
	color: var(--color-one);
}
</style>
	<!-- Menu sidebar -->
	<%@ include file="../re-use/header.jsp"%>
	<!-- Main -->

	<div class="main" id="main">
		<div class="container" style="display: flex; flex-direction: column;">
		<div class="wrap-background">
			<h2 class="name">Quản Lí Người Dùng</h2>
			<div class="inner-search">   
				<a href="/MVC/admin/users/create" class="add-btn">Thêm Mới</a>
				<form action="" style="display: flex;">
					<select name="method" id="search-option" class="method">
						<option value="UserID"
							<%="UserID".equals(request.getParameter("method")) ? "selected" : ""%>>ID</option>
						<option value="UserName"
							<%="UserName".equals(request.getParameter("method")) ? "selected" : ""%>>Tên
							Đăng Nhập</option>
						<option value="Name"
							<%="Name".equals(request.getParameter("method")) ? "selected" : ""%>>Tên
							Người Dùng</option>
					</select>
					<div class="search">
						<i class="fa fa-search" style="cursor: pointer;"></i> <input
							value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>"
							name="keyword">
					</div>
					<button class="add-btn" type="submit" style="margin-left: 10px">Search</button>
				</form>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="last-main">
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
									<th scope="col">Mở rộng</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (UserModel u : (LinkedList<UserModel>) request.getAttribute("userModels")) {
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
									<td>
							<div style="display:flex;justify-content: space-around;">
							 <div class="inner-td" style="display: inline-block;">
                                <a href="/MVC/admin/users/edit?userID=<%=u.getUserID()%>"><i class="fa-regular fa-pen-to-square"></i></i></a>
                            </div>  
                     
							</div>

									</td>
								</tr>
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
									href="/MVC/admin/users?page=<%=currentPage - 1%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>">&laquo;</a>
								<%
								}

								// Hiển thị các liên kết cho từng trang và thêm lớp 'active' cho trang hiện tại
								for (int i = 1; i <= totalPage; i++) {
								%>
								<a
									href="/MVC/admin/users?page=<%=i%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>"
									<%=currentPage == i ? "class='active'" : ""%>><%=i%></a>
								<%
								}

								// Hiển thị nút "next" nếu trang hiện tại không phải là trang cuối cùng
								if (currentPage != totalPage) {
								%>
								<a
									href="/MVC/admin/users?page=<%=currentPage + 1%>&method=<%=method == null ? "UserID" : method%>&keyword=<%=keyword == null ? "" : keyword%>">&raquo;</a>
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
	</script>
</body>
</html>
