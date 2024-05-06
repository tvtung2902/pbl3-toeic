<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <body>
    	<style>
			<%@include file ="../../assets/css/base.css"%>
 	   		 <%@include file = "../../assets/css/style.css"%>
		</style>
        <style>

            /*section-register*/
            .section-register {
                padding: 120px 0px;
                background-color: #FAFAFA;
            }

            .section-register .container {
                max-width: 960px;
            }

            .section-register .container .form-login {
                background-color: #fff;
                margin: 0px 159px;
                padding: 50px;
                border-radius: 15px;
            }

            .section-register .container .form-login .title {
                color: #04182B;
                font-size: 30px;
                line-height: 1.42;
                font-weight: 600;
                margin-bottom: 25px;
            }

            .section-register .container .form-login .form-group {
                margin-bottom: 25px;
            }

            .section-register .container .form-login .form-control {
                font-size: 1.6rem;
                font-size: 13px;
                padding: 20px;
            }

            .section-register .container .form-login .form-group {
                margin-bottom: 25px;
            }

            .section-register .container .form-login .button-login {
                display: block;
                margin-top: 40px;
                width: 100%;
                /* padding: 10px 209px; */
                /* color: #000; */
            }

            .form-control:focus {
                border-color: var(--color-one);
                /* Màu của border khi focus */
                box-shadow: 0 0 0 0.2rem rgba(0, 255, 255, 0.25);
                /* Đổ bóng khi focus */
                /* Để làm cho nút lớn hơn */
            }

            .section-register .container .form-login .outer-link {
                text-align: center;
                margin-top: 20px;
                color: var(--color-two);
                font-weight: 500;
                margin-bottom: 0;
            }

            .section-register .container .form-login .outer-link a {
                color: var(--color-one);
                font-weight: 600;
            }

            /*section-register*/
        </style>
		<%@include file="re-use/header.jsp" %>

        <!-- section-register -->
        <div class="section-register">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="form-login">
                            <h4 class="title">Đăng Kí</h4>
                            <form method="post">
                                <div class="form-group">
                                    <label for="exampleFullName1">Tên Đăng Nhập</label>
                                    <input name="name" type="text" class="form-control" id="exampleFullName1"
                                        aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword2">Mật Khẩu</label>
                                    <input name="password" type="password" class="form-control"
                                        id="exampleInputPassword2">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword3">Xác Nhận Mật Khẩu</label>
                                    <input name="confirm-password" type="password" class="form-control"
                                        id="exampleInputPassword3">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFullName4">Email</label>
                                    <input name="email" type="text" class="form-control" id="exampleFullName4" aria-describedby="emailHelp">
                                </div>
                                <button class="button-main button-main-two  button-login btn-lg-custom">Đăng Kí</button>
                            </form>
                            <p class="outer-link">Đã có tài khoản?
                                <a href="login">Đăng nhập</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 
        <!-- end section-register -->
        <%@include file="re-use/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
        </script>
    </body>

</html>