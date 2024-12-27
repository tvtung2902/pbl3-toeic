<%@page import="com.pbl3.libs.PriceStandardization"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<style>
.menu .item li:nth-child(7) a {
	color: var(--color-one);
}

.menu .item li:nth-child(7) i {
	color: var(--color-one);
}

.title {
	text-align: center;
	margin-bottom: 20px;
}

.statistics {
	margin-bottom: 40px;
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
			<h2 class="name">Thống Kê</h2>
			<form method="get" action="/MVC/admin/statistics" onsubmit="return validateFormStatistics();"style="display: flex;
   			 align-items: center;
    		justify-content: space-around;"> 
				<div>
    			<div style="display: flex;
    			align-items: center;">
    			<label for="dateA" style="margin:0 10px;">Ngày bắt đầu:</label>     
		        <input type="date" id="dateA" name="begin" onblur="checkStart();" <%if (request.getParameter("begin") != null ){%> value="<%=request.getParameter("begin")%>" <%} %>>
    			</div>
		        <p id="error-start" style="color:red;margin-left:10px;"></p>
				</div>
				
				<div>
    			<div style="display: flex;
    			align-items: center;">
    			<label for="dateB" style="margin:0 10px;">Ngày kết thúc:</label> 
		        <input type="date" id="dateB" name="end" onblur="checkEnd();" <%if (request.getParameter("end") != null ){%> value="<%=request.getParameter("end")%>" <%} %>>
    			</div>
    			<p id="error-end" style="color:red;margin-left:10px;"></p>
				</div>

		        <button type="submit" class="add-btn">Đồng ý</button>
		    </form>


			<div class="statistics">
				<h5 class="title">Doanh Thu Và Lợi Nhuận</h5>
				<div class="row">
					<div class="col-6">
						<canvas id="monthChart1" style="width: 100%; max-width: 600px"></canvas>
					</div>
					<div class="col-6">
						<canvas id="monthChart2" style="width: 100%; max-width: 600px"></canvas>
					</div>
				</div>
			</div>
			<div class="Profit-Revenue">
				<div class="row">
					<div class="col-12">
						<canvas id="myChart" style="max-width: 100%;"></canvas>
					</div>
				</div>
			</div>

			<div class="last-main">
				<table class="table verticle-middle table-responsive-md"
					id="mytable">
					<thead>
						<tr>
							<th onclick="sortTable(0)" scope="col">Ngày</th>
							<th onclick="sortTable(1)" scope="col">Doanh Thu</th>
							<th onclick="sortTable(2)" scope="col">Lợi Nhuận</th>
						</tr>
					</thead>
					<tbody>
						<%
						Object[] date = (Object[])request.getAttribute("date");
						Object[] revenue = (Object[])request.getAttribute("revenue");
						Object[] profit = (Object[])request.getAttribute("profit");
						for (int i = 0; i < date.length; i++) {
						%>
						<tr>
							<td><%=date[i]%></td>
							<td><%=PriceStandardization.getPriceCH((Double)revenue[i])%></td>
							<td><%=PriceStandardization.getPriceCH((Double)profit[i])%></td>
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
		<!-- end main -->
		<script
			src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
		<script>
const objDate1 = <%=request.getAttribute("objDate")%>;
const objRevenue1 = <%=request.getAttribute("objRevenue")%>;
const objProfit1 = <%=request.getAttribute("objProfit")%>;
const barColors1 = "#0EDC8D";
const barColors2 = "#04182B";
 
new Chart("myChart", {
  type: "bar",
  data: {
    labels: objDate1,
    datasets: [{
      label: 'Doanh thu',
      backgroundColor: barColors1,
      data: objRevenue1
    }, {
      label: 'Lợi Nhuận',
      backgroundColor: barColors2,
      data: objProfit1   
    }]
  },
  options: {
    legend: { display: true },
    title: {
      display: false
    },
    scales: {
      yAxes: [{ 
        ticks: { 
          beginAtZero: true 
        } 
      }]
    }
  }
});
</script>
		<script>
    const maxRe = <%=request.getAttribute("")%>;
    const maxPro = <%=request.getAttribute("")%>;
    const objDate = <%=request.getAttribute("objDate")%>;
    const objRevenue = <%=request.getAttribute("objRevenue")%>;
    const objProfit = <%=request.getAttribute("objProfit")%>;
    const config = {
        type: "line",
        options: {
            legend: { display: false },
        }
    };

    const monthChart1 = new Chart(document.getElementById("monthChart1"), {
        ...config,
        data: {
            labels: objDate,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "#0EDC8D",
               
                borderColor: "#BCF6F3",
                data: objRevenue 
            }]
        }
    });

    const monthChart2 = new Chart(document.getElementById("monthChart2"), {
        ...config,
        data: {
            labels: objDate,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "#0EDC8D",
                borderColor: "#BCF6F3",
                data: objProfit   
            }]
        }
    });

</script>
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
    
    function checkStart() {
        let isValid = false;
        const start = document.getElementById("dateA").value;
        const errorName = document.getElementById("error-start");

        if (start === '' || start === null) {
            errorName.textContent = "Bạn chưa chọn ngày bắt đầu!";
        } else {
            isValid = true;
            checkEnd();
            errorName.textContent = "";
        }

        return isValid;
    }

    function checkEnd(){
    	var isValid=false;
    	var start = document.getElementById("dateA").value;
     	var end = document.getElementById("dateB").value;
    	 var startDate = new Date(start);
   	 	var endDate = new Date(end);
    	 var errorName=document.getElementById("error-end");
        if(end==''||end==null){
             errorName.textContent="Bạn chưa chọn ngày kết thúc!";
        }else 
        if(startDate>endDate){
             errorName.textContent="Thời gian kết thúc phải lớn hơn thời gian bắt đầu";
        }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function validateFormStatistics() {
		if( checkStart() && checkEnd()){
            return true;
		}else{
			return false;
		}
    }
</script>
</body>
</html>
