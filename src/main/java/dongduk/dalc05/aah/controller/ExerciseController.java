package dongduk.dalc05.aah.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Exercise;
import dongduk.dalc05.aah.service.ExerciseService;

// 홈트관련컨트롤러
@Controller
public class ExerciseController {

	@Autowired
	private ExerciseService exerciseService;
	
    // 메인페이지 -> 홈트페이지 이동
    @RequestMapping(value = "/main/exercise")
    public ModelAndView exercise() {
    	System.out.println("Exercise Controller");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("exercise/exercise_main");
    	
    	List<Exercise> list = new ArrayList<>();
    	list = (List<Exercise>) exerciseService.getExerciseByViews();
    	System.out.println(list.size());
    	System.out.println(list.get(0).getExercise_title());
    	mav.addObject("today_exercise", list);
    	
		return mav;
    }
    
}
