<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <!-- <link rel="stylesheet" href="assets/css/base.css">
  <link rel="stylesheet" href="assets/css/style.css"> -->
  <title>Study TOIEC</title>
</head>

<body>
  <body>
    <style>
  	
        @import url('https://fonts.googleapis.com/css2?family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap');
  :root
  {
      --color-one:  #0EDC8D;
      --color-two: #04182B;
      --color-text: #888886;
      --font: 'Inria Serif', serif; 
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
      font-family: "Poppins", sans-serif;
  }
          /* header */
  
  .container {
      max-width: 1296px;
  }
  .header{
      box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
  }
  .header-top{
      background-color: var(--color-one);
      color: var(--color-two);
      font-size: 18px;
      padding: 8px;
      text-align: center;
  }
  
  .header-main .inner-wrap{
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 24px 0;
  }
  
  .header-main .inner-logo img{
      height: 48px;
      width: auto;
  }
  
  .header-main .inner-logo a{
      color: var(--color-one);
      display: flex;
      align-items: center;
  }
  
  .header-main .inner-logo span{
      font-size: 22px;
      font-weight: 600;
  }
  
  .header-main .inner-box {
      display: flex;
      align-items: center;
  }
  
  .header-main .inner-box .button {
      margin-left: 30px;
  }
  
  .header-main .inner-menu ul{
      list-style-type: none;
      padding: 0;
      margin: 0;
      display: flex;
  }
  
  .header-main .inner-menu ul li{
      margin-left: 17px;
      margin-right: 17px;
  }
  
  .header-main .inner-menu ul li a{
      color: var(--color-two);
      font-size: 17px;
      font-weight: 600;
  }
  
  .header-main .inner-menu ul li a:hover {
      color: var(--color-one);
  }
  
  .header-main .inner-contact{
      font-size: 18px;
      color: var(--color-one);
  }
  
  .header-main .inner-social ul{
      list-style-type: none;
      padding: 0;
      margin: 0;
      display: flex;
  }
  
  .header-main .inner-social ul li{
      margin-left: 10px;
      margin-right: 10px;
  }
  
  .header-main .inner-social li a {
      color: var(--color-one);
      font-size: 22px;
  }
  /*end header */
  
  /* button */
  .button{
      background-color: var(--color-text);
      color: #fff;
      padding: 10px 10px;
      font-size: 17px;
      font-weight: 600;
      border-radius: 10px;
      border: solid 2px var(--color-text);
      display: inline-block;
  }
  
  .button:hover{
      color: var(--color-text);
      background-color: #fff;
  }
  
  .button-one{
      background-color: var(--color-one);
      border-color: var(--color-one);
  }
  
  .button-one:hover{
      color: var(--color-one);
  }
  
  .button-two{
      background-color: var(--color-two);
      border-color: var(--color-two);
  }
  
  .button-two:hover{
      color: var(--color-two);
  }
  /*end button */
  
  /*section-login*/
    .section-login{
      padding: 120px 0px;
      background-color: #FAFAFA ;
    }
    .section-login .container{
      max-width: 960px;
    }
    .section-login .container .form-login{
      background-color: #fff;
      margin: 0px 159px;
      padding: 50px;
      border-radius: 15px;
    }

    .section-login .container .form-login .title{
      color: #04182B;
      font-size: 30px;
      line-height: 1.42;
      font-weight: 600;
      margin-bottom: 25px;  
    } 
    .section-login .container .form-login .form-group{
      margin-bottom: 25px;
    }  
    .section-login .container .form-login .form-control{
      font-size: 1.6rem;
      font-size: 13px;
      padding: 20px;
    }
    .section-login .container .form-login .form-group{
      margin-bottom: 25px;
    }  
    .section-login .container .form-login .button-login{
      display: block;
      margin-top: 40px;
      width: 100%;
      /* color: #000; */
    }  
    
     .form-control:focus {
 		 border-color: var(--color-one); /* Màu của border khi focus */
  		 box-shadow: 0 0 0 0.2rem rgba(0, 255, 255, 0.25); /* Đổ bóng khi focus */
  }
	.section-login .container .form-login .outer-link{
    text-align: center;
    margin-top: 20px;
    color: var(--color-two);
    font-weight: 500;
    margin-bottom: 0;
  }
  .section-login .container .form-login .outer-link a{
    color: var(--color-one);
    font-weight: 600;
  }	
  /*section-login*/
</style>
  <!-- header -->
  <header class="header">
    <div class="header-main">
      <div class="container">
        <div class="inner-wrap">
          <div class="inner-logo">
            <a href="#">
              <img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/433753477_1478956322991228_8817898143870258149_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOQ56a-PhYUvmg0U6zPAXD66iRjloPIg_rqJGOWg8iD5T35I3AeoGiHZnS-gexmUk8wy4flOwyMiI4q1HxpQTc&_nc_ohc=th6U7HCRyugAb4g9_EP&_nc_ht=scontent.fdad2-1.fna&oh=03_AdVriVWV4qHki7K7WO-GATc15X6Hf5KtCJKNTChvo4ZE3g&oe=66378D9F" alt="LOGO">
                 
            </a>
          </div>
          <div class="inner-box">
            <div class="inner-menu">
              <ul>
                <li>
                  <a href="">
                    Trang Chủ
                  </a>
                </li>
                <li>
                  <a href="#">
                    Khóa Học
                  </a>
                </li>
                <li>
                  <a href="#">
                    Đề Thi
                  </a>
                </li>
                <li>
                  <a href="#">
                    Từ Vựng
                  </a>
                </li>
              </ul>
            </div>
            <div class="inner-button">
              <a href="login">
                <button class="button button-one">Đăng Nhập</button>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- end header -->

  <!-- section-login -->
  <div class="section-login">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="form-login">
            <h4 class="title">Đăng Nhập</h4>  
            <form method="post">
              <div class="form-group">
                <label for="exampleFullName1">Tên Đăng Nhập</label>
                <input name="email" type="text" class="form-control" id="exampleFullName1" aria-describedby="emailHelp">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Mật Khẩu</label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1">
              </div>
              <button class="button button-two button-login">Đăng Nhập</button>
              <p class="outer-link">Chưa có tài khoản? 
              <a href="register">Đăng kí</a>
            </p> 
            </form>    
          </div>  
        </div>
      </div>
    </div>
  </div>
  <!-- end section-login -->
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
  </script>
</body>

</html>