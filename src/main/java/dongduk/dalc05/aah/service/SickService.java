package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Sick;

public interface SickService {
	
	// 전체 불러오기
	public List<Sick> getSickList();
	
	// sick_code로 질병이름 불러오기
	public String getSickName(int sick_code);

	// sick_name으로 질병코드 불러오기
	public int getSickCode(String sick_name);
	
}
