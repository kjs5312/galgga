<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
window.onload = function(){

	var head_btn = document.getElementById('head_btn');

	if(head_btn != null){
	head_btn.onclick = function(){
		if( confirm("정말 로그아웃 하시겠습니까?")){
		alert("로그아웃되었습니다");
		location.href = '${contextPath}/member/logout.do';
		}
	}
	}

}
</script>
<style>
a {
	text-decoration:none;
}
.head_btn, #head_btn {
	text-decoration:none;
	margin-right:10px;
	color:black;
	font-size:14px;
	background:#FFFFFF;
	border:none;
	cursor:pointer;
}
.nav {
	margin-right:10px;
	float:right;
	color:black;
}
ul {list-style:none;}
li {
	display:list-item;
	float:left;
	
}
#headbox1 {
	position:relative;
	width:720px;
	height:108px;
	margin: 0px auto 20px;
    padding: 0px;
}
.headbox2 {
	position:relative;
	height:70px;
	top:40px;
	background: rgba(119, 192, 161, 0.49);
}
.logo {
	margin-left:10px;
	float:left;
}
.title1 {
	margin-left:10px;
	float:left;
}
.search {
     width: 300px;
    position: relative;
    display: flex;
    margin-left: 400px;
    top: -30%;
    }

.searchTerm {
	width: 100%;
    border: 3px solid #C4C4C4;
    border-right: none;
    padding: 5px;
    height: 20px;
    border-radius: 5px 0 0 5px;
    outline: none;
    color: #C4C4C4;
}

.searchTerm:focus{
    color: #000000;
}

.searchButton {
    width: 40px;
    height: 36px;
    border: 1px solid #C4C4C4;
    background: #C4C4C4;
    text-align: center;
    color: #fff;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
    font-size: 20px;
}

</style>
</head>
<body>
<header>
<div id="headbox1">
	<div class="nav">
		<c:choose>
		<c:when test="${isLogOn==true and not empty memberInfo }">
		<div class="headtext">
			<ul>
				<li><a>${memberInfo.member_name}님 반갑습니다!&nbsp</a></li>
				<li><button id="head_btn" onclick="location.href='${contextPath}/member/logout.do">로그아웃</button></li>
				<li><a class="head_btn" href="${contextPath }/order/reserveChkList.do">마이페이지</a></li>
				<li><a class="head_btn" href="${contextPath }/mypage/1on1QnA">1:1문의</a></li>
				<li><a class="head_btn" href="#"><img width="20" height="20" alt="sitemap" src="${contextPath}/resources/image/camp.jpg" /></a></li>
			</ul>
			</div>
		</c:when>
		
		<c:when test="${isLogOn==true and not empty businessInfo }">
		<div class="headtext">
			<ul>
			<li><a class="head_btn">${businessInfo.business_id}님 반갑습니다!</a></li>
	   		<li><a class="head_btn" href="${contextPath }/businessLods/business_main.do">사업자</a></li>
			<li><button id="head_btn" onclick="location.href='${contextPath}/member/logout.do">로그아웃</button></li>
		</ul>
		</div>
	</c:when>
	<c:when test="${isLogOn==true and memberInfo.member_id =='admin' }">
		<div class="headtext">
		<ul>
			<li><a>${admin_info.admin_id}님 반갑습니다!</a></li>
	   		<li><a class="head_btn" href="${contextPath }/member/adminMain.do">관리자</a></li>
			<li><button id="head_btn" onclick="location.href='${contextPath}/member/logout.do">로그아웃</button></li>
		</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="headtext">
			<ul>
				<li><a class="head_btn" href="${contextPath }/member/loginForm.do">로그인</a></li>
				<li><a class="head_btn" href="${contextPath }/member/selectAdd.do">회원가입</a></li>
				<li><a class="head_btn" href="${contextPath }/mypage/1on1QnA">1:1문의</a></li>
				<li><a class="head_btn" href="#"><img width="20" height="20" alt="sitemap" src="${contextPath}/resources/image/camp.jpg" /></a></li>
			</ul>
			</div>
		</c:otherwise>
		</c:choose>
   	</div>
	<div class="headbox2">
		<div class="logo"><a href="${contextPath }/main/main.do"><img width="96" height="69" alt="logo" src="${contextPath}/resources/image/camping.JPG" /></a></div>
		<div class="title1"><h2>캠핑갈까</h2></div>
    		<div class="search">
      			<input type="text" class="searchTerm" placeholder="숙소검색" >
      			<button type="submit" class="searchButton"><img src="${contextPath}/resources/image/searchlook.png" width="30" height="30" /></button>
      		
    		</div>
	</div>	
</div>
</header>
</body>
</html>