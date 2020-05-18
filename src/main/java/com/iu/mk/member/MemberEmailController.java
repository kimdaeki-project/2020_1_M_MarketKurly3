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
	public ModelAndView injeungEmail(HttpServletRequest request_email, String email, HttpServletResponse response_email)throws Exception{
		
		
		//이메일: <input type="text" name="m_email"~
		//----------------------------메세지 보내기-------------------------------------
		
		//이메일로 받는 인증코드 부분 (난수)
		Random r = new Random();
		int dice = r.nextInt(900000) + 100000; //nextInt(900000) : 0<=r<900000 사이의 수
		
		String setfrom = "thdus3009@gmail.com"; //보내는사람
		//매개변수로 받아온 HttpServletRequest사용 (요청)
        String setmail = request_email.getParameter("email"); // 받는 사람
        String title = "마켓컬리 - 회원가입 인증 이메일 입니다."; // 제목
        String content = 
        		
        		 System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
                 
                 System.getProperty("line.separator")+
                         
                 "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
                 
                 +System.getProperty("line.separator")+
                 
                 System.getProperty("line.separator")+
         
                 " 인증번호는 " +dice+ " 입니다. "
                 
                 +System.getProperty("line.separator")+
                 
                 System.getProperty("line.separator")+
        		
        		"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        System.out.println("인증");
        
        MimeMessage message = mailSender.createMimeMessage();
        
        MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                true, "UTF-8");
        
//String에 담아서 MimeMessageHelper로 보내기
        messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
        messageHelper.setTo(setmail); // 받는사람 이메일
        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
        messageHelper.setText(content); // 메일 내용
        
        mailSender.send(message); //메세지 보내기

        
        //----------------------------해당 페이지에 인증번호 입력------------------------------------
        //ModelAndView로 보낼 페이지를 지정하고, 보낼 값(인증번호)을 지정한다.
        ModelAndView mv = new ModelAndView();   
        mv.setViewName("member/memberJoin");     //뷰의이름
        mv.addObject("dice", dice); //jsp에서 "${dice}"로 사용 (dice:인증번호)
        
        System.out.println("mv : "+ mv);
        
		/*
		 * //매개변수로 받아온 HttpServletResponse 사용 (응답)
		 * response_email.setContentType("text/html; charset=UTF-8"); PrintWriter
		 * out_email = response_email.getWriter(); //응답받아온 정보를 print해준다.
		 * 
		 * out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		 * 
		 * // 현재 버퍼에 저장되어 있는 내용을 클라이언트로 전송하고 버퍼를 비운다. (JSP) out_email.flush();
		 */

        return mv;
		
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

