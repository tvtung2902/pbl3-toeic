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
        <%@ include file="../../../assets/admin-css/style-create.css" %>
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
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->  

	<div class="main" id="main">
		<div class="container">
			<div class="section-one" style="margin-bottom: 10px;">
				<div class="head">    
					<h2 class="add">Thêm Người Dùng</h2>
				</div>
				<div class="main-create">
					<div class="wrap">
<form action="/MVC/admin/users/create" method="post" enctype="multipart/form-data" onsubmit="return validateFormCreateUser(event);" id="createUserForm">
							<div class="form-group">
								<label for="usernameCre">Tên Đăng Nhập</label> <input
									type="text" class="form-control custom-autofill-selected"
									id="usernameCre" name="username" onblur="checkUsernameCre();">
									<p id="error-usernameCre"style="color:red;"></p>
							</div>
							<div class="form-group">
								<label for="passwordCre">Mật Khẩu</label> <input
									type="password" class="form-control custom-autofill-selected"
									id="passwordCre" name="password" onblur="checkPasswordCre();">
									<p id="error-passwordCre"style="color:red;"></p>
							</div>
							<div class="form-group">
								<label for="conPasswordCre">Nhập Lại Mật Khẩu</label>
								<input type="password"
									class="form-control custom-autofill-selected"
									id="conPasswordCre" name="confirm-password"  onblur="checkConPasswordCre();">
									<p id="error-conPasswordCre"style="color:red;"></p>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect4">Quyền Truy Cập</label> <select
									class="form-control custom-autofill-selected"
									id="exampleFormControlSelect4" name="roleID">
									<option value="1">Quản trị viên</option>
									<option value="2">Giáo viên</option>
									<option value="3" selected="selected">Học Viên</option>
								</select>
							</div>
							<div class="form-group">
								<label for="nameCre">Tên Người Dùng</label> <input
									type="text" class="form-control custom-autofill-selected"
									id="nameCre" name="name" onblur="checkNameCre();">
									<p id="error-nameCre"style="color:red;"></p>
							</div>
							<div class="form-group">
								<label for="emailCre">Email</label> <input
									type="email" class="form-control custom-autofill-selected"
									id="emailCre" name="email"onblur="checkEmailCre();">
									<p id="error-emailCre"style="color:red;"></p>
							</div>
							<div class="form-group">
								<label for="phoneCre">Số Điện Thoại</label> <input
									type="text" class="form-control custom-autofill-selected"
									id="phoneCre" name="phone" onblur="checkPhoneCre();">
									<p id="error-phoneCre"style="color:red;"></p>   
							</div>
							<div class="form-group">
                  				<label for="file">Ảnh mô tả</label>
                  				<input name="image" type="file" class="form-control" id="file">
                			</div>
							<div class="form-group">
								<label for="" class="form-label">Giới Tính</label>
								<div class="mb-3 form-check">
									<input type="radio"
										class="form-check-input custom-autofill-selected"
										id="maleCre" name="gender" value="1" > <label
										class="form-check-label" for="maleCre">Nam</label>
								</div>
<div class="mb-3 form-check">
									<input type="radio"
										class="form-check-input custom-autofill-selected"
										id="femaleCre" name="gender" value="0"> <label
										class="form-check-label" for="femaleCre">Nữ</label>
								</div>
								<p id="error-genderCre"style="color:red;"></p>
							</div>
							<div class="form-group">
    							<label for="descCre">Mô tả (Chỉ giáo viên mới có mô tả !!!)</label>
    							<textarea class="form-control" id="descCre" rows="5" readonly name="description" onblur="checkDescCre();"></textarea>
    							<p id="error-descCre"style="color:red;"></p>
							</div>
							<div class="wrap-button">    
								<button type="submit" class="add-btn">Thêm</button>
								<a href="/MVC/admin/users" type="button" class="btn add-btn back-btn">Quay
									lại</a> 
							</div>
						</form>
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
	</script>
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const selectBox = document.getElementById("exampleFormControlSelect4");
        const textarea = document.getElementById("descCre");

        selectBox.addEventListener("change", function() {
            if (selectBox.value === "2") { // Nếu lựa chọn là "Giáo viên"
                textarea.readOnly = false; // Cho phép nhập vào textarea
            } else {
                textarea.value = ""; // Xóa nội dung của textarea
                textarea.readOnly = true; // Không cho phép nhập vào textarea
            }
        });
    });
    function checkUsernameCre() {
        return new Promise(function(resolve, reject) {
            var username = document.getElementById('usernameCre').value;
            var errorUsername = document.getElementById('error-usernameCre');
            var regexUsername = /^[a-z0-9_-]{3,16}$/;

            if (username === '' || username == null) {
                errorUsername.textContent = "Tên đăng nhập không được để trống!";
                resolve(false);
            } else if (!regexUsername.test(username)) {
                errorUsername.textContent = "Tên đăng nhập không hợp lệ!";
                resolve(false);
            } else {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/MVC/check-username", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        if (response.isTaken) {
                            errorUsername.textContent = "Tên đăng nhập đã tồn tại";
                            resolve(false);
                        } else {
                            errorUsername.textContent = "";
                            resolve(true);
                        }
                    }
                };
                xhr.send("username=" + encodeURIComponent(username));
            }
        });
    }

    function checkEmailCre() {
        return new Promise(function(resolve, reject) {
            var email = document.getElementById('emailCre').value;
            var errorEmail = document.getElementById('error-emailCre');
            var regexEmail = /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

            if (email === '' || email == null) {
                errorEmail.textContent = "Email không được để trống!";
                resolve(false);
            } else if (!regexEmail.test(email)) {
                errorEmail.textContent = "Email không hợp lệ!";
                resolve(false);
            } else {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/MVC/check-email", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        if (response.isTaken) {
                            errorEmail.textContent = "Email đã tồn tại!";
                            resolve(false);
} else {
                            errorEmail.textContent = "";
                            resolve(true);
                        }
                    }
                };
                xhr.send("email=" + encodeURIComponent(email));
            }
        });
    }
    function checkPasswordCre() {
        var password = document.getElementById('passwordCre').value;
        var regexPassword = /^.{8,}$/;
        var errorPassword = document.getElementById('error-passwordCre');

        if (password === '' || password == null) {
            errorPassword.textContent = "Mật khẩu không được để trống!";
            return false;
        } else if (!regexPassword.test(password)) {
            errorPassword.textContent = "Mật khẩu phải có ít nhất 8 kí tự!";
            return false;
        } else {
            errorPassword.textContent = "";
            return true;
        }
    }

    function checkConPasswordCre() {
        var password = document.getElementById('passwordCre').value;
        var conPassword = document.getElementById('conPasswordCre').value;
        var errorConPassword = document.getElementById('error-conPasswordCre');

        if (conPassword === '' || conPassword == null) {
            errorConPassword.textContent = "Xác nhận mật khẩu không được để trống!";
            return false;
        } else if (password !== conPassword) {
            errorConPassword.textContent = "Mật khẩu không trùng khớp!";
            return false;
        } else {
            errorConPassword.textContent = "";
            return true;
        }
    }

    function checkNameCre() {
        var name = document.getElementById('nameCre').value;
        var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;
        var errorName = document.getElementById('error-nameCre');

        if (name === '' || name == null) {
            errorName.textContent = "Tên người dùng không được để trống!";
            return false;
        } else if (!regexName.test(name)) {
            errorName.textContent = "Tên người dùng không hợp lệ!";
            return false;
        } else {
            errorName.textContent = "";
            return true;
        }
    }

    function checkPhoneCre() {
        var phone = document.getElementById('phoneCre').value;
        var regexPhone = /^(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-689]|9[0-46-9])(\d{7})$/;
        var errorPhone = document.getElementById('error-phoneCre');

        if (phone === '' || phone == null) {
            errorPhone.textContent = "Số điện thoại không được để trống!";
            return false;
        } else if (!regexPhone.test(phone)) {
errorPhone.textContent = "Số điện thoại không hợp lệ!";
            return false;
        } else {
            errorPhone.textContent = "";
            return true;
        }
    }

    function checkDescCre() {
        var mota = document.getElementById('descCre').value;
        var regexMota = /^.{1,100}$/;
        var errorMota = document.getElementById('error-descCre');

        if (mota !== '') {
            if (!regexMota.test(mota)) {
                errorMota.textContent = "Mô tả danh sách không quá 100 kí tự!";
                return false;
            } else {
                errorMota.textContent = "";
                return true;
            }
        } else {
            errorMota.textContent = "";
            return true;
        }
    }
    function checkGenderCre() {
		var male = document.getElementById('maleCre').checked;
		var female = document.getElementById('femaleCre').checked;
		var error = document.getElementById('error-genderCre');
		if(male || female){
			error.textContent = "";
			return true;
		}
		else{
			error.textContent = "Chưa chọn giới tính!";
			return false;
		}
    }
    async function validateFormCreateUser(event) {
        event.preventDefault();

        try {
            const isUsernameValid = await checkUsernameCre();
            const isEmailValid = await checkEmailCre();
            const isPasswordValid = checkPasswordCre();
            const isConPasswordValid = checkConPasswordCre();
            const isNameValid = checkNameCre();
            const isPhoneValid = checkPhoneCre();
            const isDescValid = checkDescCre();
            const isGenderValid = checkGenderCre();

            if (isUsernameValid && isEmailValid && isPasswordValid && isConPasswordValid && isNameValid && isPhoneValid && isDescValid && isGenderValid) {
                alert("Thêm thành công");
                document.getElementById("createUserForm").submit();
            }
        } catch (error) {
            alert("Đã xảy ra lỗi. Vui lòng thử lại.");
        }
    }
</script>

</body>

</html>