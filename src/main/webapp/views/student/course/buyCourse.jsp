<%@page import="com.pbl3.model.CouponModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.pbl3.model.LessionModel"%>
<%@page import="com.pbl3.model.PartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pbl3.service.CourseService"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Study TOIEC</title>
</head>

<body>
    <style>
        <%@include file="../../../../assets/css/base.css"%>
        <%@include file="../../../../assets/css/styleBuyCourse.css"%>
    </style>  
    <!-- header  -->
    <%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
    <%CourseModel courseModel = (CourseModel) request.getAttribute("courseModel");
    LinkedList<CouponModel> linkedList = (LinkedList<CouponModel>) request.getAttribute("listCoupon");
    %>
    <div class="main">
        <div class="container">
            <div class="row">
                <div class="col-xl-8">
                    <div class="inner-wrap">
                        <h3 class="inner-title">Thanh toán</h3>
                        <div class="pay-content">
                            <p class="title-qr">Chuyển khoản qua ngân hàng sử dụng QR code</p>
                            <p class="choose-bank">Chọn ngân hàng</p>
                            <div class="inner-bank">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home"
                                            type="button" role="tab" aria-controls="home" aria-selected="true">
                                            <img src="https://storage.googleapis.com/npay/default/0/0/0/29/9s/mbbank-1671679367.png"
                                                alt="">
                                        </a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile"
                                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                                            <img src="https://storage.googleapis.com/npay/default/0/0/0/2/9s/vietinbank-1671679173.png"
                                                alt="">
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content" style="margin-top: 20px;" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel"
                                        aria-labelledby="home-tab">
                                        <p class="choose-bank">Thông tin chuyển khoản</p>
                                        <div class="inner-info">
                                            <div class="row">
                                                <div class="col-xl-4">
                                                    <div class="inner-img">
                                                        <img src="https://api-console.9pay.vn/bank/show-qr-code?bank_id=6WPKJN4Y&transaction_id=NW6MEWE6"
                                                            alt="qr">
                                                    </div>
                                                </div>
                                                <div class="col-xl-8">
                                                    <div class="box">
                                                        <p class="title">Ngân hàng</p>
                                                        <p class="content">MBBANK - NH Quan Doi</p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Số tài khoản</p>
                                                        <p class="copy" id="stk-1">2341188899999 <span id="copy-stk-1"><i
                                                                    class="fa-solid fa-copy"></i></span></p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Tên chủ tài khoản</p>
                                                        <p class="content">LE ANH VU</p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Nội dung chuyển khoản</p>
                                                        <p class="copy" id="content-1">TOEIC-<%=userModel.getUserID()%>-<%=courseModel.getCourseID() %> <span
                                                                id="copy-content-1"><i
                                                                    class="fa-solid fa-copy"></i></span></p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Số tiền cần chuyển</p>
                                                        <p id="new-price-1" class="price"><%=courseModel.getPriceCH() %></p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel"
                                        aria-labelledby="profile-tab">
                                        <p class="choose-bank">Thông tin chuyển khoản</p>
                                        <div class="inner-info">
                                            <div class="row">
                                                <div class="col-xl-4">
                                                    <div class="inner-img">
                                                        <img src="https://api-console.9pay.vn/bank/show-qr-code?bank_id=DKZYENER&transaction_id=NW6MEWE6"
                                                            alt="qr">
                                                    </div>
                                                </div>
                                                <div class="col-xl-8">
                                                    <div class="box">
                                                        <p class="title">Ngân hàng</p>
                                                        <p class="content">VIETINBANK - NH Cong Thuong VN</p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Số tài khoản</p>
                                                        <p class="copy" id="stk-2">110002873172 <span id="copy-stk-2"><i
                                                                    class="fa-solid fa-copy"></i></span></p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Tên chủ tài khoản</p>
                                                        <p class="content">LE ANH VU</p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Nội dung chuyển khoản</p>
                                                        <p class="copy" id="content-2">TOEIC-<%=userModel.getUserID()%>-<%=courseModel.getCourseID() %>  <span
                                                                id="copy-content-2"><i
                                                                    class="fa-solid fa-copy"></i></span></p>
                                                    </div>
                                                    <div class="box">
                                                        <p class="title">Số tiền cần chuyển</p>
                                                        <p id="new-price-2" class="price"><%=courseModel.getPriceCH() %></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="inner-button">
                                <form action="/MVC/course/course-detail/pay" method="post">
                                    <!-- Các trường khác nếu cần -->
                                    <input type="hidden" id="input-coupon" name="coupon">
                                    <input type="hidden" id="input-courseID" name="courseID" value="<%=courseModel.getCourseID() %>">
                                    <input type="hidden" id="input-price" name="price" value="<%=courseModel.getPrice() %>">
                                    <a class="pay-btn" data-toggle="modal" data-target="#payModal">
                                        Tôi đã thanh toán
                                    </a>
                                    <!-- Modal -->
                                    <div class="modal fade" id="payModal" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                            <div style="display: flex;justify-content: end;">
                                            <a class="cancel-btn" data-dismiss="modal" style="display:inline-block; padding:2px 10px;cursor: pointer;"><i class="fa-solid fa-xmark"></i></a>
                                            </div>
                                                <div class="modal-body">
                                                    <h5>Sau khi thanh toán bạn sẽ được quản trị viên duyệt trong 5-10
                                                        phút</h5>
                                                </div>
												<div style="display: flex;justify-content: center; margin-bottom:10px">
												 <button class="pay-btn" style="border: none;">Đồng ý
                                                </button>
												</div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <!-- Button trigger modal -->
                                <a class="contact-btn" data-toggle="modal" data-target="#contactModal">
                                    Liên hệ hỗ trợ
                                </a>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                                                              <div style="display: flex;justify-content: end;">
                                            <a class="cancel-btn" data-dismiss="modal" style="display:inline-block; padding-right:10px;cursor: pointer;"><i class="fa-solid fa-xmark"></i></a>
                                            </div>
                                        <div class="modal-body">

                                                    <div class="inner-zalo">
                                                        <img src="/MVC/data/qr.jpg"
                                                            alt="qr" style="width:100%;">
                                                    </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-wrap">
                        <h3 class="inner-title">Áp dụng mã giảm giá</h3>
                        <p class="course-name"><%=courseModel.getCourseName() %></p>
                        <p class="course-price">Giá tiền: <%=courseModel.getPriceCH() %></p>
                        <label for="discount-code">Mã giảm giá:</label>
                        <input class="course-coupon"type="text" id="discount-code" placeholder="Nhập mã giảm giá">
                        <p id="discount-message" style="color: red;"></p>
                        <button class="apply-btn"onclick="applyDiscount()">Áp dụng</button>
                        <p id="course-price" class="course-price"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- <footer> -->
    <style>
		footer{
			margin-top: 0px; 
		}
	</style>
    <%@include file="../re-use/footer.jsp" %>
    <!-- end footer -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('hidentop');
                } else {
                    $('header').removeClass('hidentop');
                }
            });
        });

        var discounts = {
            <%if(linkedList.size() > 0) {
                for(CouponModel couponModel : linkedList) { %>
                    "<%=couponModel.getCode() %>": <%=couponModel.getPercent() %>,
            <%}} %>
        };

        function applyDiscount() {
            var codeInput = document.getElementById("discount-code").value;
            var discountPercent = discounts[codeInput];
            var priceElement = document.getElementById("course-price");
            var messageElement = document.getElementById("discount-message");
            var newprice1 = document.getElementById("new-price-1");
            var newprice2 = document.getElementById("new-price-2");
            var inputprice = document.getElementById("input-price");
            var inputcoupon = document.getElementById("input-coupon");

            var price = parseFloat(<%=courseModel.getPrice() %>);
            var formattedOriginalPrice = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND', minimumFractionDigits: 0}).replace('₫', 'đ');

            if (discountPercent !== undefined) {
                var discountedPrice = price - (price * discountPercent / 100);
                var formattedPrice = discountedPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND', minimumFractionDigits: 0}).replace('₫', 'đ');
                priceElement.textContent = "Giá tiền sau khi giảm giá: " + formattedPrice;
                messageElement.textContent = ""; // Xóa thông báo nếu có
                newprice1.textContent = formattedPrice;
                newprice2.textContent = formattedPrice;
                inputcoupon.value = codeInput;
                inputprice.value = discountedPrice; // Changed from formattedPrice to discountedPrice
            } else {
                messageElement.textContent = "Mã giảm giá không hợp lệ!";
                priceElement.textContent = "";
                newprice1.textContent = formattedOriginalPrice;
                newprice2.textContent = formattedOriginalPrice;
                inputcoupon.value = "";
                inputprice.value = price; // Changed from formattedOriginalPrice to price
            }
        }

        document.getElementById('copy-stk-1').addEventListener('click', async function() {
            const copyText = document.getElementById('stk-1').textContent;
            await navigator.clipboard.writeText(copyText);
        });

        document.getElementById('copy-stk-2').addEventListener('click', async function() {
            const copyText = document.getElementById('stk-2').textContent;
            await navigator.clipboard.writeText(copyText);
        });

        document.getElementById('copy-content-1').addEventListener('click', async function() {
            const copyText = document.getElementById('content-1').textContent;
            await navigator.clipboard.writeText(copyText);
        });

        document.getElementById('copy-content-2').addEventListener('click', async function() {
            const copyText = document.getElementById('content-2').textContent;
            await navigator.clipboard.writeText(copyText);
        });
    </script>
</body>

</html>
