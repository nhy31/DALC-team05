package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Exercise;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.ExerciseService;

// 홈트관련컨트롤러
@Controller
public class ExerciseController {

	@Autowired
	private ExerciseService exerciseService;
	
    // 메인페이지 -> 홈트페이지 이동
    @RequestMapping(value = "/main/exercise")
    public ModelAndView exercise(HttpServletRequest request) {
    	System.out.println("Exercise Controller");
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("exercise/exercise_main");
    	
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		if (m == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			mav.addObject("member_id", m.getMember_id());
			mav.addObject("member_nickName", m.getMember_nickName());
		}
		
    	List<Exercise> list = new ArrayList<>();
    	list = (List<Exercise>) exerciseService.getExerciseByViews();
    	System.out.println(list.size());
    	System.out.println(list.get(0).getExercise_title());
    	
    	//db에 썸네일 넣을 때 이미지만 추출하는 작업통해 넣어야 함
    	list.get(0).setExercise_thumb("https://i.ytimg.com/vi/78SpY4RXPok/hq720.jpg");
    	mav.addObject("today_exercise", list);
    	
		return mav;
    }
    
}
