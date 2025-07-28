<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pbl3.model.UserModel"%>
<header class="header">
	<div class="top-header">
		<div class="container">
			<div class="inner-wrap">
				<div class="inner-contact">
					<ul>
						<li><span>Following Us On:</span></li>
						<li><a href="https://www.facebook.com/Anhvubro/"
							target="_blank"> <i class="fa-brands fa-facebook-f"
								target="_blank"></i>
						</a></li>
						<li><a href="#" target="_blank"> <i
								class="fa-brands fa-twitter"></i>
						</a></li>
						<li><a href="#" target="_blank"> <i
								class="fa-brands fa-instagram"></i>
						</a></li>
					</ul>
				</div>
				<%UserModel userModel = (UserModel) session.getAttribute("user");%>
				<div class="inner-button">
					<%if(userModel == null){%>
					<a href="/MVC/register">Create an Account</a>
					<%}
					if (userModel == null) {%> <a href="/MVC/login"
						class=" button button-one">Log In</a>
					<% }	
          else {%>
					<a href="/MVC/logout" class=" button button-one">Log Out</a>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<div class="main-header">
		<div class="container">
			<div class="inner-main">
				<div class="inner-logo">
					<a href="/MVC/"> <img
						src="/MVC/data/logo.png"
						alt="logo">
					</a>
				</div>
				<div class="inner-menu">
					<ul>
						<li><a href="/MVC/" class="trang-chu"> Trang Chủ </a></li>
						<li><a href="/MVC/courses" class="khoa-hoc"> Khóa Học </a></li>
						<li><a href="/MVC/tests" class="de-thi"> Đề Thi </a></li>
						<li><a href="/MVC/vocab-lists" class="tu-vung"> Từ Vựng </a>
						</li>
					</ul>
				</div>
				<%if(userModel != null){ %>
				<div class="inner-user">
					<a href="/MVC/my-account">
						<div class="inner-img">
							<img
								src="<%=userModel.getImage() == null ? "https://thumbs.dreamstime.com/b/worried-man-avata-avatar-worried-man-vector-illustration-107469775.jpg" : "/MVC/" + userModel.getImage()%>"
								alt="avatar">
						</div>
					</a>
				</div>
				<%} %>
			</div>
		</div>
	</div>
</header>