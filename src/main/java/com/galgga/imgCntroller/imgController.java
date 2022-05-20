package com.galgga.imgCntroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.galgga.Lod.vo.LodImgFileVO;
import com.galgga.Lod.vo.UnitImgFileVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public abstract class imgController {
private static String CURR_IMAGE_REPO_PATH = "C:\\galgga\\file_repo";



	// 숙소에 대한 upload
	@RequestMapping("/lodupload")
	protected List<LodImgFileVO> lodupload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<LodImgFileVO> lodfileList= new ArrayList<LodImgFileVO>();
		 Iterator<String> fileNames = multipartRequest.getFileNames(); //form 내부 name 받와서 fileNames에 저장, 
	
		while(fileNames.hasNext()){ //fileNames 내부에 값이 있을 경우에 실행
			LodImgFileVO lodImgFileVO =new LodImgFileVO();	
			String fileName = fileNames.next();		// fileNames에 다음 값이 있을 경우 다시 대입
			lodImgFileVO.setImgType(fileName);
			if(fileName.contains("lod_img")) {
			MultipartFile mFile = multipartRequest.getFile(fileName);	//위에서 저장한 filename 가져와서 mfil 저장
			String originalFileName=mFile.getOriginalFilename();
			lodImgFileVO.setLod_imgName(originalFileName);
			lodfileList.add(lodImgFileVO);
			System.out.println(lodfileList.toString());
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			
			if(mFile.getSize()!=0){
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
							file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName)); 
			}
			}
		}
		return lodfileList;
	}

	@RequestMapping("/unitupload")
	protected List<UnitImgFileVO> unitupload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<UnitImgFileVO> unitfileList= new ArrayList<UnitImgFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			UnitImgFileVO unitImgFileVO =new UnitImgFileVO();
			String fileName = fileNames.next();
			unitImgFileVO.setImgType(fileName);
			if(fileName.contains("unit_img")) {
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			unitImgFileVO.setUnit_imgName(originalFileName);
			unitfileList.add(unitImgFileVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
							file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\"+"temp"+ "\\"+originalFileName)); 
				
			}
		}
		}
		return unitfileList;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
