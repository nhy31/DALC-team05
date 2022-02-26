package dongduk.dalc05.aah.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Diary;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.DiaryService;

@Controller
public class DiaryController {
	   
	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping(value = "/member/diary")
	public ModelAndView diary(
			HttpServletRequest request,
			   Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/diary");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		  
		List<Diary> list =  diaryService.getMyDiary(m.getMember_code());
		mav.addObject("diarys", list);
		return mav;
	}
	
	@RequestMapping(value = "/member/diary/insert")
	public ModelAndView diaryInsert(
			HttpServletRequest request,
			Model model,
			@RequestParam ("recipe_code") int recipe_code,
			@RequestParam ("diary_content") String diary_content,
			@RequestParam (value = "bloodPressure", required = false) int bloodPressure,
			@RequestParam (value = "bloodSugar", required = false) int bloodSugar) {
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		int member_code = m.getMember_code();
		
		Date diary_date = new Date();
		
		Diary d = new Diary(member_code, diary_date, diary_content,  recipe_code, bloodPressure, bloodSugar);
		
		diaryService.insertDiary(d);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("rediret:/member/diary");
		return mav;
	}
	
	@RequestMapping(value = "/member/diary/delete")
	public ModelAndView diaryDelete(
			HttpServletRequest request,
			Model model,
			@RequestParam ("diary_code") int diary_code) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rediret:/member/diary");
		
		diaryService.deleteDiary(diary_code);
		
		return mav;
	}	
}
