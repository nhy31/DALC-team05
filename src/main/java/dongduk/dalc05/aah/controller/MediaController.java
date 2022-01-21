package dongduk.dalc05.aah.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.*;
import java.text.*;
 
@Controller
public class MediaController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    public static HashMap<String, String> map;
 
    @RequestMapping(value="/main/media/crawling", method=RequestMethod.GET)
    public String startCrawl(Model model) throws IOException {

    	
    	String query = "허리디스크"; // 카테고리선택, 우선 허리디스크로 입력함, 리케스트 파라미터써서 질병코드,이름 받아오자
    	int page = 1;
    	ArrayList<String> urls = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();
        ArrayList<String> images = new ArrayList<>();
    	
    	while (page < 20) { 
    		
    		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
    		System.out.println(url);
    		
    		Document rawData = Jsoup.connect(url).get(); //웹에서 내용을 가져온다.
    	    Elements contents = rawData.select("li[class=\"bx\"]");
            String realURL = "";
            String realTITLE = "";
            String realIMAGE = "";
 
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
}
    	