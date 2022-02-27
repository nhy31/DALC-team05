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

import dongduk.dalc05.aah.domain.Exercise;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.MyBox;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.service.ExerciseService;
import dongduk.dalc05.aah.service.MyBoxService;
import dongduk.dalc05.aah.service.RecipeService;

@Controller
public class MyBoxController {
	
	@Autowired
	private MyBoxService myBoxService;
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private ExerciseService exerciseService;
	
	// 보관함 페이지로 이동
	@RequestMapping(value = "/member/mybox")
	public ModelAndView myBox(
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		int member_code = m.getMember_code();
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myBox");
		
		List<MyBox> rList = new ArrayList<>();
		rList = myBoxService.getAllList(member_code);
		
		List<MyBox> eList = new ArrayList<>();
		eList = myBoxService.getAllList(member_code);
		
		for(int i=0; i< rList.size(); i++) {
			Recipe re = recipeService.getRecipeFromCode(rList.get(i).getRecipe_code());
			rList.get(i).setTitle(re.getRecipe_title());
			rList.get(i).setMemo(re.getRecipe_memo());
			rList.get(i).setImg(re.getRecipe_img());
		}
		
		for(int i = 0; i < eList.size(); i++) {
			Exercise ex = exerciseService.getExerciseByCode(rList.get(i).getExercise_code());
			eList.get(i).setTitle(ex.getExercise_title());
			eList.get(i).setMemo(ex.getExercise_channel() + "\n" + ex.getExercise_length());
			eList.get(i).setImg(ex.getExercise_thumb());
		}
		
		mav.addObject("myBoxList", rList);
		mav.addObject("myBoxList2", eList);
		
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
		
		
		
		List<MyBox> check = myBoxService.getAllList(member_code);
		for(int i=0; i<check.size(); i++) {
			if(check.get(i).getRecipe_code() == recipe_code) {
				mav.setViewName("alert/warning");
				model.addAttribute("msg", "이미 보관함에 존재합니다.");
		        model.addAttribute("url","/member/mybox");
		        return mav;	
			}	
		}
		
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
			Model model) {
		
		ModelAndView mav = new ModelAndView();
		
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
		mav.setViewName("redirect:/member/mybox");
		
		MyBox add = new MyBox();
		add.MyBoxExercise(member_code, exercise_code);
		System.out.println("홈트보관함: " + member_code + " " + exercise_code);
		System.out.println("Mybox객체: " + add.getRecipe_code() +" " + add.getExercise_code());
//		System.out.println("Mybox객체: " + add.getmember_code() +" " + add.getExercise_code());
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
