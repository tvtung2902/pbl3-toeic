<%@page import="com.pbl3.libs.Pair"%>
<%@page import="com.pbl3.model.CourseModel"%>
<%@page import="com.pbl3.model.CouponModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.pbl3.model.UserModel"%>
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
    <style type="text/css">
    <%@include file="../../assets/css/base.css" %>
    <%@include file="../../assets/css/style.css" %>
    </style>
    <style>
      .header .inner-main ul .trang-chu {
        color: var(--color-one);
      }
    </style>
  </head>
  <body>
    <%@include file="re-use/header.jsp" %>

    <div class="welcome">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="inner-main">
              <h5 class="inner-welcome">Học Ngay Từ Hôm Nay</h5>
              <h1 class="inner-title">Khóa Học Và Luyện Đề TOEIC Hàng Đầu</h1>
              <p class="inner-desc">Chào mừng đến với StudyTOEIC - Nền tảng học tiếng anh và luyện thi TOEIC hàng đầu.</p>
              <div class="inner-button">
                <div class="button-two button-1">
                  <a href="/MVC/courses" class="button1">Khóa Học</a>
                </div>
                <div class="button-two button-2">
                  <a href="/MVC/tests" class="button2">Đề Thi</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	    <div class="about-us">
        <div class="container">
            <div class="row">
                <div class="col-xl-6">
                    <div class="inner-content">
                        <div class="inner-tag">Về StudyTOEIC</div>
                        <div class="inner-title">Chào Mừng Đến Với StudyTOEIC</div>
                        <div class="inner-desc">Nền tảng học tiếng Anh hàng đầu! Chúng tôi cung cấp các khóa học và bộ đề thi chất lượng cao, giúp bạn nâng cao kỹ năng ngôn ngữ và tự tin vượt qua mọi kỳ thi. Với đội ngũ giảng viên giàu kinh nghiệm và tài liệu học tập phong phú, chúng tôi cam kết mang đến cho bạn trải nghiệm học tập hiệu quả và thú vị. Hãy cùng chúng tôi chinh phục đỉnh cao tri thức!</div>
                        <div class="inner-tick">
                            <ul>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Đội ngũ giảng viên giàu kinh nghiệm</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Bài giảng hiệu quả đa dạng</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Cập nhập những đề thi mới nhất</span>
                                </li>
                                <li>
                                    <i class="fa-solid fa-circle-check"></i>
                                    <span>Kho từ vựng phong phú</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="inner-img">
                        <img src="https://demo.graygrids.com/themes/edugrids/assets/images/about/about-img2.png" alt="img1">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="courses">
        <div class="container">
            <div class="row">
                <div class="col-12 text-a">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-graduation-cap"></i>
                        </div>
                        <h1 class="inner-title">
                            Các Khóa Học Nổi Bật
                        </h1>
                        <div class="inner-bar"> </div>
                        <p class="inner-desc"> Chúng tôi cung cấp các khóa học từ căn bản đến nâng cao, bao gồm nhiều mức đầu ra của tiếng anh TOEIC</p>
                    </div>
                </div>
                 <% for(Pair<CourseModel, Integer> c : (LinkedList<Pair<CourseModel, Integer>>)request.getAttribute("AllCourse")){ %>
                <div class="col-xl-4">
                    <a href="/MVC/course/course-detail?courseID=<%=c.getFirst().getCourseID() %>">
                        <div class="inner-main">
                            <div class="inner-img">
                                <img src="/MVC/<%=c.getFirst().getImage() %>" alt="picCourses">
                                <div class="inner-price">
                                    <%=c.getFirst().getPriceCH() %>
                                </div>
                            </div>
                            <h2 class="inner-title"><%=c.getFirst().getCourseName() %></h2>
                           <%if(c.getFirst().getInput()>0){ %>
                            <p class="inner-desc">Khóa học này danh cho học viên có đầu vào <%=c.getFirst().getInput() %>+ và mục tiêu đạt điểm <%=c.getFirst().getTarget() %>+</p>
                            <%}else{ %>
                            <p class="inner-desc">Dành cho các bạn với mục tiêu đạt điểm TOEIC tại các mức đầu ra <%=c.getFirst().getTarget() %>+</p>
                            <%} %>
                            <div class="inner-quality">
                                <p class="quality">Số lượng học viên: <%=c.getSecond() %></p>
                            </div>
                        </div>
                    </a>
                </div>
               <%} %>
            </div>
        </div>
    </div>
     
      <div class="teacher">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-ranking-star"></i>
                        </div>
                        <h1 class="inner-title">
                            Giảng Viên Giàu Kinh Nghiệm
                        </h1>
                        <div class="inner-bar"> </div>
                        <p class="inner-desc">Với các giảng viên bản ngữ và giáo viên có nhiều năm kinh nghiệm trong lĩnh vực giảng dạy tiếng Anh, chúng tôi cam kết mang đến cho bạn kiến thức chuyên sâu và phương pháp học tập tốt nhất.</p>
                    </div>
                </div> 
                <%for(UserModel t : (LinkedList<UserModel>)request.getAttribute("AllTeacher")){ %>
                <div class="col-xl-6">
                    <div class="inner-info"> 
                        <div class="inner-img">
                        	<img <%if(t.getImage() != null){%> src="/MVC/<%=t.getImage()%>"<%}else{%>src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=sWEEGEntG_AQ7kNvgFyaBZw&_nc_ht=scontent.fdad2-1.fna&oh=03_Q7cD1QGqeuVWzNyRpVnWuSmwavr76brpCK5XDNs9PQYnQX-7ZA&oe=666ABFDF"<%}%> alt="eimi fukada">
                        </div>
                        <div class="inner-main">
                            <div class="inner-name"><%=t.getName() %></div>
                            <div class="inner-desc"><%=t.getDescription() == null ? "" : t.getDescription()%></div>
                            <div class="inner-email">
                                <i class="fa-regular fa-envelope"></i>
                                <span><%=t.getEmail() %></span>
                            </div>
                        </div> 
                    </div>
                </div>
				<%} %>
            </div>
        </div>
    </div>

    <div class="utility">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="inner-wrap">
                        <div class="inner-icon">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <h1 class="inner-title">
                            Tại Sao Bạn Nên Học Với StudyTOEIC
                        </h1>
                        <div class="inner-bar"> </div>
                       
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon1.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Học từ vựng hiệu quả với Flash card độc quyền.
                        </p>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon2.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Luôn được hỗ trợ nhanh nhất bởi đội ngũ chuyên môn giỏi, nhiệt tình.
                        </p>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="inner-box">
                        <div class="inner-img">
                            <img src="https://www.ngoaingu24h.vn/resources/images/Icon-NN24H/icon4.png" alt="">
                        </div>
                        <p class="inner-desc">
                            Nội dung khóa học luôn được cập nhật theo xu hướng ra đề.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Remainder of your HTML content -->

     <%@include file="re-use/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function(){
        $(window).scroll(function(){
          if($(this).scrollTop()){
            $('header').addClass('hidentop');
          } else {
            $('header').removeClass('hidentop');
          }
        });
      });
    </script>
  </body>
</html>
