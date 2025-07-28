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
	<%
	UserModel userModel = (UserModel) request.getAttribute("userModel");
	%>
	<%
	System.out.print(userModel.getRoleModel().getRoleName() + " 1212212");
	boolean admin = false;
	boolean teacher = false;
	boolean student = false;
	if ((userModel.getRoleModel().getRoleName()).equals("Quản Trị Viên"))
		admin = true;
	if ((userModel.getRoleModel().getRoleName()).equals("Học Viên"))
		student = true;
	if ((userModel.getRoleModel().getRoleName()).equals("Giáo Viên"))
		teacher = true;
	%>
	 <!-- Menu sidebar --> 
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->  

	<div class="main" id="main">
		<div class="container">
			<div class="section-one" style="margin-bottom: 10px;">
				<div class="head">
					<h2 class="add">Chỉnh Sửa Thông Tin Người Dùng</h2>
				</div>
				<div class="main-create">
					<div class="wrap">
						<%if(userModel.getStatus()){%>
						<button style="margin-bottom: 20px;" type="button" class="add-btn back-btn" data-toggle="modal" data-target="#cancelModal">
                                          Khóa Tài khoản này?    
                         </button>
                            
                                        <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog"> 
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Bạn Chắc Chắn Muốn Khóa Tài Khoản Này?</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="/MVC/admin/users/locked" method="post">
                                                        	<input type="hidden" name="userID" value="<%=userModel.getUserID()%>"> 
                                                            <button type="submit" class="btn btn-danger">Ok</button> 
                                                        </form>
                                                             
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>  
                         <%}else{ %>
                         	<button style="margin-bottom: 20px;" type="button" class="add-btn okk-btn" data-toggle="modal" data-target="#cancelModal">
                                          Mở Khóa Tài khoản này?    
                         </button>
                            
                                        <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog"> 
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Bạn Chắc Chắn Muốn Mở Khóa Tài Khoản Này?</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="/MVC/admin/users/unlocked" method="post">
                                                        	<input type="hidden" name="userID" value="<%=userModel.getUserID()%>"> 
                                                            <button type="submit" class="btn btn-danger">Ok</button> 
                                                        </form>
                                                             
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>  
                         <%} %>
						<form action="/MVC/admin/users/edit?userID=<%=request.getParameter("userID")%>" method="post"
							enctype="multipart/form-data" onsubmit="return validateFormEditUser(event);" id="editUserForm">
							<div class="form-group"> 
								<div class="form-group">
									<label for="exampleFormControlSelect4">Quyền Truy Cập</label> <select
										class="form-control custom-autofill-selected"
										id="exampleFormControlSelect4" name="roleID">
										<option value="1" <%if (admin) {%> selected="selected" <%}%>>Quản
											trị viên</option>
										<option value="2" <%if (teacher) {%> selected="selected" <%}%>>Giáo
											viên</option>
										<option value="3" <%if (student) {%> selected="selected" <%}%>>Học
											viên</option>
									</select>

								</div>
								<div class="form-group">
									<label for="nameEdit">Tên Người Dùng</label> <input
										type="text" class="form-control custom-autofill-selected"
										id="nameEdit" name="name"
										value="<%=userModel.getName()%>" onblur="checkNameEdit();">
										<p id="error-nameEdit"style="color:red;"></p>
								</div>
								<div class="form-group">
									<label for="emailEdit">Email</label> <input
										type="email" class="form-control custom-autofill-selected"
										id="emailEdit" name="email"
										value="<%=userModel.getEmail()%>"onblur="checkEmailEdit();"> 
										<p id="error-emailEdit"style="color:red;"></p>
								</div>
								<div class="form-group">
									<label for="phoneEdit">Số Điện Thoại</label> <input
										type="text" class="form-control custom-autofill-selected"
										id="phoneEdit" name="phone"  
										<%if(userModel.getPhone() != null){%>value="<%=userModel.getPhone()%>" <%}%> onblur="checkPhoneEdit();">
										<p id="error-phoneEdit"style="color:red;"></p>
								</div>
								<%if(userModel.getImage() != null){%>
								<a href="/MVC/<%=userModel.getImage()%>" target="blank">Ảnh hiện tại</a>
								<div class="form-group">
									<label for="file">Thay Đổi Ảnh Mô Tả</label> <input name="image"
										type="file" class="form-control" id="file">
								</div>
								<input type="hidden" name="imageString" value="<%=userModel.getImage()%>"> 
								<%}else{%>
									<div class="form-group">
									<label for="file">Thêm Ảnh Mô Tả</label> <input name="image"
										type="file" class="form-control" id="file">
								</div>
								<%} %>   
								<div class="form-group">
									<label for="" class="form-label">Giới Tính</label>
									<div class="mb-3 form-check">
										<input type="radio"
											class="form-check-input custom-autofill-selected"
											id="maleEdit" name="gender" value="true"
											<%if (userModel.getGender() != null && userModel.getGender()) {%>
											checked <%}%>> <label class="form-check-label"
											for="maleEdit">Nam</label>
									</div>
<div class="mb-3 form-check">
										<input type="radio"
											class="form-check-input custom-autofill-selected"
											id="femaleEdit" name="gender" value="false"
											<%if (userModel.getGender() != null && !userModel.getGender()) {%>
											checked <%}%>> <label class="form-check-label"
											for="femaleEdit">Nữ</label>
									</div>
									<p id="error-genderEdit"style="color:red;"></p>
								</div>
								<div class="form-group">
									<label for="descEdit">Mô tả (Chỉ
										giáo viên mới có mô tả !!!)</label>
									<textarea class="form-control" id="descEdit"
										rows="5" <%if(!userModel.getRoleModel().getRoleName().equals("Giáo Viên")){ %>readonly<%} %> name="description"><%if(userModel.getDescription()!=null){ %><%=userModel.getDescription() %> <%} %></textarea>
										<p id="error-descEdit"style="color:red;"></p>
								</div>
								
								<div class="wrap-button">
									<button type="submit" class="add-btn">Chỉnh Sửa</button>
									<a href="/MVC/admin/users" type="button" class="btn add-btn back-btn">Quay
										Lại</a>
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
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const selectBox = document
					.getElementById("exampleFormControlSelect4");
			const textarea = document
					.getElementById("descEdit");

			selectBox.addEventListener("change", function() {
				if (selectBox.value === "2") { // Nếu lựa chọn là "Giáo viên"
					textarea.readOnly = false; // Cho phép nhập vào textarea
				} else {
					textarea.value = ""; // Xóa nội dung của textarea
					textarea.readOnly = true; // Không cho phép nhập vào textarea
				}
			});
		});
		
		
		const emailCurrent=document.getElementById("emailEdit").value;
        function checkEmailEdit() {
            return new Promise(function(resolve, reject) {
                var email = document.getElementById('emailEdit').value;
                var errorEmail = document.getElementById('error-emailEdit');
                var regexEmail = /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

                if (email === '' || email == null) {
                    errorEmail.textContent = "Email không được để trống!";
                    resolve(false);
                }
                else if(emailCurrent==email){
                    errorEmail.textContent = "";
                    resolve(true);
                }
                else if (!regexEmail.test(email)) {
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

        function checkNameEdit() {
            var name = document.getElementById('nameEdit').value;
            var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;
            var errorName = document.getElementById('error-nameEdit');

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

        function checkPhoneEdit() {
            var phone = document.getElementById('phoneEdit').value;
            var regexPhone = /^(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-689]|9[0-46-9])(\d{7})$/;
            var errorPhone = document.getElementById('error-phoneEdit');

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

        function checkDescEdit() {
            var mota = document.getElementById('descEdit').value;
            var regexMota = /^.{1,100}$/;
            var errorMota = document.getElementById('error-descEdit');

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
        function checkGenderEdit() {
			var male = document.getElementById('maleEdit').checked;
			var female = document.getElementById('femaleEdit').checked;
			var error = document.getElementById('error-genderEdit');
			if(male || female){
				error.textContent = "";
				return true;
			}
			else{
				error.textContent = "Chưa chọn giới tính!";
				return false;
			}
        }
        async function validateFormEditUser(event) {
            event.preventDefault();

            try {
                const isEmailValid = await checkEmailEdit();
                const isNameValid = checkNameEdit();
                const isPhoneValid = checkPhoneEdit();
                const isDescValid = checkDescEdit();
                const isGenderValid = checkGenderEdit();

                if (isEmailValid && isNameValid && isPhoneValid && isDescValid && isGenderValid) {
                	alert('Sửa thành công');
                	document.getElementById("editUserForm").submit();

                }
            } catch (error) {
                alert("Đã xảy ra lỗi. Vui lòng thử lại.");
            }
        }
	</script>

</body>

</html>