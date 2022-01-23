package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class RecipeController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService commuService;
	
	
	@RequestMapping(value="/main/recipe/crawling")
	public String startCrawl(Model model,
		  HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		int member_code = memberService.getMemberCode(member_id);
		int sick_code = memberService.getMemberInfo(member_code).getSick_code();
		return member_id;
		
		//String query = crawlingService.getIngredients(sick_code);
		
		 // 1. 수집 대상 URL
		//String URL = "https://haemukja.com/recipes?utf8=%E2%9C%93&sort=rlv&name=" + query;
        
        // 2. Connection 생성
        //Connection conn = Jsoup.connect(URL);
        
        // 3. HTML 파싱.
        //Document html = conn.get();
    	
        // 4. 요소 탐색
        // 4-1. Attribute 탐색
        
        //Elements contents = html.select(".li > a");
        
        
        
        
        
        

	}}
