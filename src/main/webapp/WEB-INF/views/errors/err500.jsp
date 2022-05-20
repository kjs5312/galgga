<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.mainBox{
width: 720px;
margin:auto;


height: 400px;
}
.err{
width: 500px;
padding-top: 40px;
margin:auto;
margin-top: 80px;
font-size:30px;
border: 1px solid #ffffff;
}



.button{
	  margin-left: 230px;
		margin-top: 100px;
      width: 500px;
	
    }
    .myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:10px;
	border:1px solid #6880c7;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:18px;
	font-weight:bold;
	padding:14px 45px;
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

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<div class="mainBox">
<div class="err">
Error code 500이(가) 발생했습니다.
</div>
	
	
	
	<div class="button">
    	<a href="/galgga/main/main.do" class="myButton">main으로 돌아가기</a>
    </div>


</div>



<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>