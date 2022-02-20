package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Exercise;
import dongduk.dalc05.aah.domain.Media;
import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.service.ExerciseService;
import dongduk.dalc05.aah.service.RecipeService;

@Controller
public class MainController {
	
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ExerciseService exerciseService;
	
	
	
	// 완료 // 홈 메인페이지 시작
	@RequestMapping(value="/main")
	public ModelAndView main(
			HttpServletRequest request) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		
		/*HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		if (m == null) {
			mav.addObject("ses", 0);
		} 
		else {
			mav.addObject("ses", 1);
			System.out.println("MainController - 로그인성공");

			mav.addObject("member_id", m.getMember_id());
			mav.addObject("member_nickName", m.getMember_nickName());
		}*/
		
		int i = 1;
    	ArrayList<Media> medias = new ArrayList<>();
    	
    	while (i < 5) { 
    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + "건강뉴스";
    		String realURL = "";
            String realTITLE = "";
            String realIMAGE = "";
            String realSOURCE = "";
            String realTIME ="";
             
    		Document rawData = Jsoup.connect(url).get(); // 웹에서 내용을 가져온다.
    	    Elements contents = rawData.select("li[class=\"bx\"]"); // 기사1개
   
    	    int cnt = 0; 
            for (Element option : contents) {
                realURL = option.select("a[class=\"news_tit\"]").select("a").attr("href");
                //System.out.println("url " + realURL);

                realTITLE = option.select("a[class=\"news_tit\"]").select("a").attr("title");
                //System.out.println("title " + realTITLE);
                
            	realIMAGE = option.select("a[class=\"dsc_thumb\"]").select("img[class=\"thumb api_get\"]").attr("src");
            	//System.out.println("image " + realIMAGE);

            	if(realIMAGE.equals("")) {
            		realIMAGE = option.select("a[class=\"dsc_thumb type_video\"]").select("img[class=\"thumb api_get\"]").attr("src");
            	}
            	
            	realSOURCE = option.select("a[class=\"info press\"]").toString();
            	realSOURCE = realSOURCE.substring(realSOURCE.indexOf("</span>")+7);
            	realSOURCE = realSOURCE.substring(0, realSOURCE.indexOf("<"));
            	//System.out.println("source " + realSOURCE);
            	
            	realTIME = option.select("div[class=\"info_group\"]").select("span[class=\"info\"]").toString();
            	realTIME = realTIME.substring(realTIME.indexOf(">")+1);
            	realTIME = realTIME.substring(0, realTIME.indexOf("<"));
            	//System.out.println("time " + realTIME);	
            			
            	Media md = new Media();
            	md.setUrl(realURL);
            	md.setTitle(realTITLE);
            	md.setSource(realSOURCE);
            	md.setTime(realTIME);
            	
            	if(realIMAGE.equals("")) {
            		md.setImage("/images/noimg.jpg");
            	}
            	else {
            		md.setImage(realIMAGE);
            	}

            	medias.add(md);
            	
            	cnt++;
            	if (cnt == 8)
            		break;
            }
            i += 10;
    	}
    	
  	    mav.addObject("medias", medias);
		
		
		return mav;
	}
	
	@RequestMapping(value="/main/search")
	public ModelAndView searchKeyword(HttpServletRequest request,
			@RequestParam ("keyword") String keyword) {
		System.out.println("넘어온 키워드:" + keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.setViewName("main/search");
		
		//레시피 키워드 검색정보
		List<Recipe> recipeList = new ArrayList<>();
		recipeList = recipeService.getRecipeByKeyword(keyword);
		mav.addObject("recipeByKeyword", recipeList);
		
		//홈트 키워드 검색정보
		List<Exercise> exerciseList = new ArrayList<>();
		exerciseList = exerciseService.getExerciseByKeyword(keyword);
    	for(Exercise e: exerciseList) {
    		int views = Integer.parseInt(e.getExercise_views());
    		int view = views / 10000;
    		if(view == 0) {
    			view = views / 1000;
    			e.setExercise_views(view + "천 회");
    		}
    		else
    			e.setExercise_views(view + "만 회");
    	}
		mav.addObject("exerciseByKeyword", exerciseList);
		
		//미디어 키워드 검색정보

		//커뮤 키워드 검색정보
		
		
		//총 검색 개수
		int sum = recipeList.size() + exerciseList.size();
		mav.addObject("sum", sum);
		
		return mav;
	}
}