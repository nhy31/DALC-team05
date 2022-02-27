package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.ExerciseDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.ExerciseMapper;
import dongduk.dalc05.aah.domain.Exercise;

@Repository
public class ExerciseDaoImpl implements ExerciseDao{

	@Autowired
	private ExerciseMapper exerciseMapper;
	
	//조회순 데이터 
	@Override
	public List<Exercise> getExerciseByViews() {
		return exerciseMapper.getExerciseByViews();
	}

	//질병 별 데이터
	@Override
	public List<Exercise> getExerciseBySick(int sick_code) {
		return exerciseMapper.getExerciseBySick(sick_code);
	}

	//홈트 키워드 검색
	@Override
	public List<Exercise> getExerciseByKeyword(String keyword) {
		return exerciseMapper.getExerciseByKeyword(keyword);
	}

	//기본키로 검색
	@Override
	public Exercise getExerciseByCode(int exercise_code) {
		return exerciseMapper.getExerciseByCode(exercise_code);
	}
	

}
