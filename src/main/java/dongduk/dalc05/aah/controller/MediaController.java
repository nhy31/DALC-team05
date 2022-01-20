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
 
    @RequestMapping(value = "crawling", method = RequestMethod.GET)
    public String startCrawl(Model model) throws IOException {
 
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
