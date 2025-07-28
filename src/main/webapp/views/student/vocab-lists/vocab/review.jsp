<%@page import="com.pbl3.model.VocabListsModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.pbl3.model.VocabModel"%>
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
    	<%@include file="../../../../assets/css/base.css"%>
    	 <%@include file="../../../../assets/css/styleReview.css"%>   
    </style>
    <!-- header  -->
	<%@include file="../../re-use/header.jsp" %>
    <!--end  header  -->
    <% VocabListsModel vocabListsModel =(VocabListsModel)request.getAttribute("vocablistsModel");
    LinkedList<VocabModel> vocabModels =(LinkedList<VocabModel>) request.getAttribute("vocabModels");
    int listID=(int) request.getAttribute("listID");
    %>
     <div class="section-one">
        <div class="container">
            <div class="inner-title">
                <h2>Học từ mới: <%=vocabListsModel.getNameList() %></h2>
            </div>  
            <div class="inner-controlpage">
            <%
            String servletPath=(String)request.getAttribute("servletPath");
            System.err.println("servletPath la: "+servletPath);
            String path=(String)request.getAttribute("path");
            String learnedpath = path.replace("learn", "learned");
            String tmp=path.replace("/review", "");
            String stopPath =tmp.replace("action=learn&", "");
            %>
                <a class="back-list"href="<%=learnedpath %>"><i class="fa-brands fa-leanpub"></i>   Ôn tập</a>
                <a class="stop-review" href="<%=stopPath %>"><i class="fa-regular fa-rectangle-xmark"></i>   Dừng học danh sách này</a>
            </div>
        </div>
    </div>
<%if(vocabModels.size()!=0){ %>
    <div class="section-two">
        <div class="container">
            <div class="inner-main" id="flashcard">
            <%for (VocabModel v : vocabModels){ %>
                <div class="flashcard" >
                    <div class="front">
                         <div class="inner-englishmean">
                            <h2><%=v.getVocab() %>
                                <a class="playButton">
                                    <i class="fa-solid fa-volume-high"></i>
                                </a>
                                <audio class="myAudio" src="https://dict.youdao.com/dictvoice?audio=<%=v.getVocab() %>&type=1" type="audio/mpeg" controls></audio>
                            </h2>
                        </div>
                        <div class="inner-vocabtype">
                            <h3>(<%=v.getWordType() %>)  / <%=v.getPronunciation()%> /</h3>
                        </div>
                    </div>
                    <div class="back">
                         <div class="row">
                            <div class="col-8">
                                <div class="inner-mean">
                                    <h5 >Định nghĩa:</h5>
                                    <p class="vietnam-mean"><%=v.getMean() %></p>
                                    <h5 class="exam">Ví dụ</h5>
                                    <div class="inner-ex">
                                                        
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
                            </div>
                            <div class="col-4">
                                <div class="inner-img">
                                    <img src="/MVC/<%=v.getImage()%>" alt="Ảnh mô tả">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    <div class="section-three">
        <div class="container">
            <div class="inner-controler">
                <form method="POST" id="myform">
                    <button>Đã thuộc từ này</button>            
                </form> 
                <button id="next-button">Tiếp tục</button>
            </div> 
        </div>
    </div>
    <%} else{%>
    	    <div class="inner-notifi">
        <div class="container">
          <p> Bạn đã học hết từ vựng trong danh sách này. Vui lòng chuyển sang "Ôn tập" để ôn lại những từ đã học!.</p>  
        </div>
        
    </div>
    <%} %>
          <!-- <footer> -->
                <%@include file="../../re-use/footer.jsp" %>
            <!-- end footer -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script>
	        //click audio
	        var audioElements = document.querySelectorAll(".myAudio");
	        var playButtons = document.querySelectorAll(".playButton");
	
	        // Duyệt qua mỗi cặp phần tử audio và nút
	        playButtons.forEach(function(playButton, index) {
	            var audio = audioElements[index];
	
	        // Thêm sự kiện click cho mỗi nút
	        playButton.addEventListener("click", function(event) {
	            event.stopPropagation();
	            if (audio.paused) {
	                audio.play(); // Nếu đang tạm dừng, tiếp tục phát
	            } else {
	                audio.pause(); // Nếu đang phát, tạm dừng
	            }
	        });
	    });
            // Định nghĩa hàm để thêm địa chỉ action
            function addLinkAction(link) {
            // Chuyển đổi số thành chuỗi
            var linkString = link.toString();
            <%if(servletPath.startsWith("/vocab-lists")){ %> var baseUrl = '/MVC/vocab-lists/vocab/review/remember?listID=<%=listID%>&index=';<%}%>
            <%if(servletPath.startsWith("/course")){ %> var baseUrl = '/MVC/course/course-detail/vocab-lists/vocab/review/remember?lessionID=<%=request.getParameter("lessionID")%>&index=';<%}%>
            // Lấy phần tử form đã chọn
            var form = document.getElementById('myform');
            // Thêm địa chỉ action vào form với tham số được chuyển đổi thành chuỗi
            form.action = baseUrl + linkString;
        }

            // Định nghĩa hàm để xử lý sự kiện click
            function handleClick(event) {
                // Lấy tất cả các phần tử có class 'myButtons'
                var buttons = document.querySelectorAll('.flashcard');
                // Lặp qua từng phần tử và thực hiện thay đổi
                buttons.forEach(function(button) {
                    // Kiểm tra xem class 'highlight' đã tồn tại trên phần tử hay chưa
                    if (button.classList.contains('onclick')) {
                        // Nếu đã tồn tại, loại bỏ class 'highlight'
                        button.classList.remove('onclick');
                    } else {
                        // Nếu chưa tồn tại, thêm class 'highlight'
                        button.classList.add('onclick');
                    }
                });
            }
            //hàm trả về front
            function front() {
                    var buttons = document.querySelectorAll('.flashcard');
                    buttons.forEach(function(button) {
                        if (button.classList.contains('onclick')) {
                            button.classList.remove('onclick');
                        }
                    }
                );
                }
            document.getElementById('flashcard').addEventListener('click', handleClick);
            
            
            window.addEventListener('load', random);
            document.getElementById('next-button').addEventListener('click', random);
            function random() {
            var contents = document.getElementsByClassName('flashcard');
            var maxLength =<%=vocabModels.size()%>;
            var randomIndex = Math.floor(Math.random() * maxLength);
			front();
            addLinkAction(randomIndex);

            
            // Ẩn tất cả các nội dung
            for (var i = 0; i < maxLength; i++) {
                contents[i].style.display = 'none';
            }
            
            // Hiển thị nội dung ngẫu nhiên được chọn
            contents[randomIndex].style.display = 'block';
            if (audioElements[randomIndex].paused) {
            	audioElements[randomIndex].play(); // Nếu đang tạm dừng, tiếp tục phát
            } else {
            	audioElements[randomIndex].pause(); // Nếu đang phát, tạm dừng
            }
            };


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
    