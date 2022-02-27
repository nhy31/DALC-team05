package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.ExerciseDao;
import dongduk.dalc05.aah.domain.Exercise;

@Service
public class ExerciseServiceImpl implements ExerciseService{

	@Autowired
	private ExerciseDao exerciseDao;
	
	@Override
	public List<Exercise> getExerciseByViews() {
		return exerciseDao.getExerciseByViews();
	}

	@Override
	public List<Exercise> getExerciseBySick(int sick_code) {
		return exerciseDao.getExerciseBySick(sick_code);
	}

	@Override
	public List<Exercise> getExerciseByKeyword(String keyword) {
		return exerciseDao.getExerciseByKeyword(keyword);
	}

	@Override
	public Exercise getExerciseByCode(int exercise_code) {
		return exerciseDao.getExerciseByCode(exercise_code);
	}

}
