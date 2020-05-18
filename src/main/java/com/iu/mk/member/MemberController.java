package com.iu.mk.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	//test
	@GetMapping("test")
	public void test()throws Exception {
		
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
		System.out.println(memberVO.getBirth());
		
		memberVO.setAddress(roadFullAddr);
		System.out.println(memberVO.getAddress());
		
		

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
	public ModelAndView checkId(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
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
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin2(MemberVO memberVO, HttpSession session, ModelAndView mv, String remember, HttpServletResponse response)throws Exception{
		Cookie cookie = new Cookie("cId", "");
		//check박스가 체크되어있다면
		if(remember!=null) {
			cookie.setValue(memberVO.getId());
		}
		//memberVO에서 가져온 id정보를 담은 cookie를 응답에추가한다.
		response.addCookie(cookie);
		System.out.println(memberService);
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
	//memberMyPage
	@GetMapping("memberMyPage_Purchase")
	public void memberMyPage_Purchase( )throws Exception{

	}
	
	
	//memberDelete
	@GetMapping("memberDelete")
	public ModelAndView memberDelete( HttpSession session, ModelAndView mv) throws Exception {
		
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		int result = memberService.memberDelete(memberVO);
		if(result>0) {
			session.invalidate();
			mv.addObject("result","Delete Success");
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "Delete Fail");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("Sample")
	public void Sample() {
		
	}
	
	@GetMapping("jusoPopup")
	public void jusoPopup() {
		
	}
	
	
	 @PostMapping("jusoPopup") public void jusoPopup(String roadFullAddr) {
	  
	 System.out.println("주소:"+roadFullAddr); }
	 
}
