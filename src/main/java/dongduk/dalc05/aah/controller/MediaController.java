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
    	
    	while (page < 20) { 
    		
    		String url = "	https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=" + query;
    		
    		System.out.println(url);
    		
    		Document rawData = Jsoup.connect(url).get(); //웹에서 내용을 가져온다.
    		
    		Elements contents = doc.select(".class #id"); Elements contents = doc.select(".class #id");
    			
    		
    	}
    	
    		
    		
  
    		
    			
    		 Elements blogOption = rawData.select("dl dt");
             String realURL = "";
             String realTITLE = "";
  
             for (Element option : blogOption) {
                 realURL = option.select("a").attr("href");
                 realTITLE = option.select("a").attr("title");
                 System.out.println(realTITLE);
                 al1.add(realURL);
                 al2.add(realTITLE);
             }
             page += 10;
             
             
    		Document doc = Jsoup.connect(url).get();
    		Elements elements = doc.getElementsByAttributeValue("class", "list_body news
    		Element element = elements.get(0);
    		Elements photoElements = element.getElementsByAttributeValue("class", "photo
    		for(int i=0; i<photoElements.size(); i++) {
    		Element articleElement = photoElements.get(i);
    		Elements aElements = articleElement.select("a");
    		Element aElement = aElements.get(0);
    		String articleUrl = aElement.attr("href"); // 기사링크
    		Element imgElement = aElement.select("img").get(0);
    		String imgUrl = imgElement.attr("src"); // 사진링크
    		String title = imgElement.attr("alt"); // 기사제목
    		Document subDoc = Jsoup.connect(articleUrl).get();
    		Element contentElement = subDoc.getElementById("articleBodyContents");
    		String content = contentElement.text(); // 기사내용
    		System.out.println(title);
    		System.out.println(content);
    		System.out.println();
    		}
    		System.out.println(j + "page 크롤링 종료");
    		}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
        Date currentTime = new Date();
 
        String dTime = formatter.format(currentTime);
        String e_date = dTime;
 
        currentTime.setDate(currentTime.getDate() - 1);
        String s_date = formatter.format(currentTime);
 
        String query = "성북구";
        String s_from = s_date.replace(".", "");
        String e_to = e_date.replace(".", "");
        int page = 1;
        ArrayList<String> al1 = new ArrayList<>();
        ArrayList<String> al2 = new ArrayList<>();
 
        while (page < 20) {
            String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
                    + "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
                    + Integer.toString(page);
            Document rawData = Jsoup.connect(address).timeout(5000).get();
            System.out.println(address);
            Elements blogOption = rawData.select("dl dt");
            String realURL = "";
            String realTITLE = "";
 
            for (Element option : blogOption) {
                realURL = option.select("a").attr("href");
                realTITLE = option.select("a").attr("title");
                System.out.println(realTITLE);
                al1.add(realURL);
                al2.add(realTITLE);
            }
            page += 10;
        }
        model.addAttribute("urls", al1);
        model.addAttribute("titles", al2);
 
        return "news/news";
    }
}