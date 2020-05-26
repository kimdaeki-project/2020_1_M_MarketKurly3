package com.iu.mk.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Logger;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

@RequestMapping(value="/member/**")
public class MemberEmailController {

	@Autowired
	private MemberService memberService;
	JavaMailSender mailSender;  
	
    //로깅을 위한 변수 - 디버깅(에러찾아줌.?)
   // private static final Logger logger= (Logger) LoggerFactory.getLogger(MemberEmailController.class);
    private static final String String = null;
	
	
	
	//injeungEmail
	@PostMapping("injeungEmail.do")
	public void injeungEmail(ModelAndView mv, MemberVO memberVO)throws Exception{
		
		
		
	}
	
	
	
	
	//hwaginEmail
    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 innerhtml로 " 올바른 인증번호입니다./ 인증번호가 일치하지 않습니다." 띄워주기
	@PostMapping("hwaginEmail.do${dice}")
	public ModelAndView hwaginEmail(String emailNum, @PathVariable String dice, HttpServletResponse response_equals)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		//페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
		
	      mv.setViewName("/member/memberJoin");
	        
	      mv.addObject("emailNum",emailNum); ////jsp에서 "${emailNum}"로 사용 (dice:보낸인증번호 / emailNum:내가쓴인증번호)
	        
	      //이걸 script에서 쓸수있을것같은디..
	        if (emailNum.equals(dice)) {
	        	response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('인증번호가 일치하였습니다.');</script>");
	            out_equals.flush();
	            
	            return mv;
	            
	        }else if (emailNum != dice) {
	        	response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	            out_equals.flush();
	        	
	        	return mv;
	        }
		
		return mv;
		
	}



}

