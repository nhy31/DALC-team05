package dongduk.dalc05.aah.dao;

import dongduk.dalc05.aah.domain.MyBox;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MyBoxDao {
	
	// 사용자의 box list
	List<MyBox> getAllList(int member_code);
	
	// 보관함에 저장하기
	void insertMyBox(MyBox box);
	
	// 보관함에서 삭제하기
	void deleteMyBox(MyBox box);
}
