package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Exercise;

@Repository
public interface ExerciseDao {

	//조회순으로 정보 가져오기
	List<Exercise> getExerciseByViews();
	
	//질병 별로 정보 가져오기
	List<Exercise> getExerciseBySick(int sick_code);
}
