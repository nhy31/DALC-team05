package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.MyBox;

public interface MyBoxService {

	// 사용자의 box list
	public List<MyBox> getAllList(int member_code);
	
	// 보관함에 저장하기
	public void insertMyBox(MyBox box);
	
	// 보관함에서 삭제하기
	public void deleteMyBox(int myBox_code, int member_code);
}
