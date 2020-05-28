package com.iu.mk.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
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

	   @Inject    //서비스를 호출하기 위해서 의존성을 주입
	    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	    MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
	    
	    private static final String String = null;
	
	
	
	//injeungEmail
	@PostMapping("injeungEmail.do")
	public ModelAndView injeungEmail(ModelAndView mv, MemberVO memberVO,String email)throws Exception{
		
	       Random r = new Random();
           int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
           String dice1=Integer.toString(dice);
           
           String setfrom = "thdus3009@gmail.com";
           String tomail = email; // 받는 사람 이메일
           String title = "회원가입 인증 이메일 입니다."; // 제목
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
           
           
           try {
               MimeMessage message = mailSender.createMimeMessage();
               MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                       true, "UTF-8");

               messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
               messageHelper.setTo(tomail); // 받는사람 이메일
               messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
               messageHelper.setText(content); // 메일 내용
               
               mailSender.send(message);
           } catch (Exception e) {
               System.out.println(e);
           }
           
           
           //ajax를 사용해 controller로 원하는 값을 보낼때, 그냥바로 memberJoin으로 보내면 controller의 전체내용이 data로 보내진다.
           //해당값만을 보내려면 다른 jsp(common/ajaxResult)로 넘겼다 받아와주어야 한다.
           mv.addObject("result", dice);
           mv.setViewName("common/ajaxResult");
           
           return mv;
	}
	
	
	
	
	//hwaginEmail
    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 innerhtml로 " 올바른 인증번호입니다./ 인증번호가 일치하지 않습니다." 띄워주기
	@PostMapping("hwaginEmail.do")
	public ModelAndView hwaginEmail(ModelAndView mv, String emailNum,String hiddenNum)throws Exception{
		System.out.println("emailNum: "+emailNum);
		System.out.println("hiddenNum: "+hiddenNum);
		
		if(emailNum.equals(hiddenNum)) {
			mv.addObject("result", 1); //성공
		}else {
			mv.addObject("result", 0); //실패
		}
		
		mv.setViewName("common/ajaxResult");
		
		 return mv;
		 
		 
		/* , @PathVariable String dice, HttpServletResponse response_equals
		 * mv.setViewName("/member/memberJoin");
		 * 
		 * mv.addObject("emailNum",emailNum); ////jsp에서 "${emailNum}"로 사용 (dice:보낸인증번호 /
		 * emailNum:내가쓴인증번호)
		 * 
		 * //이걸 script에서 쓸수있을것같은디.. if (emailNum.equals(dice)) {
		 * response_equals.setContentType("text/html; charset=UTF-8"); PrintWriter
		 * out_equals = response_equals.getWriter();
		 * out_equals.println("<script>alert('인증번호가 일치하였습니다.');</script>");
		 * out_equals.flush();
		 * 
		 * return mv;
		 * 
		 * }else if (emailNum != dice) {
		 * response_equals.setContentType("text/html; charset=UTF-8"); PrintWriter
		 * out_equals = response_equals.getWriter(); out_equals.
		 * println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>"
		 * ); out_equals.flush();
		 * 
		 * return mv; }
		 */

	}



}

