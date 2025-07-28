<%@page import="com.pbl3.model.CouponModel"%>
<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
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
        <%@ include file="../../../assets/admin-css/style-edit.css" %>
	</style>     
</head>

<body>
<style>
.menu .item li:nth-child(3) a{
    color: var(--color-one);
}
.menu .item li:nth-child(3) i{
    color: var(--color-one);
}</style>
	 <!-- Menu sidebar --> 
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->
    
        <div class="main" id="main">
		<%CouponModel couponModel = (CouponModel)request.getAttribute("couponModel");%>
		<div class="container"> 
			<div class="section-one"
				style=" margin-bottom: 10px;">
				<div class="head">
					<h2 class="add">Sửa Mã Giảm Giá</h2>
				</div>    
				<div class="main-create">
					<div class="wrap">
						<form action="/MVC/admin/coupon/edit?couponID=<%=couponModel.getCouponID()%>" method="post"onsubmit="return validateFormEditCoupon();">

							<div class="form-group">
								<label for="code">Code</label> <input name="code" type="text"
									class="form-control" id="name" readonly
									value="<%=couponModel.getCode()%>">
							</div> 

							<div class="form-group">
								<label for="startDate">Thời gian bắt đầu</label> 
								<br>
								<input type="date" id="startDate" name="startDate" value="<%=couponModel.showDate(couponModel.getStartDate())%>"onblur="checkStart();">
								<p id="error-start" style="color:red;"></p>
							</div>

							<div class="form-group"> 
								<label for="endDate">Thời gian kết thúc</label> 
								<br>
								<input type="date" id="endDate" name="endDate" value="<%=couponModel.showDate(couponModel.getEndDate())%>"onblur="checkEnd();">
								 	<p id="error-end" style="color:red;"></p>
							</div>

							<div class="form-group">
								<label for="quantity">Số Lượng</label> <input value="<%=couponModel.getQuantity()%>" name="quantity"
									type="number" class="form-control" id="quantity" step="1" <%=couponModel.getQuantity()%> <%if(couponModel.getQuantityUsed() > 0){%> min="<%=couponModel.getQuantityUsed()%>" <%}else{%>min = "1" <%}%> onblur="checkQuantity();">
									<p id="error-quantity" style="color:red;"></p>
							</div>
							
								<div class="form-group">
								<label for="percent">Phần Trăm</label> <input name="percent"
									type="number" class="form-control" id="percent" step="1" min = "1" value="<%=couponModel.getPercent()%>"onblur="checkPercent();">
									<p id="error-percent" style="color:red;"></p>
							</div>  
							
							<div class="wrap-button"> 
								<button type="submit" class="edit-btn">Sửa</button>
								<a href="/MVC/admin/coupon" type="button" class="btn add-btn back-btn">Quay
									lại</a> 
							</div>
						</form>
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
    
    function checkStart(){
    	var isValid=false;
    	var start = document.getElementById("startDate").value;
    	 var errorName=document.getElementById("error-start");
        if(start==''||start==null){
             errorName.textContent="Bạn chưa chọn ngày bắt đầu!";
        }
        else{
        	isValid=true;
        	checkEnd();
             errorName.textContent="";
             
        }
        return isValid;
     }
    function checkEnd(){
    	var isValid=false;
    	var start = document.getElementById("startDate").value;
     	var end = document.getElementById("endDate").value;
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
    function checkQuantity(){
    	var isValid=false;
    	var name = document.getElementById("quantity").value;
    	var regexName = /^\d+$/;
    	 var errorName=document.getElementById("error-quantity");
        if(name==''||name==null){
             errorName.textContent="Số lượng không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Số lượng không hợp lệ!";
        }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function checkPercent(){
    	var isValid=false;
    	var name = document.getElementById("percent").value;
    	var regexName = /^(0|[1-9][0-9]?|100)$/;
    	 var errorName=document.getElementById("error-percent");
        if(name==''||name==null){
             errorName.textContent="Phần trăm không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Phần trăm không hợp lệ!";
        }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function validateFormEditCoupon() {
		if( checkStart() && checkEnd() && checkQuantity() && checkPercent()){
            alert("Sửa thành công!");
            return true;
		}else{
			return false;
		}
    }
    </script>

</body>

</html>