package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.MyBox;

@Mapper
public interface MyBoxMapper {
	
	// 사용자의 box list
	List<MyBox> getAllList(int member_code);
	
	// 보관함에 저장하기
	void insertMyBox(MyBox box);
	
	// 보관함에서 삭제하기
	void deleteMyBox(MyBox box);
}
