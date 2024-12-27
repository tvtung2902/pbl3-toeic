<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.CourseModel"%>
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
	<style>
		<%@ include file="../../../assets/admin-css/base.css" %>
		<%@ include file="../../../assets/admin-css/style.css" %>  
        <%@ include file="../../../assets/admin-css/style-create.css" %>

	</style>   
</head>
 	
<body>
<style>
.menu .item li:nth-child(2) a{
    color: var(--color-one);
}
.menu .item li:nth-child(2) i{
    color: var(--color-one);
}</style>
	 <!-- Menu sidebar --> 
     <%@ include file="../re-use/header.jsp" %>
    <!-- Main -->      
    
  <div class="main" id="main">
    <div class="container">
    <div class="section-one" style=" margin-bottom: 10px;">       
      <div class="head">
        <h2 class="add">Thêm Khóa Học</h2>
      </div>
      <div class="main-create"> 
        <div class="wrap"> 
          <form action="/MVC/admin/course/create" method="post" enctype="multipart/form-data" onsubmit="validateFormCreateCourse(event);" id="createCourseForm">    

            <div class="form-group" >
              <label for="nameCourse" name="courseName">Tên khóa học*:</label>
              <input name="courseName" type="text" class="form-control" id="nameCourse" onblur="checkNameCourse();">
              <p id="error-nameCourse" style="color:red;"></p>
            </div>    

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label >Giáo Viên*:</label>
                  <br>
                  <input name="teacherID" list="teachers" class="col-sm-6 custom-select custom-select-sm" id="teacher" onblur="checkTeacher();">
                 <datalist id="teachers">
                  <%LinkedList<UserModel> userModels = (LinkedList<UserModel>)request.getAttribute("userModels");%>
                    <%for (UserModel u : userModels){ %>
                     <option value="<%=u.getUserID() %>"><%=u.getName() %></option>
                    <%} %>
                  </datalist>  
                  <p id="error-teacher" style="color:red;"></p>
                </div>  
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="file">Ảnh mô tả:</label>
                  <input name="image" type="file" class="form-control" id="file">
                </div>
              </div>
            </div> 

            <div class="form-group">
              <label for="desc">Mô tả:</label>
              <textarea name ="courseDesc" class="form-control" id="desc" rows="5"></textarea>
                            <p id="error-desc" style="color:red;"></p>
            </div>

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="duration">Thời hạn (Tháng)*:</label>
                  <input name="duration" type="number" class="form-control" id="duration"onblur="checkDuration();">
                                <p id="error-duration" style="color:red;"></p>
                </div>
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="price">Giá*:</label>
                  <input name="price" type="number" class="form-control" id="price" step="price" onblur="checkPrice();">
                                <p id="error-price" style="color:red;"></p>
                </div>
              </div>
            </div>

            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="input">Đầu vào*:</label>
                  <input name="input" type="number" class="form-control" id="input"onblur="checkInput();">
                                <p id="error-input" style="color:red;"></p>
</div>
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="output">Đầu ra*:</label>
                  <input name="target" type="number" class="form-control" id="output"onblur="checkOutput();">
                                <p id="error-output" style="color:red;"></p>
                </div>
              </div>
            </div>
            
            <div class="row">

              <div class="col-6">
                <div class="form-group">
                  <label for="percentSalary">Phần Trăm Tiền Trả Cho Giáo Viên*:</label>
                  <input name="percentSalary" type="number" class="form-control" id="percentSalary" onblur="checkPercentSalary();">
                                <p id="error-percentSalary" style="color:red;"></p>
                </div> 
              </div>

              <div class="col-6">
                <div class="form-group">
                  <label for="percentDiscount">Phầm Trăm Tiền Giảm Gía Khi Gia Hạn Khóa Học*:</label>
                  <input name="percentDiscount" type="number" class="form-control" id="percentDiscount" onblur="checkPercentDiscount();">
                                                  <p id="error-percentDiscount" style="color:red;"></p>
                </div>
              </div>
            </div>
            <div class="wrap-button">
				<button type="submit" class="add-btn">Thêm</button>
          		<a href="/MVC/admin/course" type="button" class="btn add-btn back-btn">Quay lại</a>
          	</div>   
          </form>
        </div>
      </div>
    </div>
  </div>

    </div>
        </div>
	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous">
    </script>
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
    
    function checkNameCourse(){
    	var isValid=false;
        var name= document.getElementById('nameCourse').value;
        var regexName = /^.{1,40}$/;
        var errorName=document.getElementById('error-nameCourse');
        if(name==''||name==null){
             errorName.textContent="Tên khóa học không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Tên khóa học không quá 40 kí tự";
        }
        else{
        	isValid=true;
             errorName.textContent="";
             
        }
        return isValid;
     }
    function checkTeacher(){
    	var isValid=false;
        var teacher= document.getElementById('teacher').value;
        var errorName=document.getElementById('error-teacher');
        const teachers = document.getElementById('teachers');
        const teacherOptions = Array.from(teachers.options);
        if(teacher==''||teacher==null){
             errorName.textContent="ID giáo viên không được để trống!";
        }else 
        if(!teacherOptions.some(option => option.value === teacher)){
             errorName.textContent="ID giáo viên phải nằm trong danh sách";
        }
        else{
        	isValid=true;
             errorName.textContent="";
             
        }
        return isValid;
     }
    function checkDuration(){
    	var isValid=false;
    	 var regexName = /^[1-9]\d*$/;
        var name= document.getElementById('duration').value;
        var errorName=document.getElementById('error-duration');
        if(name==''||name==null){
        	errorName.textContent="Thời hạn không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Thời hạn phải là số nguyên dương!";
        }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function checkPrice(){
    	var isValid=false;
    	 var regexName = /^\d*(\.\d+)?$/;
        var name= document.getElementById('price').value;
        var errorName=document.getElementById('error-price');
        if(name==''||name==null){
        	errorName.textContent="Giá khóa học không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Giá khóa học không hợp lệ!";
        }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function checkInput(){
    	var isValid=false;
    	 var regexName = /^(0|[1-9][0-9]?|[1-8][0-9][0-9]|9[0-8][0-9]|990)$/;
        var name= document.getElementById('input').value;
        var errorName=document.getElementById('error-input');
        if(name==''||name==null){
        	errorName.textContent="Đầu vào không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Đầu vào không hợp lệ!";
        }
        else{
isValid=true;
        	checkOutput();
             errorName.textContent="";
        }
        return isValid;
     }
    function checkOutput(){
    	var isValid=false;
        var input= document.getElementById('input').value;
    	 var regexName = /^(0|[1-9][0-9]?|[1-8][0-9][0-9]|9[0-8][0-9]|990)$/;
        var name= document.getElementById('output').value;
        var errorName=document.getElementById('error-output');
        const inputInt = parseInt(input, 10);
    	const outputInt = parseInt(name, 10);
        if(name==''||name==null){
        	errorName.textContent="Đầu ra không được để trống!";
        }else 
        if(!regexName.test(name)){
             errorName.textContent="Đầu ra không hợp lệ!";
        }
        else
       if(isNaN(inputInt) || isNaN(outputInt)){
                 errorName.textContent="Nhập đầu vào!";
            }
       else
           if (inputInt >= outputInt) {
        	   errorName.textContent="Đầu ra phải cao hơn đầu vào!";
           }
        else{
        	isValid=true;
             errorName.textContent="";
        }
        return isValid;
     }
    function checkPercentSalary(){
    	var isValid=false;
    	 var regexName = /^(0|[1-9][0-9]?|100)$/;
        var name= document.getElementById('percentSalary').value;
        var errorName=document.getElementById('error-percentSalary');
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

    function checkPercentDiscount() {
        var isValid = false;
        var name = document.getElementById('percentDiscount').value;
        var errorName = document.getElementById('error-percentDiscount');

        // Kiểm tra xem ô nhập liệu có trống hay không
        if (name === '' || name === null) {
            errorName.textContent = "Phần trăm không được để trống!";
        } else {
            // Chuyển đổi giá trị nhập liệu sang số nguyên để kiểm tra
            var percent = parseInt(name, 10);

            // Kiểm tra giá trị phần trăm có hợp lệ không
            if (isNaN(percent) || percent < 0 || percent > 100) {
                errorName.textContent = "Phần trăm không hợp lệ!";
            } else {
                isValid = true;
                errorName.textContent = "";
            }
        }

        return isValid;
    }

    function validateFormCreateCourse(event) {
    	event.preventDefault();
    	var isNameCourse = checkNameCourse();
    	var isNameTeacher =  checkTeacher();
    	var isPrice = checkPrice();
    	var isDuration = checkDuration();
    	var isInput= checkInput();
    	var isOutput= checkOutput();
    	var isPercentDiscount= checkPercentDiscount();
    	var isPercentSalary=checkPercentSalary();
    	console.log(isPrice);
		if(isNameCourse && isNameTeacher && isPrice &&isDuration && isInput && isOutput && isPercentDiscount &&isPercentSalary ){
            alert("Thêm thành công!");
            document.getElementById("createCourseForm").submit();
		}
    } 
    </script>


</body>

</html>