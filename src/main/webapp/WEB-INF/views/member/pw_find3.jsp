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


.email{
 width: 90px;
 height: 50px;
}

.title {
 font-size: 20px;
 width: 130px;
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
  margin-top: 20px;
  font-size: 20px;
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

.text-id { /* 이름칸 */
margin-top: 30px;
width: 350px;
height: 20px;

}

.text-email1{
 width: 100px;
 height: 20px;

}
.text-email2{
 width: 100px;
 height: 20px;
  
}

</style>

<body>
  <script src="script.js"></script>
 
  <div class="box">
  <div class="header">
  <div class="title"><b>비밀번호 찾기</b></div>
  </div>

<div class="info-find">
  <img class="email" src="${contextPath}/resources/image/email.jpg" alt="email">
  <div class="main-title1"><b>본인확인 이메일로 인증하기</b></div>
  <div class="main-subtitle1"><b>본인확인 이메일로 인증번호를 발송합니다</b></div>
 <form class="email-form" method="post"> 
      <input type="text" class="text-id" placeholder="이름"/><br>
      <input type="text" class="text-email1" placeholder="이메일"/> @ <input type="text" class="text-email2"/>
      <input type="text" placeholder="직접입력"class="text-email2" /><br><br><br>
  
  <button type="submit" class="email-button" onclick="location.href='/galgga/pw_find4.do';">인증번호 발송</button>

  
</div>
  </div>
</body>

</html>