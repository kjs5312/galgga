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
 width: 130px;
 height: 30px;
 border-bottom: 2px solid black;

 
}

.info-find {
  width: 450px;
  height: 300px;
  margin: 200px auto;
  text-align: center;
}

.main-title1 {
  margin-top: 190px;
  font-size: 20px;
}

.main-subtitle1 {
  margin-top: 10px;
}

.id-box{ /* 아이디 입력 */
 
 font-size: 16px;
 width: 450px;
 height: 32px;
 border: solid 1.5px black;
  
}
.id-button{ /* 인증번호 발송버튼 */
width: 455px;
height: 37px;
color: white;
background: #4B5578;
border-radius: 5px;
}

.text-id { /* 아이디를 입력해주세요 칸 */

width: 445px;
height: 32px;
  

}




</style>

<body>
  <script src="script.js"></script>
  
  <div class="box">
  <div class="header">
  <div class="title"><b>비밀번호 찾기</b></div>
  </div>

<div class="info-find">
  <div class="id-box"><b>아이디 입력</b></div> 
  <input type="text" class="text-id" placeholder="아이디를 입력해주세요"/>  
  <button type="submit" class="id-button" onclick="location.href='/galgga/pw_find2.do';">확인</button>
  
</div>
  </div>
 
  
</body>

</html>