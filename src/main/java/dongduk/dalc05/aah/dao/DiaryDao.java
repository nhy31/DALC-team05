package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Diary;

@Repository
public interface DiaryDao {
	
	// 내 다이어리 불러오기
	List<Diary> getMyDiary(int member_code);
	
	// 일기 삽입
	void insertDiary(Diary d);
	
	// 일기 삭제
	void deleteDiary(int diary_code);
	

}
