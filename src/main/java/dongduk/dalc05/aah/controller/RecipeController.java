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

import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.RecipeService;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class RecipeController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService commuService;
	
	@Autowired
	private RecipeService crawlingService;
	
	
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
		String length = "";
		
		ArrayList<Recipe> recipes = new ArrayList<>();
		
		
		 // 1. 수집 대상 URL
		String start = "https://www.10000recipe.com/recipe/list.html?q=" + query;
        // 2. Connection 생성
        Connection conn = Jsoup.connect(start);
        // 3. HTML 파싱.
        Document rawData = conn.get();
        // 4. 요소 탐색
        Elements contents = rawData.select("ul[class=\"rcp_m_list2\"]").select("li[class=\"common_sp_list_li\"]");
        	
       
        for (Element option : contents) {
        	realURL = option.select("a").attr("href");
        	System.out.println("만개" + realURL);
        	
        	String url = "https://www.10000recipe.com" + realURL;
        	Connection conn2 = Jsoup.connect(url);
        	Document rawData2 = conn2.get();
        	Elements contents2 = rawData2.select("div[class=\"col-xs-9\"]");
        	
        	for (Element option2 : contents2) {
        		image = option2.select("div[class=\"centeredcrop\"]").select("img").attr("src");
        		System.out.println("만개의레시피크롤링중" + image);
        		
        		title = option2.select("div[class=\"view2_summary st3\"]").select("h3").toString();
        		title = title.replace("<h3>", "").replace("</h3>", "");
        		System.out.println("만개의레시피크롤링중" + title);
        		
        		//length = option2.select();
        		
        
        		Recipe r = null;
        		r.setRecipe_img(image);
        		r.setRecipe_title(title);
        		
        		recipes.add(r);
        
        		
        		
        		
        	
        }
        
        model.addAttribute("recipes", recipes);
  
        }
        return "recipe/list";
	}
	}
