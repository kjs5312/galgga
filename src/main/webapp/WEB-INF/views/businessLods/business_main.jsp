<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.businessMainBox{
	 /* border: 1px solid #000000;*/ 
	  width: 720px;
	  height: auto;
	  margin: auto;	
	  padding-bottom: 10px;
	  display:flex;
	}  
  .pageName{
		width: 100px;
		height: 45px;
		font-family: 'Inter';
		font-style: normal;
		font-weight: 400;
		font-size: 28px;
		line-height: 36px;		
		color: #000000;
		margin-left:0px;
		margin-top:0px;
		display: block;
		    
  }
    .line{
		margin-top: 0px;
		margin-bottom: 40px;
      width: 80px;
      height: 0px;
      left: 0px;
      border: 1px solid;

  }
  /*-------------left box------------*/
  	.businessSubBox{
  	  /*border: 1px solid #000000;            */
	  width: 120px;
	  height: auto;
	  padding-bottom: 10px;
  }
  .leftMenu{
     border: 1px solid;
     width: 100px;
  	 height: auto;
  	 text-align: center;
  	 margin:auto;
  	 margin-top: 100px;
  	 margin-right:13px;
  	 padding:3px;
  }
  
  .text{
  font-size: 15px;
  
  text-align: center;
  width: 103px;
  color: black;
  }
  .textBox{
    border-bottom: 1px dashed #000000;
    width: auto;
  	margin: auto;
  	text-align: center;
  	padding:5px;
  }
  
  
  /*--------------AdminRightBox------------*/
  a{
  text-decoration:none;
  }
  
   .businessRightBox{
    /*border: 1px solid #000000;                      */
	  width: 598px;
	  height: 550px;				/*높이 나중에 오토로 변경 예정*/
	  padding-bottom: 10px;
	  display: inlin-flex;
  }
  
  .pageName_1{
  font-weight:bold;
  font-size: 25px;
  margin-bottom: 20px;
  display: flex;
  }

  
  .pageName_2{
  font-weight:bold;
  font-size: 24px;
  margin-bottom: 10px;
 
  }
  /*-------------테이블 ------------  */
table {
  width: 100%;
  border-top: 2px solid #000000;
  border-bottom: 1px solid #000000;

  margin: auto;
  margin-bottom: 40px;
  border-collapse: collapse;
  border-left: non;
  border-right: non;
  }
  th{
  font-size:15px;
  padding-top:10px;
  padding-bottom:10px;
  }
  td{
  font-size:12px;

  }
  th, td {
  border-bottom: 1px solid #000000;
 
  text-align: center;
  }
    th:first-child, td:first-child {
    border-left: none;
    }
    
    
    
    
    /*-----------버튼-----------  */
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
	padding:5px 15px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
	margin-left: 80%;
	
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

	<div class="businessMainBox">
	
	<div class="businessSubBox">

		<div class="pageName">사업자
		<p class="line"/>
		</div>
		
		<div class="leftMenu">
			<div class="textBox"><a class="text" href="${contextPath }/businessLods/business_main.do">숙소 등록</a><br></div>
			<div class="textBox"><a class="text" href="#">숙소 관리</a><br></div>
			<div class="textBox"><a class="text" href="#">Q & A 관리</a><br></div>
			<div class="textBox"><a class="text" href="#">리뷰 관리</a><br></div>
			<div class="textBox"><a class="text" href="#">예약 확인</a><br></div>
			<div class="textBox"><a class="text" href="#">상품 찜</a><br></div>
			<div class="textBox"><a class="text" href="#">장바구니</a><br></div>
			<div class="textBox" style="border: 0px;"><a class="text" href="#">주문 내역<br>조회</a><br></div>
		</div>
		</div>
	
	
	
		<div class="businessRightBox">
			<div class="pageName_1">Business</div>
			<div class="pageName_2" >숙소 등록</div>
			
			<table>
		<thead>
			<tr>
				<th>신청번호</th>
				<th>이름</th>
				<th>대표 카테고리</th>
				<th>등록 날짜</th>
				<th>객실 추가</th>
			</tr>
		</thead>
		
		 <c:choose>
		<c:when test="${empty myLodsList}"> 
		<tbody>
			<tr>
				<td colspan="5">
					등록된 숙소가 아직 없습니다.
					
				</td>
			</tr>
		</tbody>
		 </c:when>
		
		
		<c:otherwise>
		<c:forEach var="item" items="${myLodsList}">
			<tbody>
				<tr>	
					<td><a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${item.lod_id}" style="color: black;">${item.lod_id}</a></td>	
					<td><a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${item.lod_id}" style="color: black;">${item.lod_name}</a></td>
					<td><a>${item.lod_category}</a></td>
					<td><a><fmt:formatDate value="${item.add_date}" pattern="yyyy-MM-dd"/></a></td>
					<td><form action="${contextPath }/businessLods/business_addUnit.do"><input type="hidden" name="lod_id" value="${item.lod_id}"> <button type="submit" style="height: 20px; width: 50px; cursor: pointer;" ></button> </form></td>
				</tr>
			</tbody>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	
	    <div class="button">
    <a href="${contextPath }/businessLods/business_addLod.do" class="myButton">숙소 등록</a>
    </div>
    
    
		</div>
	</div>

</body>
</html>