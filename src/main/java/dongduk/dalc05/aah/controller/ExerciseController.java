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
    public ModelAndView exerciseBySick(HttpServletRequest request) {
    	System.out.println("Exercise Controller");
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("exercise/exercise_main");
    	
    	//로그인 세션
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
		
		//조회수 기준 내림차순으로 값 배치
    	List<Exercise> list = new ArrayList<>();
    	list = (List<Exercise>) exerciseService.getExerciseByViews();
    	for(Exercise e: list) {
    		int views = Integer.parseInt(e.getExercise_views());
    		int view = views / 10000;
    		if(view == 0) {
    			view = views / 1000;
    			e.setExercise_views(view + "천 회");
    		}
    		else
    			e.setExercise_views(view + "만 회");
    	}
    	mav.addObject("today_exercise", list);
    	
		return mav;
    }
    
    /*
    // 홈트페이지 -> 버튼 클릭
    @RequestMapping(value = "/main/exercise/sick")
    public ModelAndView exercise(@Param int sick_code) {
    	System.out.println("Exercise Button Controller");
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("exercise/exercise_main");
		
		//조회수 기준 내림차순으로 값 배치
    	List<Exercise> list = new ArrayList<>();
    	list = (List<Exercise>) exerciseService.getExerciseByViews();
    	mav.addObject("today_exercise", list);
    	
		return mav;
    }
    */
    
}
