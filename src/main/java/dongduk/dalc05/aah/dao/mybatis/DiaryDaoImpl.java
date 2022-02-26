package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.DiaryDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.DiaryMapper;
import dongduk.dalc05.aah.domain.Diary;

@Repository
public class DiaryDaoImpl implements DiaryDao {

	@Autowired
	private DiaryMapper diaryMapper;
	
	@Override
	public List<Diary> getMyDiary(int member_code) {
		return diaryMapper.getMyDiary(member_code);
	}

	@Override
	public void insertDiary(Diary d) {
		diaryMapper.insertDiary(d);
	}

	@Override
	public void deleteDiary(int diary_code) {
		diaryMapper.deleteDiary(diary_code);
	}
}
