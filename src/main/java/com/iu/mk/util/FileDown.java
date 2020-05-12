package com.iu.mk.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.iu.mk.product.productfile.ProductFileVO;

@Component
//jsp 대신 abview 에서 정보를 가지고 와서 출력
public class FileDown extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//파일명과 경로 가지고 오기
				ProductFileVO productFileVO = (ProductFileVO) model.get("files");
				String fileName = productFileVO.getFileName();//파일명
				String path = request.getSession().getServletContext().getRealPath("/resources/uploadproduct");
				System.out.println(path);
				
				//1. 하드에서 파일 읽을 준비(어느 경로에 어느 파일명이냐)
				File file = new File(path,fileName);//해당 파일의 정보를 가진 객체
				
				//2. 파일의 크기(내보낼 때 파일의 크기)
				response.setContentLength((int)file.length());
				
				//3.다운로드 시 파일의 이름 인코딩
				String downName = URLEncoder.encode(productFileVO.getOriName(),"UTF-8");
				
				//4. 헤더 설정
				response.setHeader("Content-disposition", "attachment;fileName=\""+downName+"\"");
				response.setHeader("Content-transfer-Encoding", "binary");
				
				//5. 스트림 연결 후 전송
				FileInputStream fi = new FileInputStream(file);//외부파일을 서버로 끌어들이기
				OutputStream os = response.getOutputStream();//클라이언트로 스트림 내보내기
				
				FileCopyUtils.copy(fi, os);//카피해서 아웃풋하겠다.
				
				//자원해제
				os.close();
				fi.close();
		
	}
	
}
