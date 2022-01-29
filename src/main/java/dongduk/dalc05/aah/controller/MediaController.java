package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;

@Controller
public class MediaController {
	
	@Autowired
	private SickService sickService;
	
	@Autowired
	private MemberService memberService;
 
    @RequestMapping(value="/main/media")
    public String startCrawl(Model model,
    		HttpServletRequest request) throws IOException {

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
    	
    	int page = 1;
    	ArrayList<String> urls = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();
        ArrayList<String> images = new ArrayList<>();
    	
    	while (page < 20) { 
    		
    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
    		System.out.println("기사크롤링 start " + url);
    		
    		String realURL = "";
            String realTITLE = "";
            String realIMAGE = "";
             
    		Document rawData = Jsoup.connect(url).get(); //웹에서 내용을 가져온다.
    	    Elements contents = rawData.select("li[class=\"bx\"]");
           
 
            for (Element option : contents) {
                
            	//if (option.className().equals("news_tit")) {
                	realURL = option.select("a").attr("href");
                    realTITLE = option.select("a").attr("title");
                    //System.out.println(realTITLE);
                    urls.add(realURL);
                    titles.add(realTITLE);
            	//}
            		
            	//if (option.className().equals("dsc_thumb")) {
            		realIMAGE = option.select("a").select("img").attr("src");
            		System.out.println(realTITLE + realIMAGE);
            		images.add(realIMAGE);
            		
            	//}
            }
            page += 10;
    	}
            
    	model.addAttribute("urls", urls);
        model.addAttribute("titles", titles);
            
    	return "media/list";
  
    }
    
//    @RequestMapping(value="/main/media", method=RequestMethod.GET)
//    public String crawl2(Model model,
//    		HttpServletRequest request) throws IOException {
//
//    	HttpSession session = request.getSession();
//    	String member_id = (String) session.getAttribute("member_id");
//    	
//    	// 로그인 안하면 '질병:감기'
//    	int mediaQuery = 0;
//    	
//    	// 로그인 상태 O
//    	if(member_id != null) {
//    		int member_code = memberService.getMemberCode(member_id);
//        	Member m = memberService.getMemberInfo(member_code);
//        	mediaQuery = m.getSick_code();
//        	if(mediaQuery == 1) {
//        		mediaQuery = 0;
//        	}
//    	}
//    	
//    	String query = sickService.getSickName(mediaQuery);
//    	
//    	int page = 1;
//    	ArrayList<String> urls = new ArrayList<>();
//        ArrayList<String> titles = new ArrayList<>();
//        ArrayList<String> images = new ArrayList<>();
//    	
//    	while (page < 20) { 
//    		
//    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
//    		System.out.println(url);
//    		
//    		Document rawData = Jsoup.connect(url).get(); //웹에서 내용을 가져온다.
//    	    Elements contents = rawData.select("li[class=\"bx\"]");
//            String realURL = "";
//            String realTITLE = "";
//            String realIMAGE = "";
// 
//            for (Element option : contents) {
//                
//            	//if (option.className().equals("news_tit")) {
//                	realURL = option.select("a").attr("href");
//                    realTITLE = option.select("a").attr("title");
//                    //System.out.println(realTITLE);
//                    urls.add(realURL);
//                    titles.add(realTITLE);
//            	//}
//            		
//            	//if (option.className().equals("dsc_thumb")) {
//            		realIMAGE = option.select("a").select("img").attr("src");
//            		System.out.println(realTITLE + realIMAGE);
//            		images.add(realIMAGE);
//            		
//            	//}
//            }
//            page += 10;
//    	}
//            
//    	model.addAttribute("urls", urls);
//        model.addAttribute("titles", titles);
//            
//    	return "media/list";
//  
//    }
}
    	