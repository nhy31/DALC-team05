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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dongduk.dalc05.aah.domain.Media;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;

@Controller
public class MediaController {
	
	@Autowired
	private SickService sickService;
	
	@Autowired
	private MemberService memberService;
 
    @RequestMapping(value="/main/media")
    public ModelAndView startCrawl(Model model,
    		HttpServletRequest request) throws IOException {

    	ModelAndView mav = new ModelAndView();
  	    mav.setViewName("media/list");
  	    
    	// ** 크롤링 1 **
    	// 오늘의 건강 이슈 8개 크롤링 -> 검색키워드 : 건강
    	int i = 1;
    	
    	ArrayList<Media> medias = new ArrayList<>();
    	
    	while (i < 5) { 
    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + "건강";
    		String realURL = "";
            String realTITLE = "";
            String realIMAGE = "";
             
    		Document rawData = Jsoup.connect(url).get(); // 웹에서 내용을 가져온다.
    	    Elements contents = rawData.select("li[class=\"bx\"]"); // 기사1개
           
    	    int cnt = 0;
    	    
            for (Element option : contents) {
                realURL = option.select("a[class=\"news_tit\"]").select("a").attr("href");
                System.out.println("url " + realURL);

                realTITLE = option.select("a[class=\"news_tit\"]").select("a").attr("title");
                System.out.println("title " + realTITLE);
                
            	realIMAGE = option.select("a[class=\"dsc_thumb\"]").select("img[class=\"thumb api_get\"]").attr("src");
            	System.out.println("image " + realIMAGE);

            	Media m = new Media();
            	m.setUrl(realURL);
            	m.setTitle(realTITLE);
            	m.setImage(realIMAGE);
            	medias.add(m);
            	
            	cnt++;
            	if (cnt == 8)
            		break;
            }
          
            i += 10;
    	}
    	
    	
  	    mav.addObject("medias", medias);
  	    
//  	    for(int j=0; j<medias.size(); j++) {
//  	    	Media o = medias.get(j);
//  	    	 System.out.println("테스트중" + o.getImage() + " " + o.getTitle() + " " + o.getUrl());
//  	    }


    	// ** 크롤링 2 **
    	// 질병별 건강 미디어
    	HttpSession session = request.getSession();
    	String member_id = (String) session.getAttribute("member_id");
    	System.out.println("MediaController startCrawl" + member_id);
    	
    	// 로그인 안하면 '질병:감기'
    	int mediaQuery = 0;
    	
    	// 로그인 상태 O
    	if(member_id != null) {
    		System.out.println("크롤링 test " + memberService.getMemberCode(member_id));
    		int member_code = memberService.getMemberCode(member_id);
    		System.out.println("크롤링 test2 " + member_code);
        	
    		mediaQuery = memberService.getMemberInfo(member_code).getSick_code();
       
        	if(mediaQuery == 999) { // 기타 질병 선택한 사람도 '감기'
        		mediaQuery = 0;
        	}
    	}
    	
    	String query = sickService.getSickName(mediaQuery);
    	ArrayList<Media> medias2 = new ArrayList<>();
    	
    	int page = 1;
    	
    	while (page < 10) { 
    		String url2 = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
    		System.out.println("기사크롤링 start " + url2);
    		
    		String realURL2 = "";
            String realTITLE2 = "";
            String realIMAGE2 = "";
             
    		Document rawData2 = Jsoup.connect(url2).get(); // 웹에서 내용을 가져온다.
    	    Elements contents2 = rawData2.select("li[class=\"bx\"]"); // 기사1개
           
            for (Element option : contents2) {
                realURL2 = option.select("a[class=\"news_tit\"]").select("a").attr("href");
                System.out.println("url2 " + realURL2);
                    
                realTITLE2 = option.select("a[class=\"news_tit\"]").select("a").attr("title");
                System.out.println("title2 " + realTITLE2);
                
            	realIMAGE2 = option.select("a[class=\"dsc_thumb\"]").select("img[class=\"thumb api_get\"]").attr("src");
            	System.out.println("image2" + realIMAGE2 + "//");
            	
            	Media m = new Media();
            	m.setUrl(realURL2);
            	m.setTitle(realTITLE2);
            	
            	if(realIMAGE2.equals("")) {
            		m.setImage("noimg.jpg");
            	}
            	else {
            		m.setImage(realIMAGE2);
            	}
            	medias2.add(m);
            }
            page += 10;
    	}
            
	    for(int j=0; j<medias2.size(); j++) {
	    	Media o = medias2.get(j);
	    	System.out.println("테스트중" + o.getImage() + " " + o.getTitle() + " " + o.getUrl());
	    }
	    
	    mav.addObject("medias2", medias2);
	    
	    List<Sick> list = new ArrayList<>();
	    list = sickService.getSickNameList();

	    mav.addObject("sicks", list);
	    mav.addObject("medias2", medias2);
        
    	return mav;
  
    }
}
//    
//    @RequestMapping(value="/main/media/crawling")
//    public String crawl2(
//    		Model model,
//    		HttpServletRequest request,
//    		@RequestParam int sick_code) throws IOException {
//
//    	// ** 크롤링 1 **
//    	// 오늘의 건강 이슈 8개 크롤링 -> 검색키워드 : 건강
//    	int i = 1;
//    	ArrayList<String> urls = new ArrayList<>();
//        ArrayList<String> titles = new ArrayList<>();
//        ArrayList<String> images = new ArrayList<>();
//        
//    	while (i < 8) { 
//    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + "건강";
//    		String realURL = "";
//            String realTITLE = "";
//            String realIMAGE = "";
//             
//    		Document rawData = Jsoup.connect(url).get(); // 웹에서 내용을 가져온다.
//    	    Elements contents = rawData.select("li[class=\"bx\"]"); // 기사1개
//           
//            for (Element option : contents) {
//                realURL = option.select("a[class=\"news_tit\"]").select("a").attr("href");
//                System.out.println("url " + realURL);
//
//                realTITLE = option.select("a[class=\"news_tit\"]").select("a").attr("title");
//                System.out.println("title " + realTITLE);
//                
//                urls.add(realURL);
//                titles.add(realTITLE);
//     
//            	realIMAGE = option.select("a[class=\"dsc_thumb\"]").select("img[class=\"thumb api_get\"]").attr("src");
//            	System.out.println(realIMAGE);
//            	
//            	images.add(realIMAGE);
//            }
//            i += 10;
//    	}
//    	
//      	model.addAttribute("urls1", urls);
//        model.addAttribute("titles1", titles);
//        model.addAttribute("images1", images);
//        
//
//    	// ** 크롤링 2 **
//    	// 질병별 건강 미디어
//    	String query = sickService.getSickName(sick_code);
//    	
//    	int page = 1;
//    	ArrayList<String> urls2 = new ArrayList<>();
//        ArrayList<String> titles2 = new ArrayList<>();
//        ArrayList<String> images2 = new ArrayList<>();
//    	
//    	while (page < 20) { 
//    		
//    		String url2 = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
//    		System.out.println("기사크롤링 start " + url2);
//    		
//    		String realURL2 = "";
//            String realTITLE2 = "";
//            String realIMAGE2 = "";
//             
//    		Document rawData2 = Jsoup.connect(url2).get(); // 웹에서 내용을 가져온다.
//    	    Elements contents2 = rawData2.select("li[class=\"bx\"]"); // 기사1개
//           
//            for (Element option : contents2) {
//                realURL2 = option.select("a[class=\"news_tit\"]").select("a").attr("href");
//                System.out.println("url " + realURL2);
//                    
//                realTITLE2 = option.select("a[class=\"news_tit\"]").select("a").attr("title");
//                System.out.println("title " + realTITLE2);
//                
//            	realIMAGE2 = option.select("a[class=\"dsc_thumb\"]").select("img[class=\"thumb api_get\"]").attr("src");
//            	System.out.println(realIMAGE2);
//            	
//            	urls2.add(realURL2);
//                titles2.add(realTITLE2);
//                images2.add(realIMAGE2);
//            }
//            page += 10;
//    	}
//            
//    	model.addAttribute("urls2", urls2);
//        model.addAttribute("titles2", titles2);
//        model.addAttribute("images2", images2);
//        
//    	return "media/list";
//    }
//}
//    	