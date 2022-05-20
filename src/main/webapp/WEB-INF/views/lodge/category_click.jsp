<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
      a{
      text-decoration: none;  
      }    
      .mainBody{
      /* border: 1px solid #000000; */
      width:720px;
      margin: auto;
      }
    /*-----------이미지, 인포--------*/
    .camping{
      padding: 7px;
      padding-left: 8px;
      border: 1px solid #000000;
      height: 190px;
      width: 700px;

      margin: auto;
      margin-bottom: 8px;
    }
    .campingMain{
      height: 175px;
      width: 335px;
      float: left;
    }
    .campingName{
      font-size: 18px;
      font-weight:bold;
      margin: 5px;
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
    .human, .text{
      font-size: 20px;
    }
     .number{
      padding-left: 15px;
      height: 38px;
      width: 650px;
      border: 1px solid #000000;
      border-radius:10px;
      
      margin: auto;
      margin-bottom: 8px;
		}
    
		.minus, .plus{
      cursor:pointer;
			width: 20px;
			height: 30px;
			background:#f2f2f2;
			border-radius:4px;
			
			border:1px solid #ddd;
      display: inline-block;
      text-align: center;
      font-size: 20px;
      margin: 0 auto;
      padding:3px;
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

    .lodName, .optionSelect{
      font-size: 17px;
    }
    
    




    /*------------------main------------------*/

    
  

    .lodlist{
      font-size: 18px;
      font-weight:bold;
      margin: 15px;
    }
  .lod{
    margin-top: 20px;
    border: 0.4px solid #000000;
    width: 669px;
    height: 120px;
    
   	margin:auto;
   	margin: 20px;
      
  }

    .lod_img{
      width: 212px;
      height: 92px;
      margin: 5px 5px;
      float: left;
    }
    .siteName{
      font-size: 20px;
      font-weight:bold;
    }

    .price{
      float: right;
      margin-right: 10px;
      font-size: 20px;
    }
  </style>

</head>
<body>
<div class="mainBody">
    <div class="lodlist">숙소 목록</div>
    
 <div class="lod">
    <a href="/galgga/campingMain.do"><img src="${contextPath}/resources/image/ping1.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/campingMain.do"><div class="siteName">아로니움글램핑</div><br></a>
    <span class="lodInfo">주소 : 인천시 강화군<br></span>
    <span class="price">60,000원~</span>
    </div>
  </div>
  
  
  <div class="lod">
    <a href="/galgga/campingMain.do"><img src="${contextPath}/resources/image/ping2.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/campingMain.do"><div class="siteName">포천 달빛글램핑</div><br></a>
    <span class="lodInfo">주소 : 경기도 포천시<br></span>
    <span class="price">80,000원~</span>
    </div>
  </div>

  <div class="lod">
     <a href="/galgga/campingMain.do"><img src="${contextPath}/resources/image/ping3.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/campingMain.do"><div class="siteName">럭셔리 글램핑 풀빌라</div><br></a>
    <span class="lodInfo">주소 : 경상남도 산청군<br></span>
    <span class="price">100,000원~</span>
    </div>
  </div>
  
  

     <div class="lod">
    <a href="/galgga/campingMain.do"><img src="${contextPath}/resources/image/ping4.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/campingMain.do"><div class="siteName">제천캠핑랜드</div><br></a>
    <span class="lodInfo">주소 : 충청북도 제천시<br></span>
    <span class="price">150,000원~</span>
    </div>
  </div>
  
  

     <div class="lod">
    <a href="/galgga/campingMain.do"><img src="${contextPath}/resources/image/ping5.jpg" class="lod_img"></a>
    <div>
    <a href="/galgga/campingMain.do"><div class="siteName">경주 텐타우스 캠핑글램핑</div><br></a>
    <span class="lodInfo">주소 : 경상북도 경주시<br></span>
    <span class="price">180,000원~</span>
    </div>
  </div>  

  </div> 

</body>
</html>