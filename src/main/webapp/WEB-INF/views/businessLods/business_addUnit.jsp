<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<% int lod_id = Integer.parseInt(request.getParameter("lod_id")); %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 파일 업로드 부분 -->
<script>









var cnt1=0;
function fn_addFile1(){
	  if(cnt1 == 0){
		  $("#d_file1").append("<br>"+"<input  type='file' name='unit_img_main' id='f_main_image' />");	  
	  }else{
		  $("#d_file1").append("<br>"+"<input  type='file' name='unit_img_common"+cnt1+"' />");
	  }
	
	cnt1++;
}






</script>

<script>
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});

</script>




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
  /*----------------------------rightBox-------------------------  */
	.tab-wrapper {
  margin: 60px auto;
  width: 600px;
  
}

.tab-menu li {
  position:relative;
  background-color: #fff;
  color:#bcbcbc;
  display: inline-block;
  padding: 20px 40px;
  opacity: 0.8;
  cursor:pointer;
  z-index:0;
}

.tab-menu li:hover {
  color:#464646;
}

.tab-menu li.active {
  color:#464646;
  opacity: 1;
}

.tab-menu li.active:hover {
  color:#464646;
}

.tab-content>div {
  background-color: #fff;
  box-sizing:border-box;
  /* width: 100%; */
  padding: 50px;   
  min-height:200px;
}

.info_input{
	width: 200px;
	height: 18px;
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
	margin-left: 40%;
	
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

<meta charset="UTF-8">
<title>숙소 등록창</title>
</head>
<body>





<div class="businessMainBox">
	
	<div class="businessSubBox">

		<div class="pageName">사업자
		<p class="line"/>
		</div>

			<div class="leftMenu">
				<div class="textBox"><a class="text" href="#">숙소 등록</a><br></div>
				<div class="textBox"><a class="text" href="#">숙소 관리</a><br></div>
				<div class="textBox"><a class="text" href="#">Q & A 관리</a><br></div>
				<div class="textBox"><a class="text" href="#">리뷰 관리</a><br></div>
				<div class="textBox"><a class="text" href="#">예약 확인</a><br></div>
				<div class="textBox"><a class="text" href="#">상품 찜</a><br></div>
				<div class="textBox"><a class="text" href="#">장바구니</a><br></div>
				<div class="textBox" style="border: 0px;"><a class="text" href="#">주문 내역<br>조회</a><br></div>
			</div>
		</div>
<!-- ------------------------------------------------------------------------------------  -->	
	<div class="businessRightBox">
		<div class="pageName_1">Business</div>
		<div class="pageName_2" >객실 등록</div>
		
<form action="${contextPath}/businessLods/addNewUnits.do" method="post" enctype="multipart/form-data">

<div class="tab-wrapper">
  
  <ul class="tabs">
    <li><a href="#tab1">객실 기본 정보</a></li>
    <li><a href="#tab2">객실 소개</a></li>
    <li><a href="#tab3">객실 이미지</a></li>
  </ul><br>
  
  <div class="tab_container">
    <div class="tab_content" id="tab1">
    <input type="hidden" name="lod_id" value="<%= lod_id %>">
    
					<!-- ----------------객실--------------------- -->
		<table style="border-top: 2px solid #000000;" id="unitTable">
			<tr><td style="text-align: center;"colspan="2">객실</td></tr>
			<tr>
				<td>객실 이름</td>
				<td><input name="unit_name" type="text" style="width:272px;"></td>
				
			</tr>
			<tr>			
				<td >객실 카테고리</td>
				<td>
					<select name="unit_category" style="width:280px; text-align: center;">
						<option value="camping">캠핑</option>
						<option value="car">차박</option>
						<option value="caravan">카라반</option>
						<option value="glamping">글램핑</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>객실 면적</td>
				<td><input name="unit_extent" type="text" style="width:272px;"></td>
			</tr>
			<tr>
				<td>객실 가격</td>
				<td><input name="unit_price" type="text" style="width:272px;"></td>
			</tr>
			<tr>
				<td>기준 수용 인원 (명)</td>
				<td><input name="min_p" type="text" style="width:272px;"></td>
			</tr>
			<tr>
				<td>최대 수용 인원 (명)</td>
				<td><input name="max_p" type="text" style="width:272px;"></td>
			</tr>
			</table>
			
			
			<table id="unitTable1"></table>
			
			
			</div>
			
			
    <!--  ---------------------------------------------------------------------------- -->
    <div class="tab_content" id="tab2">

		<table>			
			<tr>
				<td style="width: 95px;">객실 소개</td>
				<td><textarea name="unit_info" rows="20" cols="50"></textarea>
			</tr> 
		</table>
		<table id="unitInfoTable"></table>
		
	</div>
	
	
	
	<!-- ----------------------------------------------------------------------------------- -->
	
	
    <div class="tab_content" id="tab3">
	   	<br>
	   	
	    <table>
	   		<tr>
	   			<td><input type="button" value="이미지 추가" onClick="fn_addFile1()"/>&nbsp; 객실 이미지 첨부</td>
	   		</tr>
	   		<tr>
	   			<td><a>메인 이미지는 한장만 가능합니다</a>
	   		</tr>
	   		<tr>
	   		<td><div id="d_file1"></div></td>
	   		</tr>
	   	</table>
	   	
	   	<table id="unitImgTable"></table>
	   	
	   	
    </div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->
<button class="myButton" value="숙소등록">숙소 등록</button>
</form>



</div>

</div>



</body>
</html>