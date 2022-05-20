package com.galgga.reserve.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.business.main.vo.BusinessVO;
import com.galgga.member.vo.MemberVO;
import com.galgga.reserve.service.ReserveService;
import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;


@Controller("reserveController")
@RequestMapping(value="/order")
public class ReserveControllerImpl  implements ReserveController{
	@Autowired
	private ReserveService reserveService;
	
	private ReserveVO reserveVO;
	private BeforeResVO beforeResVO;
	
	
	 @Override
	 @RequestMapping(value="/haveReserve.do", method = RequestMethod.POST)
	 public ResponseEntity reservation(@ModelAttribute("reserveVO") ReserveVO reserveVO,
			 										HttpServletRequest request, HttpServletResponse response) throws Exception{
		 System.out.println("reserve controller진입쓰");
	 response.setContentType("text/html; charset=UTF-8");
	 request.setCharacterEncoding("utf-8"); String message = null; 
	 HttpSession session=request.getSession();
	 MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo"); 
	 int M_id = (Integer) memberVO.getM_id();
	 session.setAttribute("M_id", M_id);
	 System.out.println(M_id);
	 System.out.println("reserve controller진입쓰");
	 System.out.println("M_id check : " + M_id);
	 System.out.println("session test : " + session.getAttribute("M_id"));

	 
	 
	
		
		
	 ResponseEntity resEntity = null; HttpHeaders responseHeaders = new HttpHeaders();
	 responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
	 try {
	 reserveService.haveReserve(reserveVO); message = "<script>"; 
	 message += " location.href='"+request.getContextPath()+"/main/main.do';"; //결제 후 결제 확인하는 창 만들어 줘야댐 
	 message += " alert('숙소 예약이 완료되었습니다.');"; 
	 message += " </script>";	 
	 }
	 catch(Exception e) { 
	 message = "<script>"; 
	 message +=" alert('숙소 예약에 실패하셨습니다. 다시 시도해주세요');"; 
	 message +=	 " location.href='"+request.getContextPath()+"/order/camping_pay.do';";
	 message += " </script>"; e.printStackTrace(); 
	 } 
	 resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK); return resEntity; }
	 
	
	
	
	@Override
	@RequestMapping(value="/camping_pay.do", method = RequestMethod.POST)
	public ModelAndView beforeReserve(@ModelAttribute("lod_id") String lod_id, @ModelAttribute("unit_name") String unit_name,
																HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("예약 확인 컨트롤러 진입함");
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo"); // 로그인회원 정보 
		int M_id = memberVO.getM_id();
		
		System.out.println("lod_id 출력 : "+lod_id);
		System.out.println("unit_name 출력 : "+unit_name);

		Map beforeResMap = reserveService.beforeRes(lod_id, unit_name);
		
		
		
		
		
		// 날짜는 따로 빼둠
		String checkIn_date = request.getParameter("checkIn_date");
		String checkOut_date = request.getParameter("checkOut_date");
				
		// 두 날짜의 간격 표시
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = date.parse(checkIn_date);
		Date endDate = date.parse(checkOut_date);
		long datedif = startDate.getTime() - endDate.getTime();
		long difDate = datedif / (24*3600*1000);
		difDate = Math.abs(difDate);
		System.out.println("날짜 차이"+ difDate);
		
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		

		beforeResMap.put("M_id", M_id); //사업자 아이디 수정해야함
		beforeResMap.put("checkIn_date", checkIn_date);
		beforeResMap.put("checkOut_date", checkOut_date);
		beforeResMap.put("difDate", difDate);
		beforeResMap.put("adult", adult);
		beforeResMap.put("child", child);
		mav.addObject("beforeResMap", beforeResMap);
		return mav;
		
	}
	
	
	
	
	
	
	@RequestMapping(value="/reserveChkList.do", method=RequestMethod.GET)
	public ModelAndView businessMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		int M_id = memberVO.getM_id();

		System.out.println("이거 나와야댐 ㅠㅠ"+M_id);
		

		List myReserveList = reserveService.myReserveList(M_id);
		mav.addObject("myReserveList", myReserveList);
		
		System.out.println(mav);
		return mav;
	}
}
