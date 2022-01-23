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
import dongduk.dalc05.aah.service.CrawlingService;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class RecipeController {
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService commuService;
	
	@Autowired
	private CrawlingService crawlingService;
	
	
	@RequestMapping(value="/main/recipe/crawling")
	public String startCrawl(Model model,
		  HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		int member_code = memberService.getMemberCode(member_id);
		int sick_code = memberService.getMemberInfo(member_code).getSick_code();
		
		String query = crawlingService.getIngredients(sick_code);
		
		String realURL = "";
		String image = "";
		String title = "";
		ArrayList<String> images = new ArrayList<>();
				
		 // 1. 수집 대상 URL
		String start = "https://www.10000recipe.com/recipe/list.html?q=" + query;
        // 2. Connection 생성
        Connection conn = Jsoup.connect(start);
        // 3. HTML 파싱.
        Document rawData = conn.get();
        // 4. 요소 탐색
        Elements contents = rawData.select("li");
        
        for (Element option : contents) {
        	realURL = option.select("a").attr("href");
        	String url = "https://www.10000recipe.com" + realURL;
        	rawData = Jsoup.connect(url).get();
        	contents = rawData.select("div[id=\"contents_area\"]");
        	for (Element option2 : contents) {
        		image = option2.select("img").attr("src");
        		// title = option2.select("h3");
        		//view2_summary_info2
        		//view2_summary_info3
        		System.out.println("만개의레시피크롤링중" + image);
        		images.add(image);
        	}
        	
        }
        
        model.addAttribute("image", image);
        
        
        return "recipe/list";

	}}
