<%@page import="com.pbl3.model.UserModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabListsModel"%>
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
 	<%@include file ="../../../assets/css/base.css"%>
  	<%@include file = "../../../assets/css/style-vocablists.css"%>
</style>
<style>
.header .inner-main ul .tu-vung {
       		color: var(--color-one);
      	 }
</style>
	<%@include file="../re-use/header.jsp" %>
	
	<div class="welcome">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="inner-main">
                        <h2 class="inner-title">Từ Vựng</h2>
                        <div class="inner-bar"></div>
                        <p class="inner-desc">Tại StudyTOEIC, chúng tôi hiểu rằng từ vựng là nền tảng quan trọng trong việc học tiếng Anh, vì vậy chúng tôi đã tạo ra các danh sách từ vựng đa dạng và phong phú, phù hợp với mọi trình độ và nhu cầu học tập.</p>
                        <div class="inner-button">
                            <!-- <div class="button-two button-1">
                                    <a class="button1">Khóa Học</a>
                            </div> -->
                            <div class="button-two button-2">
                                    <a class="button2" method="post">Học Từ Vựng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <div class="list-vocab">
        <div class="container">
            <div class="row">
                <div class="col-xl-3">
                    <!-- Button trigger modal -->
                    <a class="button-add" data-toggle="modal" data-target="#add-listvocab">
                        <div class="inner-wrap inner-add">
                        <i class="fa-solid fa-plus"></i>
                        <p>Tạo danh sách từ vựng</p>
                        </div>
                    </a>
                             <!-- Modal -->
                            <div class="modal fade modal-form" id="add-listvocab" tabindex="-1"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    <div class="modal-header">
                                        <h5 class="inner-title" id="add-listvocab">Thêm danh sách</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="/MVC/vocab-lists/create" onsubmit="return validateForm();">
                                            <div class="row">
                                                <div class="col-12" style="display:flex;     justify-content: center;">
                                                    <div class="form-group" style="width: 80%;
    margin: 0;
    padding: 0;">
                                                        <label for="ten">Tên danh sách*:</label>
                                                        <input id="ten" name="name" type="text" onblur="checkTen();">
                                                        <p id="error-ten" style="color:red;"></p>
                                                        <label for="mo-ta">Mô tả:</label> 
                                                        <textarea id="mo-ta" name="desc" onblur="checkMota();"></textarea>
                                                        <p id="error-mota" style="color:red;"></p>
                                                        <button class="button">Thêm</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            <%
			int i = 0;
			%>
			<%
			for (VocabListsModel v : (LinkedList<VocabListsModel>) request.getAttribute("vocabListsModels")) {
			%>
                <div class="col-xl-3">
                    <a href="vocab-lists/vocab?listID=<%=v.getListID()%>">
                        <div class="inner-wrap">
                            <div class="inner-img">
                                <img src="https://images.unsplash.com/photo-1581447109200-bf2769116351?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="listvocab">
                            </div>
                            <div class="inner-content">
                                <h3 class="inner-listname">
                                    <%=v.getNameList()%>
                                </h3>
                            <div class="inner-number">
                            </div>
                                <p class="inner-desc"><%=v.getDescription()%></p>
                                <!-- <p class="inner-number">số lượng</p> -->
                            </div>
                            
                        </div>
                        
                    </a>
                </div>
             <%
 				}
 			 %>
            </div>
        </div>
    </div>
	<%@include file="../re-use/footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous">
	</script>
	
	<script>
	function checkTen(){
    	var isValid=false;
        var ten= document.getElementById('ten').value;
        var regexTen = /^.{1,30}$/;
        var errorTen=document.getElementById('error-ten');
        if(ten==''||ten==null){
             errorTen.textContent="Tên danh sách không được để trống!";
        }else 
        if(!regexTen.test(ten)){
             errorTen.textContent="Tên danh sách không quá 30 kí tự";
        }
        else{
        	isValid=true;
             errorTen.textContent="";
             
        }
        return isValid;
     }
    function checkMota(){
    	var isValid=false;
        var mota= document.getElementById('mo-ta').value;
        var regexMota = /^.{1,100}$/;
        var errorMota=document.getElementById('error-mota');
        if(mota==''||mota==null){
            return true;
       }else 
        if(!regexMota.test(mota)){
             errorMota.textContent="Mô tả danh sách không quá 100 kí tự";
        }
        else{
        	isValid=true;
             errorMota.textContent="";
             
        }
        return isValid;
     }
    function validateForm() {
		if(checkTen() && checkMota() ){
            alert("Thêm thành công!");
            return true;
		}else{
			return false;
		}
    }
	</script>
</body>
</html>