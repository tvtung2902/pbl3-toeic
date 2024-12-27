<%@page import="com.pbl3.model.TestsModel"%>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý khóa học</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
  <body>
  <style>
  		<%@include file="../../../../assets/css/base.css"%>   
        <%@ include file="../../../assets/teacher-css/base.css" %>
        <%@ include file="../../../assets/teacher-css/style.css" %> 
    	<%@ include file="../../../assets/teacher-css/styleTestsDetail.css" %>
    	<%@include file = "../../../assets/css/style-vocablists.css"%>       
.menu .item li:nth-child(3) a{  
    color: var(--color-one);   
} 
.menu .item li:nth-child(3) i{
    color: var(--color-one);
}
.search{
margin:0 !important;
}
    .wrap-button{
      display: flex;
      justify-content: end;
      margin-top: 20px; 
    }
.wrap-part{
	margin-top: 20px; 
	padding: 10px;
	border: 1px solid var(--color-two);
	border-radius: 8px;
}
.button-main-two {
    padding: 4px 6px;
    background-color: var(--color-two);
    border-color: var(--color-two);
    font-size: 15px;
    font-weight: 500;
    margin-right: 5px;
}  
  </style>
	    <!-- menu  -->
	 <%@include file="../re-use/sidebar.jsp" %>
    <!--end  menu  -->
     <div class="main"id="main">
        <div class="container">
        	<div class="wrap-background">
        	 <div>
        	 <% int allQuestion = (int)request.getAttribute("allQuestion"); %>
        	 	<h2 class="name"><%=((TestsModel)request.getAttribute("testsModel")).getTestsName()%></h2>
        	 	<p id="error-del" style="color:red"></p>
        	 	<div>  
                    <button class="button-main button-main-two" data-toggle="modal" data-target="#edit-test" id="btn-edit">Sửa đề thi</button>  
                    <button class="button-main button-main-two" data-toggle="modal" data-target="#delete-test" id="btn-del">Xóa đề thi</button>  
                 	<button class="button-main button-main-two" data-toggle="modal" data-target="#test" id="btn-status"><%=((TestsModel)request.getAttribute("testsModel")).getStatus() ? "Ẩn đề thi" :  "Phát hành"%></button>  
               </div>
               <div class="list-vocab" style="margin:0; padding:0;"> 
               <div class="modal fade modal-form" id="edit-test" tabindex="-1" 
                            aria-labelledby="exampleModalLabel" aria-hidden="true" onsubmit="return validateForm();">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>      
                                    <div class="modal-header">
                                        <h5 class="inner-title" id="add-listvocab">Sửa đề thi</h5>
                                    </div>
                                    <div class="modal-body"> 
                                        <form method="post" action="/MVC/teacher/tests/edit" enctype="multipart/form-data" onsubmit="return checkEdit();">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="ten">Tên đề thi*:</label>
                                                        <input id="ten" name="testsName" type="text" value="<%=((TestsModel)request.getAttribute("testsModel")).getTestsName()%>" required onblur="checkNameTest();">
                                                        <%if(((TestsModel)request.getAttribute("testsModel")).getAudio() != null) {%>
													    <div class="audio">
													    <a href="/MVC/<%=((TestsModel)request.getAttribute("testsModel")).getAudio()%>" target="_blank" style="text-decoration: underline;">Audio hiện tại</a>
														</div>	
													
													    <label for="anh">Thay đổi Audio :</label>		  
													    <input type="hidden" name="audioString" value="<%=((TestsModel)request.getAttribute("testsModel")).getAudio()%>">
													   
													    <input id="anh" type="file" name="audio">                          
				                                        <%} else{ %> 
				                                        <label for="anh">Audio:</label>
				                                        <input id="anh" type="file" name="audio">
				                                        
				                                        <%}%> 
				                                        <input type="hidden" name="testsID" value="<%=((TestsModel)request.getAttribute("testsModel")).getTestsID() %>">
                                                        <button class="buttonThem">Sửa</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <div class = "del">
                                    	 <form
                                                action="/MVC/teacher/tests/delete?testsID=<%=request.getParameter("testsID")%>"
                                                method="post" onsubmit="return checkDelete();">    
                                                          <div class="modal-delete-vocab">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="delete-test" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content"> 
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn xóa đề thi này?
													            </div>
													            <div class="modal-footer">
													              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
													              <button type="submit" class="btn btn-danger">Xóa</button>
													            </div>
													          </div>
													        </div> 
													      </div>
													    </div>
                                          </form>
                                         
                                         <form
                                                action="/MVC/teacher/tests/status?testsID=<%=request.getParameter("testsID")%>"
                                                method="post" onsubmit="return checkChangeStatus();">
                                                		  <input type="hidden" name="status" value="<%=((TestsModel)request.getAttribute("testsModel")).getStatus()%>">
                                                          <div class="modal-delete-vocab">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="test" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content"> 
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn chỉnh sửa trạng thái đề thi này?
													            </div>
													            <div class="modal-footer">
													              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
													              <button type="submit" class="btn btn-danger">Đồng ý</button>
													            </div>
													          </div>
													        </div> 
													      </div>
													    </div>
                                         </form>  	        	 
                       </div>   
        	 </div>
        	 <%ArrayList<Integer> arr = (ArrayList<Integer>)request.getAttribute("arr");%>
        	 <div class="part">   
				<%for(PartModel p : (LinkedList<PartModel>)request.getAttribute("partModels")){%>        	 	
        	 		<div class="wrap-part">
        	 			<a href="/MVC/teacher/tests/part?testsID=<%=request.getParameter("testsID")%>&partID=<%=p.getPartID()%>">
        	 				<p>Part: <%=p.getPartID()%> <%=p.getPartName()%>  - đã tạo:  <%=arr.get(p.getPartID())%> Câu</p>
        	 			</a>
        	 		</div>
        	 	<%} %> 
        	 </div>
        	 <div class="wrap-button">
          		<a href="/MVC/teacher/tests" type="button" class="btn add-btn back-btn">Quay lại</a>
          	</div> 
        	 </div>   
        </div>
     </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  <script>
	function checkDel(){
		var errorTen=document.getElementById('error-del');
		<%if(!(boolean)request.getAttribute("isDelTest")){
        	%>
        	errorTen.textContent="Đề thi này đã được sử dụng không thể xóa";
        <%}%>
	}
	window.addEventListener('load', function() {
	checkDel();
	});
    function checkNameTest(){
    	var isValid=false;
        var ten= document.getElementById('nameTest').value;
        var regexTen = /^.{1,40}$/;
        var errorTen=document.getElementById('error-nameTest');
        if(ten==''||ten==null){
             errorTen.textContent="Tên đề thi không được để trống!";
        }else 
        if(!regexTen.test(ten)){
             errorTen.textContent="Tên đề thi không quá 40 kí tự";
        }
        else{
        	isValid=true;
             errorTen.textContent="";
             
        }
        return isValid;
     }
    function validateForm() {
		if(checkNameTest() ){
            alert("Sửa thành công!");
            return true;
		}else{
			return false;
		}
    }
    

    function checkEdit(){
    	<% if(((TestsModel)request.getAttribute("testsModel")).getStatus()){%>
    	alert("Đề thi đang phát hành không được sửa.");
        return false
        <%}else{%>
        return true;
        <%}%>
    };

    function checkDelete(){
    	<% if(((TestsModel)request.getAttribute("testsModel")).getStatus()){%>
    	alert("Đề thi đang phát hành không được xóa.");
        return false;
        <%}else{%>
        return true;
        <%
        }
        %>
    };
    
    function checkChangeStatus() {
    	<% if(allQuestion<200 ){%>
    	alert("Đề thi chưa đủ 200 câu hỏi không thể phát hành.");
        return false;
        <%} else {%>
        return true;
        <%}%>

    };
    

  	</script>
  
  </body>
</html>
 