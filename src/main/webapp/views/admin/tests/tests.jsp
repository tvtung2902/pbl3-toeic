<%@page import="java.time.YearMonth"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.Teacher_TestsModel"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        <%@ include file="../../../assets/admin-css/base.css" %>
        <%@ include file="../../../assets/admin-css/style.css" %>
    </style>
    <style>
        .menu .item li:nth-child(5) a {
            color: var(--color-one);
        }
        .menu .item li:nth-child(5) i {
            color: var(--color-one);
        }
    </style>
</head>
<body>
    <!-- Menu sidebar -->
    <%@ include file="../re-use/header.jsp"%>
    <!-- Main -->
    <div class="main" id="main">
        <div class="container" style="display: flex; flex-direction: column;">
        <div class="wrap-background">
            <h2 class="name">Quản Lí Đề Thi</h2>
            <div class="row" style="margin-top: 15px;">
                <div class="col-12">
                    <div class="last-main">
                        <table class="table verticle-middle table-responsive-md" id="mytable">
                            <thead>
                                <tr>
                                    <th onclick="sortTable(0)" scope="col">ID</th>
                                    <th onclick="sortTable(1)" scope="col">Tên Giáo Viên</th>
                                    <th onclick="sortTable(2)" scope="col">Đã Tạo</th>
                                    <th onclick="sortTable(3)" scope="col">Đang Tạo</th>
                                    <th scope="col">Chi Tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Teacher_TestsModel t : (LinkedList<Teacher_TestsModel>) request.getAttribute("teacher_tests")) { %>
                                <tr>
                                    <td><%=t.getUserID()%></td>
                                    <%
                                    String img = "/MVC/" + t.getImage();
                                    %>
                                    <td><img src="<%=t.getImage() == null ? "https://thumbs.dreamstime.com/b/worried-man-avata-avatar-worried-man-vector-illustration-107469775.jpg" : img%>" style="vertical-align: middle; display: inline-block; margin-right: 5px">
                                        <%=t.getName() == null ? "Chưa cập nhật" : t.getName()%>
                                    </td>
                                    <td><%=t.getCreatedTests()%></td>
                                    <td><%=t.getPendingTests()%></td>
                                    <td><a href="/MVC/admin/tests/tests-detail?teacherID=<%=t.getUserID()%>">Xem chi tiết</a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="charts row">
                <div class="charts-month col-6">
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
                    <canvas id="monthChart" style="width: 100%; max-width: 600px"></canvas>
                    <script>
                        const monthXValues = <%=request.getAttribute("xDateArrayStr")%>;
                        const monthYValues = <%=request.getAttribute("yDateArrayStr")%>;
                        new Chart("monthChart", {
                            type: "line",
                            data: {
                                labels: monthXValues,
                                datasets: [{
                                    fill: false,
                                    lineTension: 0,
                                    backgroundColor: "#0EDC8D",
                                    borderColor: "#BCF6F3",
                                    data: monthYValues
                                }]
                            },
                            options: {
                                legend: { display: false },
                                scales: {
                                    yAxes: [{ ticks: { min: 0, max: <%=request.getAttribute("maxLL")%>, stepSize: 1 } }]
                                }
                            }
                        });
                    </script>
                </div>
                <div class="chart-year col-6">
                    <canvas id="myChart" style="width: 100%; max-width: 600px"></canvas>
                    <script> 
                        const xValues = <%=request.getAttribute("xMonthArrayStr")%>;
                        const yValues = <%=request.getAttribute("yMonthArrayStr")%>;
                        const barColors = "#0EDC8D";   
                        new Chart("myChart", {   
                            type: "bar",
                            data: {
                                labels: xValues,
                                datasets: [{ backgroundColor: barColors, data: yValues }]
                            },
                            options: {
                                legend: { display: false },
                                title: { display: false }
                            }
                        });
                    </script>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- end main -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
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
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
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
