package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.RecipeService;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class RecipeController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping(value="/main/recipe/crawling")
	public String startCrawl(Model model,
		  HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		int member_code = memberService.getMemberCode(member_id);
		int sick_code = memberService.getMemberInfo(member_code).getSick_code();
		
		List<String> q = recipeService.getIngredients(sick_code);
		
		for(int j=0; j<q.size(); j++) {
			
			String query = q.get(j);
			
			System.out.println("추천재료 : " + query);
			
			String realURL = "";
			String image = "";
			String title = "";
			String length = "";
			
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
			    //System.out.println("만개" + realURL);
			    String url = "https://www.10000recipe.com" + realURL;
			    Connection conn2 = Jsoup.connect(url);
			    Document rawData2 = conn2.get();
			    Elements contents2 = rawData2.select("div[class=\"col-xs-9\"]");
			    
			    for (Element option2 : contents2) {
			    	image = option2.select("div[class=\"centeredcrop\"]").select("img").attr("src");
			        System.out.println("만개의레시피크롤링중 image " + image);
			        		
			    	title = option2.select("div[class=\"view2_summary st3\"]").select("h3").toString();
			        title = title.replace("<h3>", "").replace("</h3>", "");
			        System.out.println("만개의레시피크롤링중 title: " + title);

			        length = option2.select("span[class=\"view2_summary_info2\"]").toString();
			        length = length.replace("<span class=\"view2_summary_info2\">", "").replace("</span>", "");
			        System.out.println("만개의레시피크롤링중 length " + length);
			   
			        Recipe r = new Recipe();
			        r.setRecipe_img(image);
			        r.setRecipe_title(title);
			        r.setRecipe_length(length);
			        r.setSick_code(sick_code);
			       
			        r.setRecipe_code(Integer.parseInt(realURL.toString().replace("/recipe/", "")));
			        
			        //recipeService.insertRecipe(r);
			           
			        ArrayList<rUse> uses = new ArrayList<>();
			        ArrayList<Recipe> recipes = new ArrayList<>();
			        
			        Elements u = option2.select("ul[class=\"case1\"]").select("a").select("li");
			        System.out.println("만개의레시피크롤링중 재료들 ");
			        for(Element use : u) {
			        	String str = use.toString().replace("<li>", "");
			        	String str1 = str.substring(0, str.indexOf("<"));
			        			
			        	String str2 =  use.select("span").toString().replace("<span class=\"ingre_unit\">", "");
			        	String str3 = str2.substring(0, str2.indexOf("<"));
			        	str1 += str3;
			        	System.out.println(str1);
			        	
			        	rUse result = new rUse();
			        	result.setrUse_use(str1);
			        	result.setRecipe_code(r.getRecipe_code());
			        	
			        	//System.out.println(r.getRecipe_code());
			        	//System.out.println(result.getRecipe_code());
			        	
			        	//recipeService.insertUse(result);
			        			
			        	uses.add(result);
			        }
			        
			        Elements u2 = option2.select("div[class=\"view_step\"]");
			        System.out.println("만개의레시피크롤링중 순서");
			        int i = 1;
			        for(Element use : u2) {
			        	String str = use.select("div[class=\"media-body\"]").toString();
			        	
//			        	1 <div id="stepdescr1" class="media-body">
//			        	 옥수수콘는 체에 밭쳐 물기를 뺀다.
//			        	</div>
//			        	<div id="stepdescr2" class="media-body">
//			        	 볼에 옥수수콘, 허니머스타드, 마요네즈, 모짜렐라치즈, 후추를 넣고 섞는다.
//			        	</div>
//			        	<div id="stepdescr3" class="media-body">
//			        	 모닝빵은 가운데를 파낸다.
//			        	</div>
//			        	<div id="stepdescr4" class="media-body">
//			        	 모닝빵에 2를 넣는다.
//			        	</div>
//			        	<div id="stepdescr5" class="media-body">
//			        	 에어프라이어 바스켓에 넣고 180도 온도에서 10분간 구워 완성한다.
//			        	 <p class="step_add add_tool">에어프라이어</p>
//			        	</div>
			        	
			        	
			        	// System.out.println(r.getRecipe_code());
			        
			        	// String str1 = str.spl;
			        	System.out.println(i + " " + str);
			        	
			        	rOrder result = new rOrder();
			        	result.setRecipe_code(r.getRecipe_code());
			        	result.setrOrder_num(i);
			        	
			        	i++;
			        	//recipeService.insertOrder(null)
			        }
			   
			    }
			    	        	
		    }
			
			
		}
		
	    //model.addAttribute("recipes", recipes);
		     
		return "recipe/list";
	}
}
