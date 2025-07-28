<%@page import="com.pbl3.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>  

 <style>
<%@ include file="../../../../assets/admin-css/base.css" %>
 .menu .hidden{
    display: none;
}
.menu .profile{
    display: inline-block; 
    display: flex;
    align-items: center;   
    padding-left: 80px;
    padding-top: 18px;
}
.menu .inner-img {
    height: 60px;
    width: 60px;
    border-radius: 50%;
    overflow: hidden;
}
.menu .inner-img img {
    width: 100%;
    height: auto;
    object-fit: cover;
    aspect-ratio: 1 / 1;
}
.menu .menu-btn{
        position: absolute;
        right:10px;
        top:10px;
        cursor: pointer;
}
.menu .menu-btn i{
    color: white;
    font-size: 18px;
}
.menu{
    background: var(--color-two);
    width: 250px;
    height: 100%;
    position: fixed;
    z-index: 999;
    top:0;
}
.menu .logo{
    display: flex;
    align-items: center;
    padding-left: 80px;
    padding-top: 18px;
}
.menu .logo i{
    width: 150px;
    margin-right: 15px;
    height: auto;
    object-fit: cover;
    color: white;
    font-size: 40px;
}
.menu .logo:hover i{
    color: var(--color-one);
}
.menu .item{
    margin-top: 20px ;
    border-radius: 20px;
    margin-left: 10px;
}
.menu .item li{
    list-style: none;
    padding: 15px 0;
    border-radius: 10px;
}
.menu .item li:hover i{
    color: var(--color-one);
    cursor: pointer;
}
.menu .item li:hover a{
    color: var(--color-one);
    cursor: pointer;
}
.menu .item .logout:hover i{
    color: red;
    cursor: pointer;
}
.menu .item .logout:hover a{
    color: red;
    cursor: pointer;
}

.menu .item li i{
    color: white;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 20px;
    margin: 0 10px 0 10px;
}
.menu .item li a{
    text-decoration: none;
    color: white ;
    font-weight: 300px;
}

.hidden{
    display: none;
}
.main{
    width: calc(100% - 250px);
    margin-left: 250px;
}
/* end side3*/

.modal{
    margin-top:0px;
}

.modal .nav-tabs .nav-link{
    color: #616161;
    font-size: 15px;
    font-weight: 600;
    border: 0;
    padding-bottom: 15px;
    margin-right: 10px;
}
.modal .nav-tabs .nav-link:hover{
    color: var(--color-one);
    border-bottom: 2px solid var(--color-one);
}
.modal .nav-tabs .nav-link.active{
    color: var(--color-one);
    border-bottom: 2px solid var(--color-one);
}

.modal .tab-content .tab-pane h3{
    font-size: 25px;
    color: black;
    font-weight: 700;
    margin-top: 20px;
}
.modal .border-all{
    border: 1px solid #9f9f9f;
    padding: 20px;
    border-radius: 15px;
}
.modal label{
    color: black;
    display: block;
}
.modal h3{
    color: black;
}
.modal form{
    margin-top: 20px;
}
.modal input{
    display: block;
    width: 100%;
    height: 40px;
    border-radius: 10px;
    border: 1px solid #959595;
    margin-bottom: 10px;
}
#male , #female{
    height: 20px;
}
#pic-avatar{
    border: none;
}
.modal .btn-save{
    color: var(--color-two);
    margin-top: 15px;
    margin-bottom: 15px;
    padding: 6px 12px;
    border-radius: 10px;
    background-color: var(--color-one);
    font-weight: 500;
    border: 2px solid var(--color-one);
}
.modal .btn-save:hover{
    color: var(--color-one);
    background-color: white;
}
</style>
    <!-- Menu sidebar -->
    <div class="menu" id="menu">
        <div class="menu-btn" id="close-btn" onclick="closefunc()"><i class="fa-solid fa-chevron-left"
                style="padding: 10px;"></i></div>
        <div class="menu-btn hidden" id="open-btn" onclick="openfunc()"><i class="fa-solid fa-chevron-right"
                style="padding: 10px;"></i></div>
	<% UserModel user= (UserModel)session.getAttribute("user"); %>
	<a data-toggle="modal" data-target="#profileModal<%=user.getUserID() %>" class="profile">
		<div class="inner-img">
			<img
				<%if (user.getImage() != null){%> src="/MVC/<%=user.getImage() %>"<%}else{%> src = "https://thumbs.dreamstime.com/b/worried-man-avata-avatar-worried-man-vector-illustration-107469775.jpg" <%} %>
				alt="avatar">  
		</div>
	</a>


        <div class="item">   
            <li>
                <i class="fa-solid fa-book-open-reader"></i>
                <a href="/MVC/teacher/course">Quản Lí Khoá Học</a>
            </li>
            <li>
                <i class="fa-solid fa-spell-check"></i>
                <a href="/MVC/teacher/vocab-lists">Quản Lí Từ Vựng</a>
            </li>
            <li>
                <i class="fa-solid fa-file-lines"></i>
                <a href="/MVC/teacher/tests">Quản Lí Đề Thi</a>
            </li>
            <li>
                <i class="fa-solid fa-money-check-dollar"></i>
                <a href="/MVC/teacher/statistics">Thống Kê</a>
            </li>
            <li class="logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                <a href="/MVC/logout">Đăng Xuất</a>
            </li>

        </div>
    </div>
    <!-- end Menu sidebar -->
    <!-- Modal -->
<div class="modal fade" id="profileModal<%=user.getUserID() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Thông tin cá nhân</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
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
                            <form action="/MVC/teacher/setting/set-account" method="post" enctype="multipart/form-data" onsubmit="return validateFormAccount();">
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
                                        <input type="hidden" name="img-string" <%if(user.getImage()!=null){%> value="<%=user.getImage() %>"<%} %>> 
                                    </div>
                                    <div class="col-12">
                                        <button class="btn-save" type="submit">Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="password">
                            <form onsubmit="return validateForm()" action="/MVC/teacher/setting/set-password" method="post">
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
       	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
             <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
<script>
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
  