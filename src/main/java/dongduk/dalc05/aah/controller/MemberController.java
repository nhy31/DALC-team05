
package dongduk.dalc05.aah.controller;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

@Controller
public class MemberController {
//	
	@Autowired
	private MemberService memberService;
	
	// 로그인 시도
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public String loginDo(
			HttpServletRequest request,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw) throws IOException {
			
		boolean isValidUser = memberService.isValidUser(member_id, member_pw);
	
		if (isValidUser == true) {
			
			// 로그인 세션 처리 (고유번호, 아이디, 닉네임)
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);
			
			String member_nickName = memberService.getMemberNickName(member_id);
			session.setAttribute("member_nickName", member_nickName);
			
			session.setAttribute("member_code", memberService.getMemberCode(member_id));
			
			model.addAttribute("msg", member_nickName + "님 방문을 환영합니다");
	        model.addAttribute("url","/");
	    
	         return "alert/alert";
	        
    	}

		 model.addAttribute("msg", "아이디와 비밀번호가 틀렸습니다.");
         model.addAttribute("url","/");
         model.addAttribute("url","/main/login");

		 return "alert/alert";

	}
		
	// 회원가입
	@RequestMapping(value="/member/join.do")
	public String joinDo(
			HttpServletRequest request,
			Model model,
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
		
		model.addAttribute("msg", "가입을 축하합니다! 로그인을 해주세요");
        model.addAttribute("url","/main/login");
    
        return "alert/alert";
	}
	
	// 탈퇴
	@RequestMapping(value="/member/delete.do")
	public String deleteDo(
			HttpServletRequest request,
			Model model) {
					
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		memberService.deleteMember(memberService.getMemberCode(member_id));
		
		session.removeAttribute("member_id");
		session.removeAttribute("member_code");
		session.removeAttribute("member_nickName");
		
		model.addAttribute("msg", "탈퇴되었습니다.");
        model.addAttribute("url","/");
  
		return "alert/alert";
	}
	}
		
	
//	// 정보수정 -> 페이지구현되면 바끄
//	public ModelAndView updateDo(
//			HttpServletRequest request) {
//			
//		
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