<%@ page import="com.pbl3.model.CouponModel" %>
<%@ page import="java.util.LinkedList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>

        /* New style for table borders */
        table, th, td {
            border: 1px solid #dee2e6; 
            border-collapse: collapse;
        } 
    </style>  
</head>
<body>
<style>
.menu .item li:nth-child(3) a,
.menu .item li:nth-child(3) i {
    color: var(--color-one);
}  
</style>

<!-- Menu sidebar --> 
<%@ include file="../re-use/header.jsp" %>

<!-- Main -->
<div class="main" id="main">
    <div class="container" style="display: flex; flex-direction: column;">
    <div class="wrap-background">
        <h2 class="name">Quản Lí Mã Giảm Giá</h2>
        <div class="inner-search">
            <a href="/MVC/admin/coupon/create" class="add-btn">Thêm Mới</a>
            <form action="" method="get" style="display: flex;">
                <select name="method" id="search-option" class="method"> 
                    <option value="CouponID" <%= "CouponID".equals(request.getParameter("method")) ? "selected" : "" %>>ID</option>
                    <option value="Code" <%= "Code".equals(request.getParameter("method")) ? "selected" : "" %>>Mã</option>
                </select>    
                <div class="search">
                    <i class="fa fa-search" style="cursor: pointer;"></i>
                    <input
                        value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>"
                        name="keyword">
                </div>
                <button class="add-btn" type="submit" style="margin-left: 10px">Tìm Kiếm</button>
            </form>
        </div>  

        <div class="last-main">
            <table class="table verticle-middle table-responsive-md" id="mytable">
                <thead>
                    <tr>
                        <th onclick="sortTable(0)" scope="col">ID</th>
                        <th onclick="sortTable(1)" scope="col">Mã</th>
                        <th onclick="sortTable(2)" scope="col">Phần Trăm</th>
                        <th onclick="sortTable(3)" scope="col">Ngày Bắt Đầu</th>
                        <th onclick="sortTable(4)" scope="col">Ngày Kết Thúc</th>
                        <th onclick="sortTable(5)" scope="col">Số Lượng</th>
                        <th onclick="sortTable(6)" scope="col">Đã Nhập</th>
                        <th scope="col">Áp dụng</th>
                        <th scope="col">Mở rộng</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (CouponModel c : (LinkedList<CouponModel>) request.getAttribute("couponModels")) { %>
                    <tr>
                        <td><%= c.getCouponID() %></td>
                        <td><%= c.getCode() %></td>
                        <td><%= c.getPercent() %> %</td>
                        <td><%= c.getFormattedStartDate("dd-MM-yyyy") %></td>
                        <td><%= c.getFormattedEndDate("dd-MM-yyyy") %></td>
                        <td><%= c.getQuantity() %></td>
                        <td><%= c.getQuantityUsed() %></td>
                        <td><a href="/MVC/admin/coupon-course?couponID=<%= c.getCouponID() %>">Chi tiết</a></td>
                        <td>
							<div style="display:flex;justify-content: space-around;">
							 <div class="inner-td" style="display: inline-block;">
                                <a href="/MVC/admin/coupon/edit?couponID=<%= c.getCouponID() %>"><i class="fa-regular fa-pen-to-square"></i></i></a>
                            </div>  
                            
                            <a class="none-btn" style="cursor: pointer;" class="btn-delete"data-toggle="modal" data-target="#delete-vocab<%= c.getCouponID() %>" ><i class="fa-solid fa-trash-can"></i></a>
                                           <form
                                                action="/MVC/admin/coupon/delete?couponID=<%= c.getCouponID() %>"
                                                method="post">
                                                          <div class="modal-delete-vocab">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="delete-vocab<%= c.getCouponID() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn xóa mã giảm giá này?
													            </div>
													            <div class="modal-footer">
													              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
													              <button type="submit" class="btn btn-danger">Xóa</button>
													            </div>
													          </div>
													        </div>
													      </div>
													    </div>
                                           	 </form>
							</div>
                        </td>
                    </tr>
                    <% } %>
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
    // Lấy trang hiện tại từ tham số yêu cầu, nếu không có trang nào được chọn thì mặc định là trang đầu tiên
    int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

    // Hiển thị nút "previous" nếu trang hiện tại không phải là trang đầu tiên
    if (currentPage > 1) { %>
        <a href="/MVC/admin/coupon?page=<%= currentPage - 1 %>&method=<%= method != null ? method : "CouponID" %>&keyword=<%= keyword != null ? keyword : "" %>">&laquo;</a><%
    }

    // Hiển thị các liên kết cho từng trang và thêm lớp 'active' cho trang hiện tại
    for (int i = 1; i <= totalPage; i++) { %>
        <a href="/MVC/admin/coupon?page=<%= i %>&method=<%= method != null ? method : "CouponID" %>&keyword=<%= keyword != null ? keyword : "" %>" <%= currentPage == i ? "class='active'" : "" %>><%= i %></a><%
    }

    // Hiển thị nút "next" nếu trang hiện tại không phải là trang cuối cùng
    if (currentPage < totalPage) { %>
        <a href="/MVC/admin/coupon?page=<%= currentPage + 1 %>&method=<%= method != null ? method : "CouponID" %>&keyword=<%= keyword != null ? keyword : "" %>">&raquo;</a><%
    }
}
%>

                </div>
            </div>
            </div>
        </div>
    </div>
</div>

<!-- end main -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
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
                if (!isNaN(Number(x.innerHTML)) && !isNaN(Number(y.innerHTML))) {
                    if (dir == "asc" && Number(x.innerHTML) > Number(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    } else if (dir == "desc" && Number(x.innerHTML) < Number(y.innerHTML)) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (dir == "asc" && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    } else if (dir == "desc" && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
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
