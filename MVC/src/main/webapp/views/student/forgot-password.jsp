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
  <style>
  
@import url('https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
:root
{
    --color-one:  #0EDC8D;
    --color-two: #04182B;
    --color-text: #888886;
    --font: 'Be Vietnam Pro', serif; 
}

a{ 
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}
   
body{
    font-family: var(--font);
    color: var(--color-text);
}   

*{
    font-family: var(--font), sans-serif;
}
a{
 color: var(--color-two);
}
a:hover{
    text-decoration: none;
    color: var(--color-one);
}

.container {
    max-width: 1400px; 
}   
    .box1 {
        background-color: #fff;
        border-radius: 4px;
        box-shadow: 0 3px 10px 0 rgba(0, 0, 0, .14);
        box-sizing: border-box;
        overflow: hidden;
        width: 500px;
        padding-top: 2rem;
        padding-bottom: 2rem;
        padding-left: 3rem;
        padding-right: 3rem;  
    }
    .head1{
        display: flex;
        justify-content: space-between;
        text-align: center;
        margin-bottom: 2rem;
    }
    .head1 .tiltle{
        margin-right: 8rem;
        font-size: 18px;
        font-weight: 500;
    }
    
    <%@include file="../../assets/css/base.css" %>
    <%@include file="../../assets/css/style.css" %> 
    
  </style>

  <body>  
  <%@include file="re-use/header.jsp" %>
    <div class="row" style="justify-content: center;
        margin-top: 15rem;">
        <div col-12>
            <div class="box1">   
            	<%if(request.getAttribute("error") != null){%>
    	<p style="text-align: center; color: red;" ><%=request.getAttribute("error")%></p>
        <%} %> 
                <div class="head1">
                        <a href="/MVC/"><span><i class="fa-solid fa-arrow-left"></i></span></a>
                        <div class="tiltle">              
                            Đặt lại mật khẩu    
                        </div>
                </div>        
                <div class="content">
                    <form action="/MVC/forgot-password" method="post">
                        <div class="form-group">    
                            <label for="email" >Email</label>  
                            <input name="email" type="email" class="form-control" id="email">
                        </div>
        
                        <button type="submit" style="    font-weight: 600;
    background: var(--color-one);
    border: 1px;
    border-radius: 4px;
    width: 100%;
    margin-top: 10px;
    padding: 6px;">Đồng ý</button>
                    </form> 
                </div>
            </div>
        </div>
    </div>
    <%@include file="re-use/footer.jsp" %> 
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>