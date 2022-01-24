package dongduk.dalc05.aah.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 홈트관련컨트롤러
@Controller
public class ExerciseController {

    // 메인페이지 -> 홈트페이지 이동
    @RequestMapping(value = "/main/exercise")
    public String exercise() {
		return "exercise/list";
    }
    
}
