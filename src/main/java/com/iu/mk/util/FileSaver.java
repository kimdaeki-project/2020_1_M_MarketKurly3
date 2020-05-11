package com.iu.mk.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	
	public String saveByTransfer(MultipartFile file, String path) throws Exception{
		
		//디렉토리 만들기
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		
		//저장할 파일명 생성
		String fileName = this.makeNameByUUID(file.getOriginalFilename());
		
		//객체 생성
		f = new File(f, fileName);
		
		//HDD 저장
		FileCopyUtils.copy(file.getBytes(), f);
		
		return fileName;
		
		
		
	}
	
	
	
	private String makeNameByUUID(String name) {
		String result = UUID.randomUUID().toString();
		result = result+"_"+name;
		return result;
	}
	
	
	
	
}
