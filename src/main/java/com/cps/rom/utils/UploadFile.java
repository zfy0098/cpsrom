package com.cps.rom.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {

	
	/**
	 *   上传商品图片
	 * @param file   要上传图片
	 * @param path   图片保存的路径
	 * @return       上传完成后图片保存的http路径 
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static String uploadProimg(MultipartFile file,String path) throws IllegalStateException, IOException{
		String HTTP_URL = "";
		if(file!=null&&file.getSize()>0){
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String nowtime = sdf.format(new Date());
			
			path = path + nowtime +"/";
			
			String fileName = file.getOriginalFilename();  
			
			String newFileName = UUID.randomUUID().toString().toUpperCase() + fileName.substring(fileName.lastIndexOf("."));
			
			File targetFile = new File(path, newFileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        //保存  
            file.transferTo(targetFile); 
            HTTP_URL = PropertyUtils.getValue("httpurl") + nowtime + "/" + newFileName;
		}
		return HTTP_URL;
		
	}
}
