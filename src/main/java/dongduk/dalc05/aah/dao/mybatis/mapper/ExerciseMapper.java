package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Exercise;

@Mapper
public interface ExerciseMapper {
	
	//조회순으로 데이터 불러오기
	List<Exercise> getExerciseByViews();
	
	//질병 별로 데이터 불러오기
	List<Exercise> getExerciseBySick(int sick_code);
	
	//키워드로 데이터 불러오기
	List<Exercise> getExerciseByKeyword(String keyword);
}
