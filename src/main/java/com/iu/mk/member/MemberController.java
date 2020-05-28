package com.iu.mk.member;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.mk.member.MemberVO;
import com.iu.mk.member.MemberService;

@Controller

@RequestMapping(value="/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
   @Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
    
    private static final String String = null;
	
	
	
	//test
	@GetMapping("test")
	public String test()throws Exception {
		return "member/test";
	}
	
	
	//memberJoinConfirm (약관동의)
	@GetMapping("memberJoinConfirm")
	public ModelAndView memberJoinConfirm(MemberVO memberVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoinConfirm");
		
		return mv;
	}
	
	//memberJoin
	@GetMapping("memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO) { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView memberJoin2(MemberVO memberVO, HttpSession session, ModelAndView mv, String roadFullAddr){
		
		//		System.out.println(memberVO.getBirth_year()+memberVO.getBirth_mon()+memberVO.getBirth_day());
		memberVO.setBirth(memberVO.getBirth_year()+memberVO.getBirth_mon()+memberVO.getBirth_day());
		
		memberVO.setAddress(roadFullAddr);
	
		

		int result = 0;
		try {	
			result = memberService.memberJoin(memberVO);
		} catch (Exception e) {
			
			  mv.addObject("result","에러발생"); mv.addObject("path","memberJoin");
			  mv.setViewName("common/result");
			 
			
			e.printStackTrace();
			
			return mv;
		} 

		
		if(result>0) {
			mv.addObject("result","Join Success");
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result","Join Fail");
			mv.addObject("path","memberJoin");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	//중복확인 이므로 post타입만 사용 (checkId,checkEmail)
	//checkId
	@PostMapping("checkId")
	public ModelAndView checkId(ModelAndView mv, MemberVO memberVO)throws Exception{
		//name(key)값과 MemberVO 변수명의 이름이 같기 때문에 매개변수에 String id라고 써주지 않아도 된다.
		memberVO = (MemberVO)memberService.checkId(memberVO);
		
		//null > 가입가능
		//null이 아니면 중복
		String result = "0";//사용불가능
		if(memberVO==null) {
			result = "1";//사용가능
		}
		//ajaxResult로 보내기
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");	
		
		return mv;
	}
	
	//checkEmail
	@PostMapping("checkEmail")
	public ModelAndView checkEmail(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO= (MemberVO)memberService.checkEmail(memberVO);
		
		String result = "0";//사용불가능
		if(memberVO==null) {
			result="1";//사용가능
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");	
		
		return mv;
	}
	
	//memberLogin
	@GetMapping("memberLogin")
	public ModelAndView memberLogin(@CookieValue(value = "cId", required =false) String cId , Model model) { 
		System.out.println("cId: "+cId);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		
		return mv;
	}


	@PostMapping("memberLogin")
	public ModelAndView memberLogin2(MemberVO memberVO, HttpSession session, ModelAndView mv, String remember, HttpServletResponse response)throws Exception{
		//쿠키 생성 : 이름-cId 값-(없음) 으로 생성
		Cookie cookie = new Cookie("cId", "");
		//check박스가 체크되어있다면
		if(remember!=null) {
			cookie.setValue(memberVO.getId());
		}
		//memberVO에서 가져온 id정보를 담은 cookie를 응답에추가한다.
		response.addCookie(cookie);
		
		
		memberVO = memberService.memberLogin(memberVO);

		 if(memberVO != null) {
			 session.setAttribute("member", memberVO);
			 session.setAttribute("cart", 0);
			 mv.setViewName("redirect:../");//ar,pager를 못받아 넘기기 때문에 재검색해준다.
		 }else {
			 mv.addObject("result", "Login Fail");
			 mv.addObject("path", "./memberJoin");
			 mv.setViewName("common/result");
		 }
		
		return mv;
	}
	
	//memberLogOut
	@GetMapping("memberLogOut")
	public String memberLogOut(HttpSession session)throws Exception{
		session.invalidate(); // session끊기(무효화)
		//redirect는 String을 써야한다.
		return "redirect:../";
	}
	
	
	//memberMyPage
	@GetMapping("memberMyPage")
	public void memberMyPage( )throws Exception{
		
		//MemberVO memberVO =(MemberVO)session.getAttribute("member"); //Login할때 받아온 MemberVO값(value)을 member(key)에 담아주었다.
		//마이페이지 들어오려면 이미 로그인된 상태니까 굳이 session보낼필요 없을듯 
		
	}
	
	//memberMyPage_Info
	@GetMapping("memberMyPage_Info")
	public void memberMyPage_Info( )throws Exception{

	}
	
	//memberUpdate
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(HttpSession session, MemberVO memberVO, ModelAndView mv)throws Exception{
		
		memberVO.setBirth(memberVO.getBirth_year()+memberVO.getBirth_mon()+memberVO.getBirth_day());
		
		memberVO.setAddress(memberVO.getRoadFullAddr());
		
		//----------------값은 잘 넘어옴------------------------------------------------------------
		
		
		
		String id = ((MemberVO)session.getAttribute("member")).getId(); //Login메서드에서 설정해준 session memberVO에서 id를 꺼낸다.
		memberVO.setId(id); //서비스로 정보를 넘기려면 memberVO안에 넣어야하니까(아래참고) 비어있는 memberVO의 id안에 String id를 넣어준다는 의미.
		
		int result = memberService.memberUpdate(memberVO);
		
		//변형되면 1, 변형되지않으면 0
		if(result>0) {
			session.setAttribute("member", memberVO);//바뀐 memberVO을 ${member}에 넣는다.
			mv.addObject("result","회원정보를 수정하였습니다.");
			mv.addObject("path", "../"); //성공했으면 변경된 값을 재확인 하기 위해 redirect한다. 
			mv.setViewName("common/result");
		}else {
			mv.addObject("result","수정을 실패하였습니다.");
			mv.addObject("path","./memberMyPage_Info"); //실패했으니 다시 수정하기위해 현재페이지그대로 둔다. (redirect x)
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	
	//memberDelete
	@PostMapping("memberDelete")
	public ModelAndView memberDelete(String id, HttpSession session, ModelAndView mv) throws Exception {
		
		//MemberVO memberVO =(MemberVO)session.getAttribute("member");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		
		System.out.println("ㅇㄹㅇㄹㅇㄹㅇㄹ");
		System.out.println("id:"+id);
		
		int result = memberService.memberDelete(memberVO);
		
		System.out.println("result:"+result);

		if(result>0) {
			session.invalidate();
			mv.addObject("result","1");//탈퇴성공
			mv.setViewName("common/ajaxResult");
		}else {
			mv.addObject("result", "0");//탈퇴실패
			mv.setViewName("common/ajaxResult");
		}
		return mv;
	}
	
	
	//memberMyPage
	@GetMapping("memberMyPage_Purchase")
	public void memberMyPage_Purchase( )throws Exception{

	}
	
	//memberFind_Id (아이디 찾기)
	@GetMapping("memberFind_Id")
	public void memberFind_Id() throws Exception{
		
	}
	@PostMapping("memberFind_Id")
	public ModelAndView memberFind_Id1(MemberVO memberVO, ModelAndView mv) throws Exception{

		String id = memberService.memberFind_Id1(memberVO);
		System.out.println("id: "+id);
		
		if(id!=null) {
			
			mv.addObject("id", id);
			mv.setViewName("member/memberFind_IdSuccess");
			
		}else {
			
			mv.setViewName("member/memberFind_IdFail");
		}

		
		return mv;
	}
	

	//memberFind_Pw (비밀번호찾기 / 1.이름, 아이디, 이메일이 맞는정보인지 확인)
	@GetMapping("memberFind_Pw")
	public void memberFind_Pw() throws Exception{
		
	}
	@PostMapping("memberFind_Pw")
	public ModelAndView memberFind_Pw2(MemberVO memberVO,ModelAndView mv) throws Exception{

		String pw =  memberService.memberFind_Pw1(memberVO);
		
		if(pw!=null) {
			//이메일 인증번호 보내기
			
			mv.addObject("email", memberVO.getEmail());
			mv.setViewName("member/memberFind_PwSuccess");
			
		}else {
			mv.addObject("result", "사용자 정보가 존재하지 않습니다.");
			mv.addObject("path", "./memberFind_Pw");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	//memberFind_Pw_UsingEmail (2.버튼누르면 1번에서 입력한 이메일로 인증번호전송)
	@PostMapping("memberFind_Pw_UsingEmail")
	public ModelAndView memberFind_Pw_UsingEmail(String email, ModelAndView mv) throws Exception{
		System.out.println(email);
		

	       Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        String dice1=Integer.toString(dice);
        
        String setfrom = "thdus3009@gmail.com";
        String tomail = email; // 받는 사람 이메일
        String title = "[마켓컬리] 인증번호를 안내 드립니다."; // 제목
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
        

        mv.addObject("dice", dice);
        mv.setViewName("member/memberFind_Pw_UsingEmail");
        
        return mv;
		
	}
	
	//memberFind_Pw_EmailInjeung (3.보낸 인증번호와 적은 인증번호가 같은지 확인작업)
	@PostMapping("memberFind_Pw_EmailInjeung")
	public ModelAndView memberFind_Pw_EmailInjeung(ModelAndView mv)throws Exception{

		 mv.setViewName("member/memberFind_Pw_Final");

		 return mv;
		
	}
	
	
	//memberFind_Pw_Final (4.다른 비밀번호로 변경)
	@PostMapping("memberFind_Pw_Final")
	public ModelAndView memberFind_Pw_Final(HttpSession session, MemberVO memberVO, ModelAndView mv,String newPw) throws Exception{
		System.out.println(newPw);
		
		  String id = ((MemberVO)session.getAttribute("member")).getId();
		  System.out.println("마지막파이널을 향한 아이디: "+id); 
		  System.out.println("ㅇㅁㅇ");
		  
		 
		 mv.setViewName("redirect:../");

		 return mv;
	}
	
	
	
	@GetMapping("Sample")
	public void Sample() {
		
	}
	
	@GetMapping("jusoPopup")
	public void jusoPopup() {
		
	}
	
	
	 @PostMapping("jusoPopup") public void jusoPopup(String roadFullAddr) {
	  
	 System.out.println("jusoPopup:"+roadFullAddr); }
	 
}
