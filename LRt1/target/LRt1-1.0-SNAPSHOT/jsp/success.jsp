<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>success</title>
	<style>
	    body {
	      display: flex;
	      min-height: 100vh;
	      margin: 0;
	    }
	
	    .success {
	      height: 18vh;
	      width: 25vw;
	      line-height: 18vh;
	      margin: auto;
	      font-size: 2.4em;
	      text-align: center;
	      letter-spacing: 0.3em;
	      background-color: rgba(255, 255, 255, 0.815);
	    }
        .to_correctMain{
            font-size: 30px;
            text-align: center;
            color: #008CBA;
        }
	
	    #background_video {
	      overflow: hidden;
	      width: 100%;
	      position: fixed;
	      z-index: -1;
	    }
    </style>
</head>

<body>
  <div class="success">

      <div>登录成功</div>
      <a href="correct_main.jsp" class="to_correctMain">前往纠错系统</a>
  </div>

  <video  id="background_video" muted loop autoplay>
    <source src="../images/starbroken.mp4" type="video/mp4" />
  </video>
</body>
</html>