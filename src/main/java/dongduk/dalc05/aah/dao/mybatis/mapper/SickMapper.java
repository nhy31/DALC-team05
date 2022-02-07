package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Sick;

@Mapper
public interface SickMapper {
	
	// 전체 불러오기
	List<Sick> getSickList();
	
	// sick_code로 질병이름 불러오기
	String getSickName(int sick_code);

	// sick_name으로 질병코드 불러오기
	int getSickCode(String sick_name);

}
