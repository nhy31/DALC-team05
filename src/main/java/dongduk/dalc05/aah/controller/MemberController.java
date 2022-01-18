
//  회원가입, 탈퇴, 로그인, 정보수정 등 유저가 할 수 있는 것들에 대한 컨트롤러

package dongduk.dalc05.aah.controller;

import dongduk.dalc05.aah.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	// 로그인 시도
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView loginDo(
			HttpServletRequest request,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw) {
		
		ModelAndView mav = new ModelAndView();
		
		boolean isValidUser = memberService.isValidUser(member_id, member_pw);
		
		if (isValidUser == true) {
			
			// 로그인 세션 처리 (고유번호, 아이디, 닉네임)
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_code", memberService.getMemberCode(member_id));
			session.setAttribute("member_nickName", memberService.getMemberNickName(member_id));

			// 전달값으로 하던가
			mav.addObject("member_id", member_id);
			mav.addObject("member_code", memberService.getMemberCode(member_id));
			mav.addObject("member_nickName",  memberService.getMemberNickName(member_id));
					
			mav.setViewName("redirect:/main");

    		return mav;
    	} 
    	
    	mav.setViewName("member/login"); 
    	mav.addObject("isLoginFail", "true");

        return mav;
	}
		
//	// 회원가입
//	@RequestMapping(value="/member/join.do", method = RequestMethod.POST)
//	public ModelAndView joinDo(
//			HttpServletRequest request,
//			@RequestParam ("member_id") String member_id,
//    		@RequestParam ("member_pw") String member_pw) {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		Map<String, String> check = memberService.isValidUser(member_id, member_pw);
//		
//		if (check != null) {
//			// 로그인 세션 처리 (고유번호, 아이디, 닉네임)
//			HttpSession session = request.getSession();
//			session.setAttribute("username", check.get("member_code"));
//			session.setAttribute("username", check.get("member_id"));
//			session.setAttribute("memberId", check.get("member_nickName"));
//
//			mav.setViewName("main/main");
//
//    		return mav;
//    	} 
//    	
//    	mav.setViewName("member/login"); 
//    	mav.addObject("isLoginFail", "true");
//
//        return mav;
//	}
//	
//	// 탈퇴
//	@RequestMapping(value="/member/delete.do", method = RequestMethod.POST)
//	public ModelAndView deleteDo(
//			HttpServletRequest request,
//			@RequestParam ("member_id") String member_id,
//	    	@RequestParam ("member_pw") String member_pw) {
//			
//		ModelAndView mav = new ModelAndView();
//			
//		Map<String, String> check = memberService.isValidUser(member_id, member_pw);
//			
//		if (check != null) {
//			// 로그인 세션 처리 (고유번호, 아이디, 닉네임)
//			HttpSession session = request.getSession();
//			session.setAttribute("username", check.get("member_code"));
//			session.setAttribute("username", check.get("member_id"));
//			session.setAttribute("memberId", check.get("member_nickName"));
//
//			mav.setViewName("main/main");
//
//	    	return mav;
//	    } 
//	    	
//	    mav.setViewName("member/login"); 
//	    mav.addObject("isLoginFail", "true");
//
//	    return mav;
//	}
//		
//	
//	// 정보수정
//	public ModelAndView updateDo(
//			HttpServletRequest request,
//			@RequestParam ("member_id") String member_id,
//	    	@RequestParam ("member_pw") String member_pw) {
//			
//		ModelAndView mav = new ModelAndView();
//			
//		Map<String, String> check = memberService.isValidUser(member_id, member_pw);
//			
//		if (check != null) {
//			// 로그인 세션 처리 (고유번호, 아이디, 닉네임)
//			HttpSession session = request.getSession();
//			session.setAttribute("username", check.get("member_code"));
//			session.setAttribute("username", check.get("member_id"));
//			session.setAttribute("memberId", check.get("member_nickName"));
//
//			mav.setViewName("main/main");
//
//	    	return mav;
//	    } 
//	    	
//	    mav.setViewName("member/login"); 
//	    mav.addObject("isLoginFail", "true");
//
//	    return mav;
//	}
//		
//		
		
}
