package com.galgga.imgCntroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ThumbnailsController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\galgga\\";	
	
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); 
			if(count==-1)  
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	
	@RequestMapping("/lodThumbnails.do")
	protected void lodThumbnails(@RequestParam("lod_imgName") String lod_imgName,
                            	 @RequestParam("lod_id") String lod_id,
			                 HttpServletResponse response) throws Exception {
		
		System.out.println("lod_id : " + lod_id);
		
		System.out.println("img_name : " + lod_imgName);
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"file_repo"+"\\"+"temp"+"\\"+ "lods" + "\\" + lod_id +"\\"+ "lod"+"\\"+lod_imgName;
		File img=new File(filePath);
		
		if (img.exists()) { 
			Thumbnails.of(img).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/unitThumbnails.do")
	protected void unitThumbnails(@RequestParam("unit_imgName") String unit_imgName,
                            	 @RequestParam("lod_id") String lod_id,
                            	 @RequestParam("unit_id") String unit_id,
			                 HttpServletResponse response) throws Exception {
		System.out.println("unit �뜽�꽕�씪 吏꾩엯�븿");
		System.out.println("lod_id : " + lod_id);
		System.out.println("unit_id : " + unit_id);
		
		System.out.println("unit_img_name : " + unit_imgName);
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"file_repo"+"\\"+"temp"+"\\"+"lods"+"\\"+lod_id+"\\"+"unit"+"\\"+unit_id+"\\"+unit_imgName;
		File img=new File(filePath);
		
		if (img.exists()) { 
			Thumbnails.of(img).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

}
