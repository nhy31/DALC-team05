package dongduk.dalc05.aah.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import dongduk.dalc05.aah.service.MyBoxService;

@Controller
public class MyBoxController {
	
//	@Autowired
//	private MyBoxService myboxService;
	
	// 보관함 페이지
	@RequestMapping(value = "/member/mybox")
	public ModelAndView mybox() {
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
		
	// 저장하기
	
	// 
	
}
