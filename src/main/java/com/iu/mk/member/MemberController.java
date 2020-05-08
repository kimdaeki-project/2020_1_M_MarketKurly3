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
	
	//memberJoinConfirm
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
	public ModelAndView memberJoin2(MemberVO memberVO, HttpSession session, ModelAndView mv)throws Exception {
		int result = memberService.memberJoin(memberVO, session);
		
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
	
	
}
