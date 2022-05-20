<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	var quickBox = $(".quickmenu1");
	var quickTop = parseInt(quickBox.offset().top);
	$(window).scroll(function(){
		var scTop = Math.max(document.documentElement.scrollTop,document.body.scrollTop);
		quickBox.stop();
		quickBox.animate({"top":scTop + quickTop}, 300);
	});
});
</script>
<style>
.quickmenu1 {
	top:140px;
	left:1350px;
	padding: 10px 5px;
	position: absolute;
    width: 180px;
    height: 508px;      
    background: #FFDE8A;
    border-radius: 18px;
    }

    .ping7 {
      width: 170px;
      margin:5px;
      border-radius: 10px;
    }

    .quickmenu2 { /* 최근본 숙소 */
      width: 168.26px;
      margin:10px auto; 
      font-size: 14px;      
      
      background: #FFF1D7;
      border-radius: 10px;
      text-align: center;
    }
    
    .text3 { /* 최근본 숙소 폰트사이즈*/
      font-size: 20px;
      text-align: center;
      
    }

    .quickmenu3 { /* date1,2 달력 */
    width: 168.54px;
    margin:10px auto;
    font-size: 12px;      
    background: #FFF1D7;
    border-radius: 7px;
    }


  .quickmenu4 {  /* 지역 */
    width: 168.54px;
    background: #FFF1D7;
    border-radius: 7px;
    margin:10px auto;
    text-align:center;
  }

  .quickmenu5 { /* 인원 수 */
    width: 168.54px;
    margin:10px auto;
    background: #FFF1D7;
    border-radius: 7px;
    text-align:center;
  }

  .quickmenu6 { /* 캠핑 글램핑 차박 카라반 */
    width: 168.54px;
    margin:10px auto;
    background: #FFF1D7;
    border-radius: 7px;
  }

    
  .quickmenu7 { /* 검색하기 */
    width: 80px;
    margin: auto;
    height: 27px;
    text-align: center;    
    background: #FFDE8A;
    border-radius: 20px;
  } 
  
.date1 { /* sidebox4 텍스트 03월 31일 ~ 04월 01일 1박 */
      width: 100px;
      left: 4.04px;
      top: 5.5px;
      font-size: 12px; 
      text-align: center;
      margin-left: 10px;
      margin-top: 1.5px;
      background:#FFF1D7;
      border-color:#FFF1D7;
      border-radius: 5px;
    }
.date2 { /* sidebox4 텍스트 03월 31일 ~ 04월 01일 1박 */
    width: 100px;
    left: 4.04px;
    top: 5.5px;
    font-size: 12px; 
    text-align: center;
    margin-left: 50px;
    margin-top: 1.5px;
    background:#FFF1D7;
    border-color:#FFF1D7;
    border-radius: 5px;
}
    .text5 { /* sidebox5 지역 */
      height: 22px;
      font-size: 12px;  
      background:#FFF1D7;
      border-radius: 5px;
      margin: 0px auto 2.5px auto;
    }

    .text6 { /* sidebox6 인원 명*/
      font-size: 12px;
      background:#FFF1D7;
      border-radius: 5px;
      margin: 0px auto 2.5px auto;
    }

    .text7 { /* sidebox7 캠핑 글램핑 차박 카라반 */
      margin: 0px auto 2.5px auto;
      font-size: 12px; 
      border-align: center;  
    }

    .side-cg { /* sidebox7 캠핑 글램핑 차박 카라반 */
      margin-top: 9px;
      text-align: center;
    }

    .text8 { /* sidebox8 검색 하기 */
      font-size: 12px; 
      text-align: center;
      background:#FFF1D7;
      border-color:#FFF1D7;
      border-radius: 5px;
      margin:0px auto;
    }
</style>

</head>
<body>
<div class="quickmenu1">
	<a href="${contextPath }/lodge/campingMain.do">
    <img class="ping7" src="${contextPath}/resources/image/ping1.jpg" alt="최근 본 숙소"></a>

  <div class="quickmenu2">
      <div class="text3">최근 본 숙소</div><br>
      숙소이름: 너도 와<br>
      위치: 강원도<br>
      1박 2일 기준 : <br>
      최소 2인 최대 4인<br>
      8,0000원
  </div>

  <div class="quickmenu3"> 
      <input type="date" class="date1"> <b>~</b> <input type="date" class="date2"> 
  </div>


  <div class="quickmenu4">
    <select class="text5" name="지역">
      <option value="">지역선택</option>
      <option value="경기도">경기도</option>
      <option value="강원도">강원도</option>
      <option value="충청북도">충청북도</option>
      <option value="충청남도">충청남도</option>
      
    
    </select>
  </div>

  <div class="quickmenu5">
     <select class="text6" name="인원 수">
       <option value="">인원 수 선택</option>
       <option value="2명">2명</option>
       <option value="3명">3명</option>
       <option value="4명">4명</option>
       <option value="5명">5명</option>
       <option value="6명">6명</option>
       <option value="7명">7명</option>
       <option value="8명">8명</option>
       <option value="9명">9명</option>
       <option value="10명">10명</option>
     </select>
  </div>

  <div class="quickmenu6">
    <div class="side-cg">
    캠핑<input type="checkbox">
    글램핑<input type="checkbox"><br>
    차박<input type="checkbox">
    카라반<input type="checkbox"></div>
  </div>
  
  <div class="quickmenu7">
    <button type="button" class="text8" onclick="">검색하기</button>
  </div>
 </div>
</body>
</html>