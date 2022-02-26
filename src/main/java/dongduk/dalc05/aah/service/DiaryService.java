package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Diary;

public interface DiaryService {
	
	// 내 다이어리 불러오기
	public List<Diary> getMyDiary(int member_code);
		
	// 일기 삽입
	public void insertDiary(Diary d);
		
	// 일기 삭제
	public void deleteDiary(int diary_code);

}

