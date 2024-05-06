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
    .box {
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
    .row{           
        justify-content: center;
        margin-top: 15rem;
    }
    .head{
        display: flex;
        justify-content: space-between;
        text-align: center;
        margin-bottom: 2rem;
    }
    .head .tiltle{
        margin-right: 8rem;
        font-size: 18px;
        font-weight: 500;
    }
  </style>

  <body>
    <div class="row">
        <div col-12>
            <div class="box">
                <div class="head">
                        <span><i class="fa-solid fa-arrow-left"></i></span>
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
        
                        <button type="submit">Đồng ý</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </body>
</html>