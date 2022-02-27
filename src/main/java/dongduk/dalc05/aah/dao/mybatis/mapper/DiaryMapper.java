package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Diary;
@Mapper
public interface DiaryMapper {
	
	// 내 다이어리 불러오기
	List<Diary> getMyDiary(int member_code);
	
	// 일기 삽입
	void insertDiary(Diary d);
	
	// 일기 삭제
	void deleteDiary(int diary_code);
}
