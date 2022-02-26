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
import org.python.core.PyFunction;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Ingredient;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;
import dongduk.dalc05.aah.service.CommunityService;
import dongduk.dalc05.aah.service.RecipeService;
import dongduk.dalc05.aah.service.SickService;
import dongduk.dalc05.aah.util.PagingVO;
import dongduk.dalc05.aah.service.MemberService;

@Controller
public class RecipeController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RecipeService recipeService;

	@Autowired
	private SickService sickService;
	
	private static PythonInterpreter interpreter;
	
	// 
    @RequestMapping(value = "/recipe/all")
    public ModelAndView recipeAll(
    		HttpServletRequest request) {
     	ModelAndView mav = new ModelAndView();
  	    mav.setViewName("recipe/recipe_all");
  	    
  	    List<Recipe> list = recipeService.getAllRecipes();
  	    mav.addObject("list", list);
  	    return mav;
    }
	
    // 메인페이지 -> 레시피페이지 이동
    @RequestMapping(value = "/recipe")
    public ModelAndView recipe(
    		HttpServletRequest request) {
    	
    	ModelAndView mav = new ModelAndView();
  	    mav.setViewName("recipe/recipe_main");
  	    
  	    HttpSession session = request.getSession();
 	    Member member = (Member) session.getAttribute("loginMember");
 	    
 	    int mSickCode = 0;
 	    
 	    // 로그인 한 경우
 	    if(member != null) {
 	    	mSickCode = member.getSick_code();
 	    	List<Ingredient> list = recipeService.getIngredients(mSickCode);
 	  	    List<Recipe> recipes = new ArrayList<>();
 	  	    for(int i=0; i<list.size(); i++) {
 	  	    	System.out.println("재료명" + list.get(i).getIngredient_name());
 	  	    	List<Recipe> r = recipeService.getRecipes(list.get(i).getIngredient_name());
 	  	    	if(r != null) {
 	  	    		
 	  	    		for(int j=0; j<r.size(); j++) {
 	  	  	    		System.out.println("레시피명" + r.get(j).getRecipe_title());
 	  	  	    		recipes.add(r.get(j));
 	  	  	    	}
 	  	  	    }
 	  	    }
 	  	    	
 	  	    mav.addObject("recipes", recipes);
 	    }
 	    
 	    // 로그인 안한 경우 (member == null, mSickCode == 0)
 	    else {
 	  	    List<Recipe> recipes = recipeService.getAllRecipes();
 	  	    for(int i=0; i<recipes.size(); i++) 
 	  	  	    System.out.println("레시피명 " + recipes.get(i).getRecipe_title());
 	  	    mav.addObject("recipes", recipes);
 	    }
 	    
  	    List<Sick> sicks = sickService.getSickList();
  		for(int i=0; i<sicks.size(); i++) {
    		if(sicks.get(i).getSick_code() ==  mSickCode) {
    			sicks.get(i).setChecked(1);
    			break;
    		}	
    	}
  	    mav.addObject("sicks", sicks);
  	    
  	    List<Recipe> bests = recipeService.getTop16();
  	    mav.addObject("bests", bests);

  	    
		return mav;
    }
    
    // 메인페이지 -> 레시피페이지 이동
    @RequestMapping(value = "/recipe/sick")
    public ModelAndView sickChoice(
    		HttpServletRequest request,
    		@RequestParam ("sick_code") int sick_code) {
    	
    	ModelAndView mav = new ModelAndView();
  	    mav.setViewName("recipe/recipe_main");
  	    
  	    List<Sick> sicks = sickService.getSickList();
  		for(int i=0; i<sicks.size(); i++) {
    		if(sicks.get(i).getSick_code() ==  sick_code) {
    			sicks.get(i).setChecked(1);
    			break;
    		}	
    	}
  	    mav.addObject("sicks", sicks);
  	    
  	    List<Recipe> bests = recipeService.getTop16();
  	    mav.addObject("bests", bests);

	    
 	
 	    List<Ingredient> list = recipeService.getIngredients(sick_code);
 	  	List<Recipe> recipes = new ArrayList<>();
 	  	for(int i=0; i<list.size(); i++) {
 	  	    	
 	  		System.out.println("재료명" + list.get(i).getIngredient_name());
 	  	    	
 	  		List<Recipe> r = recipeService.getRecipes(list.get(i).getIngredient_name());
 	  	    	
 	  		if(r != null) {
 	  	    		
 	  			for(int j=0; j<r.size(); j++) {
 	  	  	    		
 	  				System.out.println("레시피명" + r.get(j).getRecipe_title());
 	  	  	    		
 	  				recipes.add(r.get(j));
 	  	  	    	
 	  			}
 	  	  	    
 	  		}
 	  	   
 	  	}
 	  	    	
 	  	mav.addObject("recipes", recipes);
 	    	
 	    

		return mav;
    }
    
    @RequestMapping(value="/recipe/recipe_detail")
    public ModelAndView getTest(
    		@RequestParam ("recipe_code") int recipe_code) {
    	
    	ModelAndView mav = new ModelAndView();
    	recipeService.hitsCount(recipe_code);
    	Recipe clickRecipe = recipeService.getRecipeFromCode(recipe_code);
    	clickRecipe.setUses(recipeService.getUses(recipe_code));
    	clickRecipe.setOrders(recipeService.getOrders(recipe_code));
    	
    	mav.addObject("clickRecipe", clickRecipe);
    	
    	//입력받은 recipecode -> 하윤 toString으로 변환 추가
    	String inputData = Integer.toString(recipe_code); 
    	System.out.println("인풋데이터" + inputData);
    	
        interpreter = new PythonInterpreter();
        
        // 자카드 유사도 함수
        interpreter.exec("def jaccard_similarity(s1, s2):\n"+
        				"	s1 = set(s1)\n"+
        				"	s2 = set(s2)\n"+
        				"	return float(len(s1 & s2)) / float(len(s1 | s2))");
        
        interpreter.exec("import csv");

        // 파일 read
//      interpreter.exec("f = open('./src/main/resources/csv/recipes.csv', 'r')"); //상대경로 (상대경로 안되면 절대경로로 한번 바꿔서 해보세요)
        interpreter.exec("f = open('/Users/user/git/DALC-team05/src/main/resources/csv/recipes.csv', 'r')"); //절대경로(본인컴퓨터에 맞춰서 변경)
//      interpreter.exec("f = open('/Users/shpar/git/DALC-team05//src/main/resources/csv/recipes.csv', 'r')"); //상대경로 (상대경로 안되면 절대경로로 한번 바꿔서 해보세요)
//        interpreter.exec("f = open('/git/DALC-team05/src/main/resources/csv/recipes.csv', 'r')"); //절대경로(본인컴퓨터에 맞춰서 변경)

        interpreter.exec("reader = csv.reader(f)");
    	interpreter.exec("header = next(reader)");
    	
    	// recipecode로 해당 내용 찾아서 input배열로 만듦 
    	interpreter.exec("input = list()");
    	interpreter.exec("i = 0");
   		interpreter.exec("for row in reader:\n" +
   						"#	print(row)\n"+
   						"	if row[0] == str(" + inputData + "): \n" +
   						"		input = row \n" + 
   						"		break\n" +
						"	i+=1");
   		interpreter.exec("#print(input)");
//   		PyObject o = interpreter.eval("input"); 
//   		System.out.println("input: "+o.toString());
   		interpreter.exec("f.close()");
   		
   	// 파일 read
        interpreter.exec("f = open('/Users/shpar/git/DALC-team05//src/main/resources/csv/recipes.csv', 'r')"); //상대경로 (상대경로 안되면 절대경로로 한번 바꿔서 해보세요)
//          interpreter.exec("f = open('/git/DALC-team05/src/main/resources/csv/recipes.csv', 'r')"); //절대경로(본인컴퓨터에 맞춰서 변경)
        
   		interpreter.exec("reader = csv.reader(f)");
    	interpreter.exec("header = next(reader)");
    	// recipe_list: recipe csv파일에 있는 레시피들에 대한 리스트
    	// sim_list: 각 레시피에 대한 자카드 유사도를 담은 리스트
    	interpreter.exec("recipe_list = list()");
        interpreter.exec("sim_list = list()");
        
        // csv파일을 한줄씩 읽은 뒤 자카드 유사도 계산 후 리스트에 저장
   		interpreter.exec("i = 0");
   		interpreter.exec("for row in reader:\n" +
   						"	recipe_list.append(row)\n" +
   						"#	print(recipe_list[i])\n" +
   						"	sim_list.append(jaccard_similarity(row, input))\n" +
   						"#	print(sim_list[i])\n"+
   						"	i+=1");
   		
   		interpreter.exec("f.close()");
   		
   		// 유사도 상위 5개 (본인 포함 6개) 인덱스 추출
   		interpreter.exec("top = sorted(range(len(sim_list)), key=lambda i: sim_list[i])[-6:]");
   		interpreter.exec("#print(top)");
   		
//   		PyObject ob = interpreter.eval("top"); 
//   		System.out.println("상위1: "+ob.toString());
   		
//   		// 본인을 제외한 유사도 상위 레시피 5개
   		interpreter.exec("result = []\n");
   		
   		interpreter.exec("for k in top:\n"
   						+"#	print(k)\n"
   						+"#	print(recipe_list[k])\n"
   						+"	if recipe_list[k][0] != input[0]:\n"
   						+"#		print(recipe_list[k])\n"
   						+"		result.append(recipe_list[k][0])\n"
   						+"#		print(recipe_list[k][0])\n");
 
   		
   		//obj에 들어있는 list가 추천 된 레시피코드
   		PyObject obj = interpreter.eval("result[:5]");
//   		System.out.println("result: "+obj.toString());
		
   		//recipeCode는 5가지 유사한 recipecode가 들어있는 배열 
		String[] recipeCode = obj.toString().split("', '");
		recipeCode[0] = recipeCode[0].split("'")[1];
		recipeCode[4] = recipeCode[4].split("'")[0];
		
		List<Recipe> relatedList = new ArrayList<>();
		int i=0;
		// 하윤추가 WEB띄우기
		for (String code : recipeCode ){
			
			System.out.println(code);
			int realCode = Integer.parseInt(code);
			relatedList.add(recipeService.getRecipeFromCode(realCode));
			System.out.println("0226확인 " + relatedList.get(i).getRecipe_title());
			i++;
			
		}
		mav.addObject("relatedList", relatedList);
		return mav;
    }
	
	@RequestMapping(value="/main/recipe/crawling")
	public String startCrawl(Model model,
		  HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		int sick_code = 0; // 로그인상태X -> default : 감기 
		
		if (member_id != null) {
			// 로그인상태 O
			int member_code = memberService.getMemberCode(member_id);
			sick_code = memberService.getMemberInfo(member_code).getSick_code();
			
		}
		
		List<Ingredient> q = recipeService.getIngredients(sick_code);
		  
		ArrayList<Recipe> recipes = new ArrayList<>();
		
//		for(int j=0; j<q.size(); j++) {
//			
//			String query = q.get(j);
//			
//			System.out.println("추천재료 : " + query);
//			
//			String realURL = "";
//			String image = "";
//			String title = "";
//			String amount = ""; 
//			String length = "";
//			String level = "";
//			
//			// 1. 수집 대상 URL
//			String start = "https://www.10000recipe.com/recipe/list.html?q=" + query;
//		    // 2. Connection 생성
//		    Connection conn = Jsoup.connect(start);
//		    // 3. HTML 파싱.
//		    Document rawData = conn.get();
//		    // 4. 요소 탐색
//		    Elements contents = rawData.select("ul[class=\"rcp_m_list2\"]").select("li[class=\"common_sp_list_li\"]");
//		        	
//
//		    for (Element option : contents) {
//		    	realURL = option.select("a").attr("href");
//			    //System.out.println("만개" + realURL);
//			    String url = "https://www.10000recipe.com" + realURL;
//			    Connection conn2 = Jsoup.connect(url);
//			    Document rawData2 = conn2.get();
//			    Elements contents2 = rawData2.select("div[class=\"col-xs-9\"]");
//			    
//			    for (Element option2 : contents2) {
//			    	image = option2.select("div[class=\"centeredcrop\"]").select("img").attr("src");
//			        System.out.println("만개의레시피크롤링중 image " + image);
//			        		
//			    	title = option2.select("div[class=\"view2_summary st3\"]").select("h3").toString();
//			        title = title.replace("<h3>", "").replace("</h3>", "");
//			        System.out.println("만개의레시피크롤링중 title: " + title);
//
//			        amount = option2.select("span[class=\"view2_summary_info1\"]").toString();
//			        amount = amount.replace("<span class=\"view2_summary_info1\">", "").replace("</span>", "");
//			        System.out.println("만개의레시피크롤링중 amount " + amount);
//			        
//			        length = option2.select("span[class=\"view2_summary_info2\"]").toString();
//			        length = length.replace("<span class=\"view2_summary_info2\">", "").replace("</span>", "");
//			        System.out.println("만개의레시피크롤링중 length " + length);
//			        
//			        level = option2.select("span[class=\"view2_summary_info3\"]").toString();
//			        level = level.replace("<span class=\"view2_summary_info3\">", "").replace("</span>", "");
//			        System.out.println("만개의레시피크롤링중 난이도 " + level);
//			   
//			        Recipe r = new Recipe();
//			        r.setRecipe_img(image);
//			        r.setRecipe_title(title);
//			        r.setRecipe_length(length);
//			        r.setSick_code(sick_code);
//			        r.setRecipe_level(level);
//			        r.setRecipe_amount(amount);
//			        recipes.add(r);
//			        
//			        r.setRecipe_code(Integer.parseInt(realURL.toString().replace("/recipe/", "")));
//			        
//			       // recipeService.insertRecipe(r);
//			           
//			     
//			        Elements u = option2.select("ul[class=\"case1\"]").select("a").select("li");
//			        System.out.println("만개의레시피크롤링중 재료들 ");
//			        for(Element use : u) {
//			        	String str = use.toString().replace("<li>", "");
//			        	String str1 = str.substring(0, str.indexOf("<"));
//			        			
//			        	String str2 =  use.select("span").toString().replace("<span class=\"ingre_unit\">", "");
//			        	String str3 = str2.substring(0, str2.indexOf("<"));
//			        	str1 += str3;
//			        	System.out.println(str1);
//			        	
//			        	rUse result = new rUse();
//			        	result.setrUse_use(str1);
//			        	result.setRecipe_code(r.getRecipe_code());
//			        	
//			        	//System.out.println(r.getRecipe_code());
//			        	//System.out.println(result.getRecipe_code());
//			        	
//			        	//recipeService.insertUse(result);
//			        			
//			        }
//			        
//			        Elements u2 = option2.select("div[class=\"view_step\"]").select("div[class=\"media-body\"]");
//			        System.out.println("만개의레시피크롤링중 순서");
//			        int i = 1;
//			        for(Element use : u2) {
//	
//			        	String str = use.toString();
//			        	
//			        	str = str.substring(str.indexOf(">")+1);
//			        	str = str.substring(0, str.indexOf("</div>"));
//			        	
//			        	if (str.contains("<p")) {
//			        		str = str.substring(0, str.indexOf("<p"));
//			        	}
//			        	
//			        	String[] s = str.split("<br>");
//			        	
//			        	
//			        	rOrder result = new rOrder();
//			        	result.setRecipe_code(r.getRecipe_code());
//			        	result.setrOrder_num(i);
//			        	
//			        	String s2 = "";
//			        	for(int k=0; k<s.length; k++) {
//			        		s2 += s[k];
//			        	}
//			        	result.setrOrder_content(i + s2);
//			        	
//			        	System.out.println(s2);
//			        	
//			        	//recipeService.insertOrder(result);
//			        	 	
//			        	i++;
//			        	
//			        }
//			   
//			    }
//			    	        	
//		    }
			
			
//		}
		
	    model.addAttribute("recipes", recipes);
		System.out.println("검사");
		return "recipe/list";
	}
}
