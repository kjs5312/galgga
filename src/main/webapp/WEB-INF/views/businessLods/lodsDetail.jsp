<%@page import="com.galgga.Lod.vo.UnitImgFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="lod" value="${lodsDetailMap.lodVO}"/>

<c:set var="lodComImg" value="${lodsDetailMap.lodComImgList }"/>


<c:set var="unit" value="${unitsDetailMap.unitVO}"/>
<c:set var="unitImg" value="${unitsDetailMap.unitImgList }"/>

<!DOCTYPE html>
<html>
<head>


<link href="${contextPath}/resources/css/accodian.css" rel="stylesheet"/>


<meta charset="UTF-8">
<title>객실 선택</title>
<script>
function reserve(){


	document.getElementById("reserve").submit();
	
}






</script>



<style>
      a{
      text-decoration: none;  
      }    
      .mainBody{
      height: auto;
      }
    /*-----------이미지, 인포--------*/
    .camping{
      padding: 7px;
      padding-left: 8px;
      border: 1px solid #000000;
      height: auto;
      width: 700px;
	
      margin: auto;
      margin-bottom: 8px;
    }
    #campingMain{
      height: 175px;
      width: 335px;
      float: left;
    }
    #campingName{
      font-size: 18px;
      font-weight:bold;
      margin: 5px;
      display: block;
    }
    .address{
     font-size: 15px;
      padding-left: 5px;
    }
    .address1{
      font-size: 15px;
      padding-left: 40px;
    }
    /*-----------예약 날짜---------*/
    .reservationDate{
      padding-top: 7px;
      padding-left: 15px;
      height: 35px;
      width: 650px;
      border: 1px solid #000000;
      border-radius:10px;

      font-size: 18px;
      margin: auto;
      margin-bottom: 8px;
    }
    .reserveDate{
      font-size: 18px;
      border-radius:10px;
      padding-left: 45px;
    }
    
    /* -----------------------------성인 아동 ---------*/
    .human, .text{
      font-size: 20px;
      padding-top: 4px;
    }
     .number{
      
      padding-left: 15px;
      padding-top: 5px;
      
      height: 38px;
      width: 650px;
      border: 1px solid #000000;
      border-radius:10px;
      
      margin: auto;
      margin-bottom: 8px;
		}
    
    #adult, #child{
      border: 1px solid #000000;
      width:100px;
        height:26px;
       text-align:center;
       vertical-align: middle;
        padding-top:9px;
        margin: 0px 14px; 
        border-radius:8px;
      }

		.text{
			height:25px;
      width: 100px;
      text-align: center;
      font-size: 17px;
			border:1px solid #ddd;
			border-radius:4px;
      display: inline-block;
      
    }

 #plus, #minus, #plus1, #minus1{
 width:30px;
 font-size: 20px;
 text-weight: bold;
 cursor: pointer;
 }


/*------------------------객실 선택 ---------------  */



    .roomName, .optionSelect{
      font-size: 17px;
      height: 28px;
      
    }
    
    
    .myButton {
	box-shadow: 0px 0px 0px 2px #4f5f8c;
	background:linear-gradient(to bottom, #6f88b3 5%, #4b5578 100%);
	background-color:#6f88b3;
	border-radius:7px;
	border:1px solid #6880c7;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:4px 7px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
  float: right;
  margin-top: 3px;
  margin-left: 320px;
}
.myButton:hover {
	background:linear-gradient(to bottom, #4b5578 5%, #6f88b3 100%);
	background-color:#4b5578;
}
.myButton:active {
	position:relative;
	top:1px;
}

    
  .roomSelec{
    padding-top: 7px;
    padding-left: 15px;
    width: 650px;
    height: 38px;
    border: 1px solid #000000;
    font-size: 20px;
   	display: flex;
    border-radius:10px;
    margin: auto;
    margin-bottom: 8px;
  }


    /*------------------main------------------*/
    .main{
    width: 712px;
    height: auto;
    margin: auto;
  
    }
    .cate{
      display: inline-block;
    }
    
  .myButton1 {
	border:1px solid #000000;
	cursor:pointer;
	color:#000000;
	font-size:20px;
	font-weight:bold;
  	text-align: center;
	text-decoration:none; /*밑줄 제거*/
	width: 175px;
	height: 42px;
	float: left;
	line-height: 44px;
  }
  
  
  .myButton1:hover {
	background-color:#E1DFDF;
  }
  .myButton1:active {
	position:relative;
	top:1px;
  }

    .roomlist{
      font-size: 18px;
      font-weight:bold;
      margin: 15px;
    }
  .room{
    margin-top: 10px;
    border: 0.4px solid #000000;
    width: 669px;
    height: auto;
    margin: 20px;
      
  }

    .room_img{
      width: 212px;
      height: 100px;
      margin: 5px 5px;
      float: left;
      z-index: 2;
    }
    .siteName{
      font-size: 20px;
      font-weight:bold;
    }
    .room_info{
      
    }
    .price{
      float: right;
      margin-right: 10px;
      font-size: 20px;
    }
    
    .roomAdd{
        padding-top: 7px;
    padding-left: 15px;
    width: 650px;
    height: 38px;
    margin:auto;
    }
  </style>

	
</head>
<body>


<div class="mainBody">
<form id="reserve" action="${contextPath}/order/camping_pay.do" method="post">

  <div>
    <div class="camping">
	<div class="container">
	<a class="prev" onclick="plusSlides(-1)">❮</a>
	<c:forEach var="lodCom" items="${lodComImg}" varStatus="common">

	  <div class="mySlides">
	    <img id="campingMain" src="${contextPath}/lodThumbnails.do?lod_id=${lod.lod_id}&lod_imgName=${lodCom.lod_imgName}">
	  </div>
	  
	
		</c:forEach>
		  <a class="next" onclick="plusSlides(1)">❯</a>
		  
		  
	  <div class="row" style="dsiplay:flex; width:335px;, height: 77px;">
	  	<c:forEach var="lodCom" items="${lodComImg}" varStatus="common" >
	  
	    <div class="column">
	      <img class="demo cursor" src="${contextPath}/lodThumbnails.do?lod_id=${lod.lod_id}&lod_imgName=${lodCom.lod_imgName}" style="width:100%" onclick="currentSlide(${common.index}+1)" alt="숙소">
	    </div>
	    </c:forEach>
	  </div>
  
  
</div>
   
    
    
    <div style="display:inline-block; width: 330px; margin-top: -80px;">
	    <div id="campingName">${lod.lod_name}</div><br> 
	    <span>
	    <a class="address">캠핑지 주소 :</a><br>
	    <a class="address1">&nbsp; &nbsp; ${lod.lod_address }</a><br><br>
	    <span style="display : block; width: 335px; ">${lod.lod_info }</span>
  		</span>
    </div>
    
    </div>
    
    
    
    
    
    <div class="reservationDate">
      <span class="reservBox">예약 날짜 &nbsp; : &nbsp;
      <span><input class="reserveDate" type="date" name="checkIn_date"></span> &nbsp; &nbsp; / &nbsp; &nbsp;
      <span><input class="reserveDate" type="date" name="checkOut_date"></span>
      <span></span>
        </span>
    </div>    
  </div>

	<input type="hidden" name="lod_id" value="${lod.lod_id }">
	<input type="hidden" name="lod_name" value="${lod.lod_name }">

  
  
  
  <div class="number">
    <div class="box" style="display: flex">
    <div style="display: flex;">
    <div style="font-size:20px;">성인</div> &nbsp; &nbsp;
			<div id="input_div">
				    <input type="button" value="-" id="minus">
				    	<input type="text" size="1"  value="2" id="count" name="adult">
				    <input type="button" value="+" id="plus">
			</div>
	</div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	    <div style="font-size:20px;">아동</div> &nbsp; &nbsp;
			<div id="input_div">
				    <input type="button" value="-" id="minus1">
				   		 <input type="text" size="1"  value="0" id="count1" name="child">
				    <input type="button" value="+" id="plus1">
			</div>
	</div>

    </div>
 







  <div class="roomSelec">
    <span>객실이름 : </span> &nbsp;
    
    <select class="roomName" ID="roomName" name="unit_name">
    <c:forEach var="unit_name" items="${unit}" varStatus="price">
	      <option value="${unit_name.unit_name}">${unit_name.unit_name}</option>
	      
    </c:forEach>
    </select><br>
    
    
   <span><a class="myButton" onclick="return reserve()">예약 하기</a></span>
  </div>

	</form>
  
  <div class="main">
    <div class="cate">
    	<span><a href="#" class="myButton1">객실목록</a></span>
    	<span><a href="#" class="myButton1">Q & A</a></span> 
	    <span><a href="#" class="myButton1">리 뷰</a></span> 
	    <span><a href="#" class="myButton1">환불 안내</a></span>
	</div>

    <div class="roomlist">객실목록</div>
	<c:forEach var="unit" items="${unit}" varStatus="status">
	<div class="faq">
		  <div class="room" >
		  	<label for="accodian" style="cursor: pointer;">
			  <img class="room_img" src="${contextPath}/unitThumbnails.do?lod_id=${lod.lod_id}&unit_id=${unit.unit_id}&unit_imgName=${unitImg[status.index].unit_imgName}">
			  <button class="accordion" id="accodian">
			  <div>
				    <span class="siteName">${unit.unit_name }</span><br>
				    <span class="category">${unit.unit_category} &nbsp; &nbsp;</span> <span class="roomInfo">면적 : ${unit.unit_extent }<br>
				    기준인원 ${unit.min_p} 명 / 최대가능인원 ${unit.max_p} 명</span>
				    <span class="price">${unit.unit_price}원</span>
			  </div><br>
			  </label>
			  </button>
			  <div class="panel" style="padding-bottom: 0px;">
  					 <span style="width: 620px;">${unit.unit_info}</span>
				</div>
			   
		  </div>
		 
		  </div> 
	</c:forEach>
  </div>
  
   <div class="roomAdd" style="padding: 6px 7px;"><a href="${contextPath}/businessLods/business_addUnit.do?lod_id=${lod.lod_id}" class="myButton">객실 추가 하기</a></div>
  </div>




<!--  -->











<script src="${contextPath}/resources/js/accodian.js"></script>
</body>
</html>