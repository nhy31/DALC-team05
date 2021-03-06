package dongduk.dalc05.aah.controller;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;
import dongduk.dalc05.aah.util.ImageUtil;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MemberController {
	
	/* NaverLoginBO*/
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) { this.naverLoginBO = naverLoginBO;	}
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SickService sickService;
	
	@Autowired
    private ImageUtil imageUtil; // image 파일 저장용

	// 메인페이지 -> 회원가입페이지 이동
    @RequestMapping(value = "/member/join")
    public ModelAndView join() {
    	
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("member/join");
        
    	List<Sick> list = new ArrayList<>();
    	list = sickService.getSickList();
    	mav.addObject("sicks", list);
    	return mav;
    }
	
	// 회원가입
    /* <개발미완>
    2. 이메일 인증 */
	@RequestMapping(value="/member/join.do")
	public ModelAndView joinDo(
			HttpServletRequest request,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw,
    		@RequestParam ("member_name") String member_name,
    		@RequestParam ("member_nickName") String member_nickName,
    		@RequestParam ("member_phone") String member_phone,
    		@RequestParam ("member_birth") @DateTimeFormat (pattern ="yyyy-MM-dd") Date member_birth,
    		@RequestParam ("sick_code") int sick_code,
    		@RequestParam (value="member_sex") String member_sex,
    		@RequestParam (value="member_allergy", required = false) String member_allergy ,
    		MultipartFile img_file
			) {
		
		ModelAndView mav = new ModelAndView();
		
		// DB에 기본정보 insert -> memberService.signUp(memberDTO);
		String member_image = imageUtil.uploadImage(request, img_file);
		
		System.out.println("uploadPost member_image : " + member_image);
		
		if(member_image == null) {
			member_image = "userImg.png";
		}
		
		if (memberService.checkId(member_id) == null && memberService.checkNick(member_nickName) == null) {
			Member member = new Member(member_id, member_pw, member_name, member_nickName, member_phone,
					member_birth, sick_code, member_allergy, member_image, member_sex);
			memberService.insertMember(member);
			mav.setViewName("alert/success");
			model.addAttribute("msg", "가입을 축하합니다! 로그인을 해주세요");
	        model.addAttribute("url","/member/login");
	        return mav;
		}
        
		else if(memberService.checkId(member_id) != null && memberService.checkNick(member_nickName) == null) {
			Member member = new Member(null, member_pw, member_name, member_nickName, member_phone,
					member_birth, sick_code, member_allergy, member_image, member_sex);
			mav.setViewName("alert/error");
			mav.addObject("member", member);
			model.addAttribute("msg", "존재하는 이메일입니다.");
	        model.addAttribute("url","/member/join");
	        return mav;
		}
		
		else if(memberService.checkId(member_id) == null && memberService.checkNick(member_nickName) != null) {
			Member member = new Member(member_id, member_pw, member_name, null, member_phone,
					member_birth, sick_code, member_allergy, member_image, member_sex);
			mav.setViewName("alert/error");
			mav.addObject("member", member);
			model.addAttribute("msg", "존재하는 닉네임입니다.");
	        model.addAttribute("url","/member/join");
	        return mav;
		}
		
		else {
			Member member = new Member(null, member_pw, member_name, null, member_phone,
					member_birth, sick_code, member_allergy, member_image, member_sex);
			mav.setViewName("alert/error");
			mav.addObject("member", member);
			model.addAttribute("msg", "존재하는 이메일과 닉네임입니다.");
	        model.addAttribute("url","/member/join");
	        return mav;
		}
		
//        //임의의 authKey 생성 & 이메일 발송
//        String authKey = mss.sendAuthMail(memberDTO.getEmail());
//        memberDTO.setAuthKey(authKey);
//
//        Map<String, String> map = new HashMap<String, String>();
//        map.put("email", memberDTO.getEmail());
//        map.put("authKey", memberDTO.getAuthKey());
//        System.out.println(map);
//
//        //DB에 authKey 업데이트
//        memberService.updateAuthKey(map);
//		
	}
	


	// 메인페이지 -> 로그인페이지 이동
    @RequestMapping(value = "/member/login")
    public String login(Model model, HttpSession session) {
    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
    	model.addAttribute("NaverUrl", naverAuthUrl);
    	System.out.println("네이버인증: " + naverAuthUrl);
		return "member/login";
    }
    
    @RequestMapping(value="/member/findPW")
    public String findPassword(Model model, HttpSession session) {
    	return "member/findPW";
    }
    
    // 네이버 로그인 성공 시 콜백메소드
    @RequestMapping(value="/main/callback")
    public String callback(Model model, @RequestParam String code, 
    		@RequestParam String state, HttpSession session) throws IOException, ParseException{
    	System.out.println("네이버로 로그인 성공했을 시 콜백 메소드");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	//로그인 사용자 정보 읽어오기
    	apiResult = naverLoginBO.getUserProfile(oauthToken);
    	JSONParser parser = new JSONParser();
    	Object obj = parser.parse(apiResult);
    	JSONObject jsonObj = (JSONObject) obj;
    	JSONObject response_obj = (JSONObject) jsonObj.get("response");
    	
    	String nickName = (String)response_obj.get("nickname");
    	String naverId = (String)response_obj.get("email");
    	String phone = (String)response_obj.get("mobile");
    	String name = (String)response_obj.get("name");
    	String gender = (String)response_obj.get("gender");
    	
    	System.out.println(apiResult);
    	System.out.println("네이버 닉네임: " + nickName);
    	System.out.println("네이버 이메일: " + naverId);
    	System.out.println("네이버 폰넘버: " + phone);
    	System.out.println("네이버 이름: " + name);
    	System.out.println("네이버 성별: " + gender);    	
    	if(gender.equals("M"))
    		gender = "남성";
    	else
    		gender = "여성";
    
    	session.setAttribute("sessionNaverId", nickName);
    	model.addAttribute("apiResult", apiResult);
    	 
    	Member member = new Member();
    	member.setMember_name(name);
    	member.setMember_id(naverId);
    	member.setMember_nickName(nickName);
    	member.setMember_phone(phone);
    	
    	// 로그인 세션 처리
    	session.setAttribute("naverName", nickName);
		session.setAttribute("socialMember", member);
//		memberService.insertMember(new Member(null, null, name, nickName, phone, null, null, null, null, gender));
    	
		model.addAttribute("msg", nickName + "님 방문을 환영합니다");
        model.addAttribute("url","/member/join");
    	
        return "alert/success";
    }
    
	// 로그인 시도
	@RequestMapping(value="/member/login.do")
	public String loginDo(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw) throws IOException {
		
		String saveId = request.getParameter("saveId");
		
		boolean isValidUser = memberService.isValidUser(member_id, member_pw);
		if (isValidUser == true) {
			int member_code = memberService.getMemberCode(member_id);

			Member member = memberService.getMemberInfo(member_code);
			member.setSick_name(sickService.getSickName(member.getSick_code()));

			// 로그인 세션 처리 
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
			
			model.addAttribute("msg", member.getMember_nickName() + "님 방문을 환영합니다");
	        model.addAttribute("url","/");
	    
	        if(saveId != null) {
	        	 Cookie c = new Cookie("saveId", member_id);
	             c.setMaxAge(60*60*24*14); // 14일간 저장
	             response.addCookie(c);
	        }
	        else {
	        	Cookie c = new Cookie("saveId", member_id);
	        	c.setMaxAge(0);
	        	response.addCookie(c);
	        }
	        return "alert/success";
    	}

		// 틀렸을 경우
		model.addAttribute("msg", "아이디와 비밀번호가 올바르지 않습니다.");
        model.addAttribute("url", "/member/login");
        return "alert/error";
	}
	
	// 로그아웃(세션제거)
	@RequestMapping(value = "/member/logout.do")
	public String logoutDo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		session.removeAttribute("socialMember");
		
		//네이버 소셜로그인으로 로그인했을 경우의 로그아웃
		//session.invalidate();
		
		return "redirect:/main";
	}
	
	// 정보수정(마이페이지)으로 이동
	@RequestMapping(value="/member/my")
	public ModelAndView myPage(
			HttpServletRequest request,
			Model model) {
					
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
	
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/myPage");
        mav.addObject("me", m);
        
        List<Sick> list = new ArrayList<>();
    	list = sickService.getSickList();
    	
    	// 
    	for(int i=0; i<list.size(); i++) {
    		if(list.get(i).getSick_code() == m.getSick_code()) {
    			list.remove(i);
    			break;
    		}
    	}
    	mav.addObject("sicks", list);
		return mav;
	}
	
	// 내정보 업데이트
	@RequestMapping(value="/member/my/update.do")
	public ModelAndView myPageUpdate(
			HttpServletRequest request,
			Model model,
    		@RequestParam ("member_pw") String member_pw,
    		@RequestParam ("member_nickName") String member_nickName,
    		@RequestParam ("member_phone") String member_phone,
    		@RequestParam ("sick_code") int sick_code,
    		@RequestParam (value="member_allergy", required = false) String member_allergy,
    		@RequestParam (value="member_sex") String member_sex,
    		MultipartFile img_file) {
		
		String member_image = imageUtil.uploadImage(request, img_file);
		
		if(member_image == null) {
			member_image = "userImg.png";
		}
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginMember"); // 세션으로 멤버정보 가져와서
		int code = member.getMember_code(); // 멤버 고유코드 얻기
		
		Member updateMember = new Member(code, member_pw, member_nickName, member_phone, 
				sick_code, member_allergy, member_image, member_sex);
		memberService.updateMember(updateMember);
		
		// 업데이트된 멤버정보 
		updateMember =  memberService.getMemberInfo(code);
		updateMember.setSick_name(sickService.getSickName(updateMember.getSick_code()));
		
		// 세션 삭제후 새로운 정보로 다시 세션에 저장
		session.removeAttribute("loginMember");
		session.setAttribute("loginMember", updateMember);

		model.addAttribute("msg", "수정하였습니다.");
        model.addAttribute("url","/member/my");
        
		ModelAndView mav = new ModelAndView();
    	mav.setViewName("alert/success");       
        return mav;
	}
	
	// 탈퇴
	@RequestMapping(value="/member/delete.do")
	public String deleteDo(
			HttpServletRequest request,
			Model model) {
					
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		// DB에서 삭제 
		memberService.deleteMember(m.getMember_code());
		
		session.removeAttribute("loginMember");
		session.removeAttribute("socialMember");

		model.addAttribute("msg", "탈퇴되었습니다.");
        model.addAttribute("url","/");
  
		return "alert/success";
	}	
}
