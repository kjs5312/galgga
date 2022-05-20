<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 선택 창</title>
<style>
	.main{
	width: 712px;
	margin: auto;

	
	}

    .addMemberText{

    width: 140px;
    height: 45px;
		margin-left:80px;
		margin-top:50px;
    
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 36px;
    
    color: #000000;
    }
    
    .normalUser{

    width: 650px;
    height: 260px;
	margin: auto;
    
    background: #FFFFFF;
    border: 0.2px solid #000000;
    box-sizing: border-box;
    }
    .normalUserAdd{
    	margin: auto;
		width: 140px;
		height: 80px;
    }
    .normal{
	  margin: auto;
      width: 120px;
      height: 45px;

      
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 30px;
      line-height: 36px;
      text-align: center;
      
      color: #000000;
    }
    .normal1{
	  margin: auto;

      width: 120px;
      height: 18px;

      
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 15px;
      line-height: 18px;
      text-align: center;
      
      color: #000000;

    }
    .myButton {
    	box-shadow: 0px 0px 0px 2px #4f5f8c;
    	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
    	background-color:#6f88b3;
    	border-radius:10px;
    	border:1px solid #6880c7;
    	display:inline-block;
    	cursor:pointer;
    	color:#ffffff;
    	font-family:Arial;
    	font-size:20px;
    	font-weight:bold;
    	padding:15px 30px;
    	text-decoration:none;
    	text-shadow:0px 0px 0px #283966;

    	
    }
    .myButton:hover {
    	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
    	background-color:#4b5578;
    }
    .myButton:active {
    	position:relative;
    	top:1px;
    }
    .normalButton{
		width: 150px;
		margin: auto;
		margin-top: 20px;
    }
    
	.businessPersonAdd{
		margin: auto;
		width: 120px;
		height: 80px;
	}
    .businessPerson{
     margin: auto;
     margin-top: 100px;
     
      width: 650px;
      height: 260px;      
      background: #FFFFFF;
      border: 0.2px solid #000000;
      box-sizing: border-box;
    }
    .business{
		margin: auto;
      width: 220px;
      height: 45px;

      
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 30px;
      line-height: 36px;
      text-align: center;

      color: #000000;
    }
    .business1{
		margin: auto;

      width: 220px;
      height: 45px;

      
      font-family: 'Inter';
      font-style: normal;
      font-weight: 400;
      font-size: 15px;
      line-height: 36px;
      text-align: center;
      
      color: #000000;

      
    }
  </style>
</head>
<body>


<div class="main">
 <div class="addMemberText">회원 가입</div>
  
  <div class="normalUser">
    <div class="normalUserAdd"><img class="normalUserAdd" src="${contextPath}/resources/image/normal.JPG" alt="일반회원"/></div>
      <div class="normal">개인회원</div>
      <div class="normal1">만 14세 이상</div>
      <div class="normalButton">
      		<a href="${contextPath }/member/addMemberWrite.do" class="myButton">회원 가입</a>
      </div>
  </div>

    <div class="businessPerson">
    <div  class="businessPersonAdd"><img class="businessPersonAdd" src="${contextPath}/resources/image/businessPerson.JPG" alt="사업자 회원"/></div>
      <div class="business">사업자 회원</div>
      <div class="business1">사업자 등록증을 보유한 회원</div>
      <div class="normalButton">
      <a href="${contextPath }/member/addbusinessperson.do" class="myButton">회원 가입</a>
      </div>
  </div>
  </div>


</body>
</html>