<%@page import="com.pbl3.libs.MD5"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.HistoryOfTestModel"%>
<%@page import="com.pbl3.model.Register_CourseModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Study TOIEC</title>
  </head>
  <body> 
  
    <style>
    	<%@include file="../../../assets/css/base.css"%>
    	 <%@include file="../../../assets/css/styleSettingAccount.css"%>
    	
    footer .container{
        max-width: 1296px;
    }
      
    </style>
    <!-- header  -->
	<%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
     <% UserModel user = (UserModel)request.getAttribute("userModel"); 
     %>
    <div class="section-tow">
        <div class="container">
            <div class="border-all">
            <h3>
                Chỉnh sửa thông tin cá nhân
            </h3>
            <div class="row">
                <div class="col-12">
                    <div class="inner-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-tab" data-toggle="tab"
                                    data-target="#profile" type="button" role="tab" aria-controls="profile"
                                    aria-selected="true">Thông tin cơ bản</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="password" data-toggle="tab" data-target="#contact"
                                    type="button" role="tab" aria-controls="contact" aria-selected="false">Thay đổi mật khẩu</button>
                            </li>
                        </ul>
                    </div>


                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="profile" role="tabpanel"
                            aria-labelledby="profile-tab">
                            <form action="/MVC/my-account/setting/set-account" method="post" enctype="multipart/form-data" onsubmit="return validateFormAccount();">
                                <div class="row">
                                    <div class="col-12">
                                        <label for="user-name">Tên tài khoản</label>
                                        <input type="text" name="user-name" id="username" readonly <%if(user.getUserName()!=null){%>value="<%=user.getUserName() %>"<%} %>>
                                    </div>
                                    <div class="col-12">
                                        <label for="name">Tên người dùng</label>
                                        <input type="text" name="name" id="name" onblur="checkName();" <%if(user.getName()!=null){%>value="<%=user.getName() %>"<%} %>>
                                         <p id="error-name" style="color: red;"></p>
                                    </div>
                                    <div class="col-12">
                                        <label for="email">Email</label>
                                        <input type="text" id="email"   <%if(user.getEmail()!=null){%>value="<%=user.getEmail() %>"<%} %>readonly>
                                    </div>
                                    <div class="col-12">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" name="phone" id="phone"  <%if(user.getPhone()!=null){%>value="<%=user.getPhone() %>"<%} %> onblur="checkPhone();" >
                                         <p id="error-phone" style="color: red;"></p>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="" class="form-label">Giới Tính</label>
                                            <div class="mb-3 form-check">
                                                <input type="radio"
                                                    class="form-check-input custom-autofill-selected"
                                                    id="male" name="gender" value="1" style="width: auto;height: auto;"  <%if(user.getGender()!=null)if(user.getGender()){%>checked<%} %>> 
                                                    <label  for="male" style="display: inline;">Nam</label>
                                            </div>
                                            <div class="mb-3 form-check">
                                                <input type="radio"
                                                    class="form-check-input custom-autofill-selected"
                                                    id="female" name="gender" value="0" style="width: auto;height: auto;"  <%if(user.getGender()!=null)if(!user.getGender()){%>checked<%} %>> 
                                                    <label  for="female" style="display: inline;">Nữ</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="pic-avatar">Ảnh đại diện</label>
                                        <input type="file" name="pic-avatar" id="pic-avatar">
                                        <input type="hidden" name="img-string" <%if(user.getImage() !=null){%> value="<%=user.getImage() %>"<%} %>>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn-save" type="submit">Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="password">
                            <form onsubmit="return validateForm()" action="/MVC/my-account/setting/set-password" method="post">
                                <div class="row">
                                    <div class="col-12">
                                        <label for="pass-old">Nhập mật khẩu cũ*</label>
                                        <input type="password" name="pass-old" id="pass-old" required>
                                        <p id="pass-old-message" style="color: red;"></p>
                                    </div>
                                    <div class="col-12">
                                        <label for="pass-new">Nhập mật khẩu mới(ít nhất 8 kí tự)*</label>
                                        <input type="password" name="pass-new" id="pass-new" onblur="checkPassword();" >
                                        <p id="pass-new-message" style="color: red;"></p>
                                    </div>
                                    <div class="col-12">
                                        <label for="re-pass-new">Nhập lại mật khẩu mới*</label>
                                        <input type="password" name="re-pass-new" id="re-pass-new" onblur="checkPassword();" >
                                         <p id="re-pass-new-message" style="color: red;"></p>
                                    </div>
                                    <div class="col-12">
                                        <button id="btn-save-pass"class="btn-save" type="submit">Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- foooter -->
    <%@include file="../re-use/footer.jsp" %>
     <!-- end foooter -->
       	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
             <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script>
            $(document).ready(function(){
                $(window).scroll(function(){
                    if($(this).scrollTop()){
                        $('header').addClass('hidentop');
                    }
                    else
                    $('header').removeClass('hidentop');
                });
            });  
            const crypto = require('crypto');

            function getMD5(input) {
                const md = crypto.createHash('md5');
                const hash = md.update(input).digest();
                return convertByteToHex(hash);
            }

            function convertByteToHex(data) {
              let sb = '';
              for (let i = 0; i < data.length; i++) {
                sb += (data[i] & 0xff) + 0x100.toString(16).substring(1);
              }
              return sb;
            }
            
            function checkName(){
            	var isValid=false;
                var name= document.getElementById('name').value;
                var regexName=/^[^\d+]*[\d+]{0}[^\d+]*$/;
                var errorName=document.getElementById('error-name');
                if(name==''||name==null){
                     errorName.textContent="Tên người dùng không được để trống!";
                }else if(!regexName.test(name)){
                 errorName.textContent="Tên người dùng không hợp lệ!";
                }
                else{
                	isValid=true;
                 errorName.textContent="";
                 
                }
                return isValid;
             }
            function checkPhone(){
            	var isValid=false;
                var phone= document.getElementById('phone').value;
                var regexPhone=/^(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-689]|9[0-46-9])(\d{7})$/;
                var errorPhone=document.getElementById('error-phone');
                if(phone==''||phone==null){
                     errorPhone.textContent="Số điện thoại không được để trống!";
                }else if(!regexPhone.test(phone)){
                    errorPhone.textContent="Số điện thoại không hợp lệ!";
                }
                else{
                	isValid=true;
                 errorPhone.textContent="";
                 
                }
                return isValid;
             }
            
            function validateFormAccount(){
    			if(checkName() && checkPhone()){
    	            alert("Thay đổi thành công!");
    	            return true;
    			}else{
    				return false;
    			}
            }
            function checkPassword(){
            	var isValid=false;
                var password= document.getElementById('pass-new').value;
                var regexPassword = /^.{8,}$/;
                var errorPassword=document.getElementById('pass-new-message');
                if(password==''||password==null){
                     errorPassword.textContent="Mật khẩu không được để trống!";
                }else 
                if(!regexPassword.test(password)){
                     errorPassword.textContent="Mật khẩu không hợp lệ!";
                }
                else{
                	isValid=true;
                     errorPassword.textContent="";
                     
                }
                return isValid;
             }
            function checkConPassword(){
            	var isValid=false;
            	var password= document.getElementById('pass-new').value;
                var conPassword= document.getElementById('re-pass-new').value;
                var errorConPassword=document.getElementById('re-pass-new-message');
                if(password==''||password==null){
                     errorConPassword.textContent="Xác nhận mật khẩu không được để trống!";
                }else 
                if(password!==conPassword){
                     errorConPassword.textContent="Mật khẩu không trùng khớp!";
                }
                else{
                	var isValid=true;
                     errorConPassword.textContent="";
                    
                }
                return isValid;
             }
            function checkPassOld(){
            	var isValid=true;
            	var messagePassOld = document.getElementById("pass-old-message");
                // Lấy giá trị của các trường mật khẩu
                var currentPassword = document.getElementById("pass-old").value;

            // So sánh mật khẩu đã băm với mật khẩu đã băm trong session
                        // Lấy mật khẩu của user từ session
            var hash = CryptoJS.MD5(CryptoJS.enc.Utf8.parse(currentPassword));
            var hashPass=hash.toString(CryptoJS.enc.Hex);

            var storedPassword = '<%=user.getPassword() %>'

            if (hashPass !== storedPassword) {
            	messagePassOld.textContent = "Sai mật khẩu!";
            	isValid=false;
            }
            else{
            	messagePassOld.textContent = "";
            }
                return isValid;
            }
            function validateForm() {
    			if(checkPassword() && checkConPassword() && checkPassOld()){
    	            alert("Đổi mật khẩu thành công!");
    	            return true;
    			}else{
    				return false;
    			}
            }
            
            
        </script>
      </body>
    </html> 