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
<%
LessionModel lessionModel=(LessionModel)request.getAttribute("lession");
ArrayList<LessionModel> lessionModels=(ArrayList<LessionModel>) request.getAttribute("listLession");
PartModel partModel = (PartModel)request.getAttribute("part");
int courseID = lessionModel.getCourseID();
%>
    <style>
    	<%@include file="../../../../assets/css/base.css"%>
    	 <%@include file="../../../../assets/css/styleLessionDetail.css"%>
    	
        .header .main-header .khoa-hoc{
            color: var(--color-one);
        }
    footer .container{
        max-width: 1296px;
    }
      
    </style>
    <!-- header  -->
	<%@include file="../re-use/header.jsp" %>
    <!--end  header  -->
       <div class="container">
       
  
        <div class="section-name">
            <div class="inner-title">
                <h2><%=lessionModel.getLessionName() %></h2>
            </div>
            <div class="inner-back">
                <a href="/MVC/course/course-detail?courseID=<%=courseID %>"><i class="fa-solid fa-chevron-left" style="color: var(--color-one);"></i>   Trở về khóa học</a>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-8">
                <div class="section-video">
                    <div class="inner-wrap">
                        <div class="inner-video">
                            <video width="320" height="240" controls>
                                <source src="/MVC/<%=lessionModel.getVideo()%>?lessionID=<%=request.getParameter("lessionID")%>" type="video/mp4">
                            </video>    

                        </div>     
                    </div> 
                </div>
                <div class="inner-link">
                    <ul>
						<%if(lessionModel.getVocabListsModel()!= null){ %>
						<li>
                            <a href="/MVC/course/course-detail/vocab-lists/vocab?lessionID=<%=lessionModel.getLessionID()%>">Từ vựng: <%=lessionModel.getVocabListsModel().getNameList() %></a>
                        </li>
						
						<%} %>
						<%if(lessionModel.getExercise() != null){ %>
						<li>
                            <a target="blank" href="/MVC/<%=lessionModel.getExercise()%>?lessionID=<%=request.getParameter("lessionID")%>">Bài tập: <%=lessionModel.getLessionName()%></a>
                        </li>
						
						<%} %>
                    </ul>        
                </div>     
            </div>
            <div class="col-xl-4">
                <div class="inner-sidebar">
                    <div class="inner-header">
                        <h3>
                            <i class="fa fa-fw fa-list"></i>
                            <%=partModel.getPartName() %>
                        </h3>
                    </div>
                    <div class="inner-content">
                        <div class="inner-wrap">
                            <div id="lectures-list" class="block-content block-content-sm px-0" data-height="0px"
                                data-toggle="slimscroll" data-always-visible="true">
	<%for(LessionModel lessionModel2 :lessionModels){ %>
							     <div class="list-group">
							     	<%if(lessionModel2.getVideo() != null){ %>
                                    <a class="list-group-item list-group-item-action border-0 " href="/MVC/course/course-detail/learn?lessionID=<%=lessionModel2.getLessionID()%>">
                                        Bài giảng <%=lessionModel2.getOrderNumber() %>: <%=lessionModel2.getLessionName() %>
                                    </a>
                                    <%} %>
                                </div>  
	<%} %>
                            </div>
                            <div class="slimScrollBar"
                                style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                            </div>
                            <div class="slimScrollRail"
                                style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   <!-- <footer> -->
          <%@include file="../re-use/footer.jsp" %>
            </footer>
            <!-- end footer -->

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('hidentop');
                }
                else
                    $('header').removeClass('hidentop');
            });
        });
    </script>
  </body>
</html>