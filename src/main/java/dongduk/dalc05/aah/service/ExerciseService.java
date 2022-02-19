package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Exercise;

public interface ExerciseService {
	
	//조회 순으로 홈트데이터 가져오기
	public List<Exercise> getExerciseByViews();
	
	//질병코드 별로 홈트데이터 가져오기
	public List<Exercise> getExerciseBySick(int sick_code);
	
	//키워드 포함된 홈트데이터 가져오기
	public List<Exercise> getExerciseByKeyword(String keyword);
}
