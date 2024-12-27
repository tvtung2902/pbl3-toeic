<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Study TOEIC</title>
</head>

<body> 
  <body>
    <style>
  		<%@include file ="../../assets/css/base.css"%>
 	    <%@include file="../../assets/css/styleCourse.css" %>
 	    .form-login{  
				padding: 50px;
       			box-shadow: 0px 0px 50px #00000011;
			} 
		/*section-login*/
.section-login {
	padding: 120px 0px;
	background-color: #FAFAFA;
}

.section-login .container {
	max-width: 960px;
}

.section-login .container .form-login {
	background-color: #fff;
	margin: 0px 159px;
	padding: 50px;
	border-radius: 15px;
}

.section-login .container .form-login .title {
	color: #04182B;
	font-size: 30px;
	line-height: 1.42;
	font-weight: 600;
	margin-bottom: 25px;
}

.section-login .container .form-login .form-group {
	margin-bottom: 25px;
}

.section-login .container .form-login .form-control {
	font-size: 1.6rem;
	font-size: 13px;
	padding: 20px;
}

.section-login .container .form-login .form-group {
	margin-bottom: 25px;
}

.section-login .container .form-login .button-login {
	display: block;
	margin-top: 40px;
	width: 100%;
	/* color: #000; */
}

.form-control:focus {
	border-color: var(--color-one); /* Màu của border khi focus */
	box-shadow: 0 0 0 0.2rem rgba(0, 255, 255, 0.25);
	/* Đổ bóng khi focus */
}

.section-login .container .form-login .outer-link {
	text-align: center;
	margin-top: 20px;
	color: var(--color-two);
	font-weight: 500;
	margin-bottom: 0;
}

.section-login .container .form-login .outer-link a {
	color: var(--color-one);
	font-weight: 600;
}
/*section-login*/
.wel{
			background-image: url("https://demo.graygrids.com/themes/edugrids/assets/images/hero/slider-bg1.jpg");
		}  
	</style>
	
 <%@include file="re-use/header.jsp" %>
		<div class="welcome wel">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-main">
                        <h2 class="inner-title">Đăng Nhập</h2>
                        <div class="inner-bar"></div>
                        <p class="inner-desc">Chào mừng đến với StudyTOEIC - Nền tảng học tiếng anh và luyện thi TOEIC hàng đầu.</p>
                        <div class="inner-button">
                             <div class="button-two button-1">
                                    <a href="/MVC/register"class="button1">Đăng Kí</a>
                            </div> 
                            <div class="button-two button-2">
                                    <a href="/MVC/"class="button2" method="post">Trang Chủ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
  <!-- section-login -->
  <div class="section-login">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="form-login">
          <%String username = (String)request.getAttribute("username");
          String password = (String)request.getAttribute("password");
          boolean lock = (boolean)request.getAttribute("lock");%>
            <h4 class="title">Đăng Nhập</h4> 
             <p style="color:red;" id="error-login"><%if(username!=null){%><%="Thông tin đăng nhập không hợp lệ hoặc bị khóa!" %><%} %>
              </p>
            <form method="post" id="loginForm" onsubmit="return validateForm();">
              <div class="form-group">
                <label for="username">Tên Đăng Nhập</label>
                <input name="email" type="text" class="form-control" id="username" aria-describedby="emailHelp"<%if(username!=null){ %> value="<%=username %>"<%} %>  onchange="checkUsername();" >
                <p style="color:red;" id="error-username"> </p>
              </div>
              <div class="form-group">
                <label for="password">Mật Khẩu</label>
                <input name="password" type="password" class="form-control" id="password" <%if(password!=null){ %> value="<%=password %>"<%} %> onblur="checkPassword();">
                <p style="color:red;" id="error-password"> </p>
              </div>
              <button class="button-main button-main-two button-login">Đăng Nhập</button>
              <p class="outer-link">Chưa có tài khoản? 
              <a href="register">Đăng kí</a>
            </p> 
            <br>   
            <p style="text-align: center;">
            <a href="/MVC/forgot-password" style="color: red;">Quên mật khẩu?</a>
            </p>     
            </form>     
          </div>  
        </div>
      </div>
    </div>
  </div>
  <!-- end section-login -->
    <style>
		footer{
			margin-top: 0px; 
		}
	</style>
  <%@include file="re-use/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
  </script>
  <script>
  function checkUsername(){
  	var isValid=false;
      var username = document.getElementById('username').value;
      var errorName = document.getElementById('error-username');
      var regexName = /^[a-z0-9_-]{3,16}$/;
      if(username==''||username==null){
           errorName.textContent="Tên đăng nhập không được để trống!";
      }else if(!regexName.test(username)){
       errorName.textContent="Tên đăng nhập không hợp lệ!";
      }
      else{
      	isValid=true;
       	errorName.textContent="";
       
      }
      return isValid;
   }
  function checkPassword() {
      var isValid = false;
      var password = document.getElementById('password').value;
      var regexPassword = /^.{8,}$/;
      var errorPassword = document.getElementById('error-password');

      if (password === '' || password == null) {
          errorPassword.textContent = "Mật khẩu không được để trống!";
      } else if (!regexPassword.test(password)) {
          errorPassword.textContent = "Mật khẩu không hợp lệ!";
      } else {
          isValid = true;
          errorPassword.textContent = "";
      }
      return isValid;
  }
  function validateForm() {
		var spam= <%=Boolean.toString(lock) %>
	  if(spam){
		  var error = document.getElementById("error-login");
		  alert("Đăng nhập thất bại");
		  error.textContent = "Bạn đã nhập sai quá 5 lần vui lòng thử lại sau";
		  return false;
	  }else
		if( checkUsername() && checkPassword()){
          return true;
		}else{
			return false;
		}
  }
  </script>
</body>

</html>