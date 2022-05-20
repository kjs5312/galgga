package com.galgga.businessLods.controller;

import java.io.File;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.Lod.vo.LodImgFileVO;
import com.galgga.Lod.vo.LodVO;
import com.galgga.Lod.vo.UnitImgFileVO;
import com.galgga.business.main.dao.BusinessDAOImpl;
import com.galgga.business.main.service.BusinessService;
import com.galgga.business.main.vo.BusinessVO;
import com.galgga.businessLods.dao.BusinessLodDAO;
import com.galgga.businessLods.service.BusinessLodService;
import com.galgga.imgCntroller.imgController;

@Controller("businessLodsController")
@RequestMapping(value = "/businessLods")
public class BusinessLodsControllerImpl extends imgController implements BusinessLodsController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";

	@Autowired
	private BusinessLodService businessLodService;
	@Autowired
	private BusinessVO businessVO;
	@Autowired
	private BusinessService businessService;
	@Autowired
	private BusinessLodDAO businessLodDAO;
	@Autowired(required=false)
	private LodVO lodVO;
	
	
	@RequestMapping(value = "/addNewLods.do", method = { RequestMethod.POST })
	public ResponseEntity addNewLods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String lodImgFileName = null;
		String unitImgFileName = null;

		// 숙소 등록
		Map newLodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		
		
		HttpSession session = multipartRequest.getSession();
		session = multipartRequest.getSession();
		session.getAttribute("businessInfo");
		businessVO = (BusinessVO) session.getAttribute("businessInfo");
		int B_id = businessVO.getB_id();
		System.out.println("B_id : " + B_id);
		

		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value =  multipartRequest.getParameter(name);
			newLodsMap.put(name, value);
			newLodsMap.put("B_id", B_id);
			System.out.println("name : "+ name +" value : " + value);
		}

		List<LodImgFileVO> lodImgFileList = lodupload(multipartRequest);
		if (lodImgFileList != null && lodImgFileList.size() != 0) {
			newLodsMap.put("lodImgFileList", lodImgFileList);
		}

		

		 

		List<UnitImgFileVO> unitImgFileList = unitupload(multipartRequest);
		if (unitImgFileList != null && unitImgFileList.size() != 0) {
			newLodsMap.put("unitImgFileList", unitImgFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int lod_id = businessLodService.addNewLods(newLodsMap);
			

			if (lodImgFileList != null && lodImgFileList.size() != 0) {
				for (LodImgFileVO lodImgFileVO : lodImgFileList) {
					lodImgFileName = lodImgFileVO.getLod_imgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + lodImgFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + "lods" + "\\" + lod_id +"\\"+ "lod");
					FileUtils.moveFileToDirectory(srcFile, destDir, true);

				}
				if (unitImgFileList != null && unitImgFileList.size() != 0) {
					for (UnitImgFileVO unitImgFileVO : unitImgFileList) {
						unitImgFileName = unitImgFileVO.getUnit_imgName();
						File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + unitImgFileName);
						File DestDir1 = new File (CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unitImgFileVO.getUnit_id());
						FileUtils.moveFileToDirectory(srcFile1, DestDir1, true);

					}
				}

			}

			message = "<script>";
			message += " alert('숙소 등록에 성공했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_main.do';";
			message += (" </script>");
			
		} catch (Exception e) {
			if (lodImgFileList != null && lodImgFileList.size() != 0) {
				for (LodImgFileVO lodimgFileVO : lodImgFileList) {
					lodImgFileName = lodimgFileVO.getLod_imgName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + lodImgFileName);
					srcFile.delete();
				}
			}
			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				for (UnitImgFileVO unitimgFileVO : unitImgFileList) {
					unitImgFileName = unitimgFileVO.getUnit_imgName();
					File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + unitImgFileName);
					srcFile1.delete();
				}
			}

			message = "<script>";
			message += " alert('오류 발생 다시 등록해 주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_addLod.do';";
			message += (" </script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	
	
	@RequestMapping(value = "/addNewUnits.do", method = { RequestMethod.POST })
	public ResponseEntity addNewUnits (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		String unitImgFileName = null;
		Map newUnitsMap = new HashMap(); 
		Enumeration enu = multipartRequest.getParameterNames(); 
		
		//현재 로그인 되어있는 사업주 확인
		HttpSession session = multipartRequest.getSession();
		session = multipartRequest.getSession();
		session.getAttribute("businessInfo");

		businessVO = (BusinessVO) session.getAttribute("businessInfo"); // 로그인 되어있는 사업주 확인
		int B_id = businessVO.getB_id();
		System.out.println("B_id : " + B_id);

		
		int lod_id = Integer.parseInt(multipartRequest.getParameter("lod_id"));   //객실 추가할 숙소의 아이디 값 확인
		System.out.println("lod_id 확인"+lod_id);
		newUnitsMap.put("lod_id", lod_id);
		
		

		  while (enu.hasMoreElements()) {
		  String name = (String) enu.nextElement(); 
		  String value = multipartRequest.getParameter(name);
		  newUnitsMap.put(name, value);
		  
		  }
		  System.out.println("before unitupload " );
		  List<UnitImgFileVO> unitImgFileList = unitupload(multipartRequest);
			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				newUnitsMap.put("unitImgFileList", unitImgFileList);
				System.out.println("unit_Filelist : " + (unitImgFileList.toString()));
			}
			
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			try {
				int unit_id = businessLodService.addNewUnits(newUnitsMap);
				
					if (unitImgFileList != null && unitImgFileList.size() != 0) {
						for (UnitImgFileVO unitImgFileVO : unitImgFileList) {
							unitImgFileName = unitImgFileVO.getUnit_imgName();
							File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\" + unitImgFileName);
							File DestDir1 = new File (CURR_IMAGE_REPO_PATH + "\\" + "file_repo" + "\\" + "temp" + "\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unitImgFileVO.getUnit_id());
							FileUtils.moveFileToDirectory(srcFile1, DestDir1, true);

						}
					}

				

					message = "<script>";
					message += " alert('숙소 등록에 성공했습니다.');";
					message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_main.do';";
					message += (" </script>");	
			}catch (Exception e) {

			if (unitImgFileList != null && unitImgFileList.size() != 0) {
				for (UnitImgFileVO unitimgFileVO : unitImgFileList) {
					unitImgFileName = unitimgFileVO.getUnit_imgName();
					File srcFile1 = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + unitImgFileName);
					srcFile1.delete();
				}
			}
	
			message = "<script>";
			message += " alert('오류 발생 다시 등록해 주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/businessLods/business_addUnit.do';";
			message += (" </script>");
			e.printStackTrace();
		}
	resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
	return resEntity;
	}
	
	
	
	
	@RequestMapping(value="/business_main.do", method=RequestMethod.GET)
	public ModelAndView businessMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		BusinessVO businessVO = (BusinessVO)session.getAttribute("businessInfo");
		int B_id = businessVO.getB_id();

		/* lodVO.setB_id(B_id); */
		System.out.println("이거 나와야댐 ㅠㅠ"+B_id);
		
		System.out.println("이거 나와야댐 ㅠㅠ"+businessLodDAO.selectMyLodsList(B_id));
		
		List myLodsList = businessLodService.myLodsList(B_id);
		mav.addObject("myLodsList", myLodsList);
		
		System.out.println(mav);
		return mav;
	}
	
	
	
	@RequestMapping(value="/lodsDetail.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("lods 컨트롤러쪽 lod_id : "+lod_id);
		Map lodsDetailMap = businessLodService.lodsInfo(lod_id);
		Map unitsDetailMap = businessLodService.unitsInfo(lod_id); 
				
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("lodsDetailMap", lodsDetailMap);	
		mav.addObject("unitsDetailMap", unitsDetailMap);
		
		
		
		System.out.println("다이렉트 : " + businessLodDAO.selectLodsDetail(lod_id));
		System.out.println("map 키 id"+ lodsDetailMap.get("lodVO"));
		
		
		
		return mav;
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
