<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="value" value="${lodsListValue }" />
<c:set var="reserve" value="${lodsListReserve }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>메인</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
  <style>
	a{
	color: black;
	}

    .main-body { 
      width: 720px;
      height: auto;
      margin: 0px auto;
    }

    .bodybox-text { /* 별점순 ,예약많은순 */
     display: flex;
     margin: 0px auto;
    }

    .text1 { /* 별점순 */
      width: 370px;
      height: 30px;
      font-size: 17px;
      color: #000000;
    }

    .text2 { /* 예약 많은 순 */
      width: 250px;
      height: 30px;
      font-size: 17px;
      color: #000000;
    }
    
    .bodybox1 { 
      margin-right: auto;      
      background: #EFEBEB;
    }
    
    .ping_box {
    margin:10px;
    }
    .ping {
      width: 336px;
      height: 150px;      
    }
    .
 
   
   .ping_title{
   text-align: right;
   font-size: 17px;
   }
    .bodybox2 {
      background: #EFEBEB;
    }
  
    .button-body { /* 숙소 더 보기 */
      text-align: center;
      height: 20px;
      width: 719px;
    }
    
    .camping-button { /* 숙소 더보기 */
    font-size: 15px;
    text-align: center;
    background: #FFF1D7;
    border-color: #FFF1D7;
    border-radius: 5px;
    margin: 40px auto;
    }

  </style>
</head>
  
<body>
  <div class="main-body">
  <div class="bodybox-text">
  	<div class="text1">별점순</div>

  	<div class="text2">예약 많은 순</div>
  </div>
    <div style="display: flex">
  <div class="bodybox1">
  
  <c:forEach var="item" items="${value}">
  
    <div class="ping_box">
	  	<a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${item.lod_id}">
	  	<img class="ping" src="${contextPath}/lodThumbnails.do?lod_id=${item.lod_id}&lod_imgName=${item.lod_imgName}" alt="${item.lod_name }"></a>
	  	<div class="ping_title" style="text-align: right;"> <a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${item.lod_id}">
	  	<b>${item.lod_name}</b>&nbsp; &nbsp;(${item.lod_address})</a></div>
	  	
	  	<div class="ping_price" style="text-align: right;"> <a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${item.lod_id}">
	  	${item.lod_price }원</a></div>
  	</div>
  	
  	</c:forEach>
  	</div>
  
  
  

  <div class="bodybox2">
  
  	<c:forEach var="res" items="${reserve }">
  	
  	<div class="ping_box" >
  	
  	<a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${res.lod_id}">
  	<img class="ping" src="${contextPath}/lodThumbnails.do?lod_id=${res.lod_id}&lod_imgName=${res.lod_imgName}" alt="${res.lod_name }"></a>
	  	<div class="ping_title" style="text-align: right;"> <a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${res.lod_id}">
	  	<b>${res.lod_name}</b>&nbsp; &nbsp;(${res.lod_address})</a></div>
	  		
	  	<div class="ping_price" style="text-align: right;"> <a href="${contextPath}/businessLods/lodsDetail.do?lod_id=${res.lod_id}">
	  ${res.lod_price }원</a></div>
    </div>
    
    </c:forEach>

    
  </div>
  
  
  
  
  
  
  
  </div>
   <div class="button-body">
    <button type="button" class="camping-button" onclick="">숙소 더 보기</button>
    </div>
  
  </div>

  <script src="script.js"></script>
</body>
</html>