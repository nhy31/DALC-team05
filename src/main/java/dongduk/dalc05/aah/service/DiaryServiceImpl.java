package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.DiaryDao;
import dongduk.dalc05.aah.domain.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDao diaryDao;
	
	@Override
	public List<Diary> getMyDiary(int member_code) {
		// TODO Auto-generated method stub
		return diaryDao.getMyDiary(member_code);
	}

	@Override
	public void insertDiary(Diary d) {
		diaryDao.insertDiary(d);
	}

	@Override
	public void deleteDiary(int diary_code) {
		diaryDao.deleteDiary(diary_code);
	}

}
