
//  회원가입, 탈퇴, 로그인, 정보수정 등 유저가 할 수 있는 것들에 대한 컨트롤러

package dongduk.dalc05.aah.controller;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
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
		
	// 회원가입
	@RequestMapping(value="/member/join.do")
	public ModelAndView joinDo(
			HttpServletRequest request,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw,
    		@RequestParam ("member_name") String member_name,
    		@RequestParam ("member_nickName") String member_nickName,
    		@RequestParam ("member_phone") String member_phone,
    		@RequestParam ("member_email") String member_email,
    		@RequestParam ("member_birth") @DateTimeFormat (pattern ="yyyy-MM-dd") Date member_birth,
    		@RequestParam ("sick_code") int sick_code,
    		@RequestParam ("bad_ingredient_code") int bad_ingredient_code,
    		@RequestParam ("member_image") String member_image,
    		@RequestParam ("member_sex") int member_sex
			) {
		
		System.out.println("/member/join.do");
		ModelAndView mav = new ModelAndView();
		
		Member member = new Member(member_id, member_pw, member_name, member_nickName, member_phone
				, member_email, member_birth, sick_code, bad_ingredient_code, member_image, member_sex);
		
		memberService.insertMember(member);
		
		System.out.println(member_id + member_pw + member_name + member_nickName);
    	mav.setViewName("redirect:/main"); 
 
        return mav;
	}
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
