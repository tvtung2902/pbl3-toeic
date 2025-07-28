<%@page import="com.pbl3.model.VocabModel"%>
<%@page import="com.pbl3.model.VocabListsModel"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="com.pbl3.model.CouponModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.LinkedList"%>
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
    	<%@ include file="../../../../assets/teacher-css/style.css" %>
    	<%@include file="../../../../assets/css/style-vocab.css"%> 
    
.menu .item li:nth-child(2) a{
    color: var(--color-one);
}     
.menu .item li:nth-child(2) i{
    color: var(--color-one);
}
.search{
margin:0 !important;
}
.container{
max-width: 90%;
padding:0;
}
a{
color:black;
}
a:hover p{
color:var(--color-one);
}

  </style>
	    <!-- menu  -->
	 <%@include file="../../re-use/sidebar.jsp" %>
    <!--end  menu  -->
      	<% VocabListsModel vocabListsModel=(VocabListsModel)request.getAttribute("vocablistmodel");
  		int number=(int)request.getAttribute("number");
  	%> 
     <div class="main"id="main">
        <div class="container wrap-background"> 
                        <div class="section-one" style="margin-top:30px;"> 
                                <!-- lấy tên và mô tả từ database -->
                              <div class="inner-title">
                                  <h1><%=vocabListsModel.getNameList() %></h1>      
                              </div>
                              <div>  
                                    <button class="button-main button-main-two button-list" data-toggle="modal" data-target="#insert-vocab">Thêm từ vựng</button>
                                    <button class="button-main button-main-two button-list" data-toggle="modal" data-target="#edit-list">Sửa danh sách</button>  
                                    <button class="button-main button-main-two button-list" data-toggle="modal" data-target="#delete-list">Xóa danh sách</button>  
                                </div> 
                              <div class="inner-desc">
                                  <p style="color: black;"><i><%=vocabListsModel.getDescription() %></i></p>
                              </div>
                              <a href="/MVC/teacher/vocab-lists" style="color:red;"><i class="fa-solid fa-arrow-right-from-bracket"></i> Quay lại</a>
                              <!-- đếm số từ trong db -->
                              <div class="inner-number">
                              <%if(number>0){ %>
                                  <p style="color: black;"><i>Danh sách có <%=number %> từ</i></p>
                                  <%}else {%>
                                  <p style="color: black;">Chưa có từ vựng nào trong danh sách.</p>
                                  <%} %>
                              </div>
                        </div>
                    <%
			int i = 0;
			for (VocabModel v : (LinkedList<VocabModel>) request.getAttribute("vocabModels")) {

					i++;
					%>
                    <div class="col-12">
                        <div class="vocab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inner-wrap">
                                            <div class="inner-main">
                                                <div class="inner-content">
                                                    <h2 class="english-mean"><%=v.getVocab()%> ( <%=v.getWordType()%> )
                                                        <a class="playButton">
                                                            <i class="fa-solid fa-volume-high"></i>
                                                        </a>
                                                    <a class="edit" data-toggle="modal"
                                                    data-target="#edit-vocab<%=i%>">
                                                        <i class="fa-regular fa-pen-to-square"></i>
                                                    </a>
                                                    <audio class="myAudio" src="https://dict.youdao.com/dictvoice?audio=<%=v.getVocab()%>&type=1" type="audio/mpeg" controls></audio>
                                                    </h2>
                                                    <p>/<%=v.getPronunciation()%>/</p> 
                                                    <h3>Định nghĩa:
                                                    </h3>
                                                    <p><%=v.getMean()%></p>
                                                    <div class="inner-ex">
                                                        <h3>Ví dụ</h3>
                                                        <%String[] parts = (v.getExample()).split("\\n"); %>
                                                        <ul>
                                                            <%for(String str : parts) {%>
                                                            	<li>
                                                            		<%=str%>
                                                            	</li>	
                                                            <%} %>
                                                        </ul>
                                                    </div>
                                                </div> 
                                                <%if(v.getImage() == null) {%>
                                                <div class="inner-img">
                                                    <img src="https://e-talk.vn/wp-content/uploads/2019/04/cach-hoc-tu-vung-tieng-anh-sieu-toc-1024x1024.png" alt="Anhmota">
                                                </div>
                                                <%} else { %>
                                                <div class="inner-img">
                                                    <img src="/MVC/<%=v.getImage()%>" alt="Anhmota">
                                                </div>	
                                                <%}
                                                 %>
                                             </div>
                                            <div class="delete">
                        
                                              <form
                                                action="/MVC/teacher/vocab-lists/vocab/delete?vocabID=<%=v.getVocabID()%>&listID=<%=request.getParameter("listID")%>"
                                                method="post">
                                                    <a data-toggle="modal" data-target="#delete-vocab" >
                                                    <i class="fa-solid fa-trash-can"></i>
                                                    </a>
                                                          <div class="modal-delete-vocab">
													        <!-- modal-deletelist  -->
													    <div class="modal fade" id="delete-vocab" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													        <div class="modal-dialog">
													          <div class="modal-content">
													            <div class="modal-body"style="text-align: left;">Bạn chắc chắn muốn xóa từ này?
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
          <div class="modal fade modal-form" id="edit-vocab<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="modal-header">
                        <h5 class="inner-title" id="add-listvocab">Sửa từ vựng</h5>
                    </div>
                    <div class="modal-body">
                        <form method="post" enctype="multipart/form-data" action="/MVC/teacher/vocab-lists/vocab/edit?listID=<%=request.getParameter("listID")%>">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <input name="vocabID" type="hidden" class="form-control" value="<%=v.getVocabID()%>">
                                        <label for="vocab">Nghĩa tiếng Anh:</label>
                                        <input id="vocab" name="vocab" type="text"  value="<%=v.getVocab()%>">
                                        <label for="mean">Định nghĩa:</label>
                                        <input id="mean" name="mean" type="text"  value="<%=v.getMean()%>">
                                        <label for="type">Từ loại:</label>
                                        <input id="type" name="wordType" type="text" value="<%=v.getWordType()%>">
                                        <label for="phien-am">Phiên âm:</label>
                                        <input id="phien-am" name="pronunciation" type="text" value="<%=v.getPronunciation()%>">
                                        <label for="example">Ví dụ:</label>
                                        <textarea id="example" name="example"><%=v.getExample()%></textarea> 
                                        <%if(v.getImage() != null) {%>
									    <div class="img-vocab">
									    <a href="/MVC/<%=v.getImage()%>" target="_blank" style="text-decoration: underline;">Ảnh hiện tại</a>
										<input type="checkbox" name="deleteImage" value="yes" id="deleteImageID" style="margin-left: 20px;">
									    <label for="deleteImageID">Xóa</label>
										</div>			 
									    <input type="hidden" name="imageString" value="<%=v.getImage()%>">
									    <label for="anh">Thay đổi ảnh mô tả:</label>
									    <input id="anh" type="file" name="image">                          
                                        <%} else{ %> 
                                        <label for="anh">Ảnh mô tả:</label>
                                        <input id="anh" type="file" name="image">
                                        <%}%> 
                                        <button class="submit">Sửa</button>
                                    </div> 
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
             <%
			}
			%> 
        </div>
    </div>
        <div class="modal-delete-list">
        <!-- modal-deletelist  -->
    <div class="modal fade" id="delete-list" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              Bạn chắc chắn muốn xóa danh sách?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
              <a href="/MVC/teacher/vocab-lists/delete?listID=<%=vocabListsModel.getListID()%>"><button type="button" class="btn btn-danger">Xóa</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    
    <div class="modal-edit-list">
                                 <!-- Modal -->
                                 <div class="modal fade modal-form" id="edit-list" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                 <div class="modal-dialog modal-dialog-centered">
                                     <div class="modal-content">
                                         <button type="button" class="close" data-dismiss="modal"
                                         aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                         </button>
                                         <div class="modal-header">
                                             <h5 class="inner-title" id="add-listvocab">Sửa danh sách</h5>
                                         </div>
                                         <div class="modal-body">
                                             <form method="post" action="/MVC/teacher/vocab-lists/edit">
                                                 <div class="row">
                                                     <div class="col-12">
                                                         <div class="form-group">
                                                         	 <input type="hidden" name="listID" value="<%=vocabListsModel.getListID()%>">
                                                         	 <input type="hidden" name="userID" value="<%=vocabListsModel.getUserID()%>">
                                                             <label for="ten">Tên danh sách:</label>
                                                             <input id="ten" name="nameList" type="text" required value="<%=vocabListsModel.getNameList()%>">
                                                             <label for="mo-ta">Mô tả:</label>
                                                             <textarea id="mo-ta" name="description"><%=vocabListsModel.getDescription()%></textarea>
                                                             <label for="anh">Ảnh mô tả:</label>
                                                             <input id="anh" type="file" name="pic"> 
                                                             <button class="button">Sửa</button>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </form>
                                         </div>
                                     </div>
                                 </div>
                             </div>
</div>
             
              <div class="modal-insert">
            <div class="modal fade modal-form" id="insert-vocab" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-header">
                            <h5 class="inner-title" id="add-listvocab">Thêm từ vựng</h5>
                        </div>
                        <div class="modal-body">
                            <form enctype="multipart/form-data" method="post" action="/MVC/teacher/vocab-lists/vocab/create?listID=<%=request.getParameter("listID")%>">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input name="vocabID" type="hidden" class="form-control" value="">
                                            <label for="vocab">Nghĩa tiếng Anh*:</label>
                                            <input id="vocab" name="vocab" type="text" required>
                                            <label for="mean">Định nghĩa*:</label>
                                            <input id="mean" name="mean" type="text" required>
                                            <label for="type">Từ loại:</label>
                                            <input id="type" name="wordType" type="text">
                                            <label for="phien-am">Phiên âm:</label>
                                            <input id="phien-am" name="pronunciation" type="text">
                                            <label for="example">Ví dụ:</label>
                                            <textarea id="example" name="example"></textarea>
                                            <label for="anh">Ảnh mô tả:</label>
                                            <input id="anh" type="file" name="image">
                                            <button class="submit">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
      <script>

    var audioElements = document.querySelectorAll(".myAudio");
    var playButtons = document.querySelectorAll(".playButton");

    // Duyệt qua mỗi cặp phần tử audio và nút
    playButtons.forEach(function(playButton, index) {
        var audio = audioElements[index];

        // Thêm sự kiện click cho mỗi nút
        playButton.addEventListener("click", function() {
            if (audio.paused) {
                audio.play(); // Nếu đang tạm dừng, tiếp tục phát
            } else {
                audio.pause(); // Nếu đang phát, tạm dừng
            }
        });
    });

        $(document).ready(function(){
            $(window).scroll(function(){
                if($(this).scrollTop()){
                    $('header').addClass('hidentop');
                }
                else
                $('header').removeClass('hidentop');
            });
        });
    </script>
  </body>
</html>
 