package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.MyBox;
import dongduk.dalc05.aah.service.MyBoxService;

@Controller
public class MyBoxController {
	
	@Autowired
	private MyBoxService myBoxService;
	
	// 보관함 페이지로 이동
	@RequestMapping(value = "/member/mybox")
	public ModelAndView myBox(
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		int member_code = m.getMember_code();
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myBox");
		
		List<MyBox> list = new ArrayList<>();
		list = myBoxService.getAllList(member_code);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getRecipe_code() == -1) {
				list.get(i).setImage(null); // 후에 홈트코드로 홈트영상이미지 불러온다
				list.get(i).setSick_name(null); // 후에 홈트에 저장된 sick_code로 sick_name 불러온다
			}
			else {
				list.get(i).setImage(null); // 후에 레시피코드로 레시피이미지 불러온다
				list.get(i).setSick_name(null); // 후에 레시피 저장된 sick_code로 sick_name 불러온다
			}
		}
		
		mav.addObject("myBoxList", list);
		
		return mav;
	}
		
	// 레시피를 보관함에 저장하기
	@RequestMapping(value = "/mybox/recipe/add")
	public ModelAndView recipeAdd(
			HttpServletRequest request,
			@RequestParam ("recipe_code") int recipe_code,
			Model model
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/mybox");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		// 로그인 X -> 이용불가
		if(m == null) {
			mav.setViewName("alert/error");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/member/login");
	        return mav;	
		}
		
		
		int member_code = m.getMember_code();
		
		MyBox add = new MyBox();
		add.MyBoxRecipe(member_code, recipe_code);
		myBoxService.insertMyBox(add);
		
		return mav;
	}
	
	// 홈트를 보관함에 저장하기
	@RequestMapping(value = "/mybox/exercise/add")
	public ModelAndView exerciseAdd(
			HttpServletRequest request,
			@RequestParam ("exercise_code") int exercise_code,
			Model model
			) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		int member_code = m.getMember_code();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/mybox");
		
		// 로그인 X -> 이용불가
		if(m == null) {
			mav.setViewName("alert/error");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
	        model.addAttribute("url","/member/login");
	        return mav;	
		}
		
		
		MyBox add = new MyBox();
		add.MyBoxExercise(member_code, exercise_code);
		myBoxService.insertMyBox(add);
		
		return mav;
	}
	
	// 보관함에서 삭제하기
	@RequestMapping(value = "/member/mybox/delete")
	public ModelAndView deleteFromBox(
			HttpServletRequest request,
			@RequestParam ("myBox_code") int myBox_code) {

		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		int member_code = m.getMember_code();
		
		MyBox del = new MyBox(myBox_code, member_code);
		
		myBoxService.deleteMyBox(del);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/mybox");
	
		return mav;
	}
}
