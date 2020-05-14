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
	
	//업로드한 파일 삭제
	public int deleteFile(String fileNum, String path) throws Exception{
		//v파일 객체 생성
		File file = new File(path,fileNum);
		boolean check=false;
		int result=0;
		if(file.exists()) {
			check=file.delete();
		}
		if(check) {
			result=1;
		}
		return result;
	}
	
	
	
	
}
