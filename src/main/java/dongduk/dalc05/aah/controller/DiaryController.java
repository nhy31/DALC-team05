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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Diary;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.DiaryService;
import dongduk.dalc05.aah.util.ImageUtil;
@Controller
public class DiaryController {
	   
	@Autowired
	private DiaryService diaryService;
	
	@Autowired
	private ImageUtil imageUtil; 
	
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
	
	@RequestMapping(value = "/member/diary/upload")
	public ModelAndView diaryWrite(
			@RequestParam (value="recipe_title", required = false) String recipe_title) {
		
		ModelAndView mav = new ModelAndView();
		
		Date now = new Date();
		mav.addObject("now", now);
		mav.addObject("memo", recipe_title);
		mav.setViewName("member/diaryUpload");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/member/diary/insert")
	public ModelAndView diaryInsert(
			HttpServletRequest request,
			Model model,
			@RequestParam ("diary_title") String diary_title,
			@RequestParam ("diary_content") String diary_content,
			MultipartFile img_file) {

		System.out.println("uasdasae");
		// @RequestParam ("recipe_code") int recipe_code,
		String diary_image = imageUtil.uploadImage(request, img_file);
		System.out.println("uploadPost member_image : " + diary_image);
	
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		
		int member_code = m.getMember_code();
		
		Date diary_date = new Date();
		
		Diary d = new Diary(member_code, diary_date,  diary_title, diary_content, diary_image);
		
		diaryService.insertDiary(d);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/diary");
		return mav;
	}
	
	@RequestMapping(value = "/member/diary/delete")
	public ModelAndView diaryDelete(
			HttpServletRequest request,
			Model model,
			@RequestParam ("diary_code") int diary_code) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/diary");
		
		diaryService.deleteDiary(diary_code);
		
		return mav;
	}	
}
