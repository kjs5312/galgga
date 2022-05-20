<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>replit</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<style>


.box {
width:1000px;
margin: 0px auto;
}

  
.header {
 width:110px;
 height:30px;
 margin-top: 10px;
 margin-left: 200px;
}

  
.title {
 font-size: 20px;
 widht: 50px;
 height: 30px;
 border-bottom: 2px solid black;

 
}

.info-find {
  width: 460px;
  height: 500px;
  margin: 90px auto;
  text-align: center;
}

.main-title1 {
  margin-top: 210px;
  font-size: 17px;
}

.main-subtitle1 {
  margin-top: 10px;
}
.email-button{ /* 인증번호 발송버튼 */
width: 100px;
height: 37px;
margin-top: 20px;
color: white;
background: #4B5578;
border-radius: 5px;
}

.text-box{
margin-top: 10px;
height: 120px;
border: solid 2px black;
text-align:left;
}

.text-email1{
 width: 200px;
 height: 28px;

}



</style>

<body>
  <script src="script.js"></script>
  
  <div class="box">
  <div class="header">
  <div class="title"><b>아이디 찾기</b></div>
  </div>

<div class="info-find">
  
  <div class="main-title1"><b>회원님의 정보와 일치하는 아이디 목록입니다</b></div>
  <div class="text-box">test01  가입일:2022.04.01<br>test02  가입일:2022.04.03
 
  </div>
   <button class="email-button" onclick="">로그인하기</button>
    &nbsp; &nbsp; &nbsp;<button class="email-button" onclick="">비밀번호 찾기</button>

</div>
  </div>
  
</body>

</html>