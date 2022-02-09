package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.MyBoxDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.MemberMapper;
import dongduk.dalc05.aah.dao.mybatis.mapper.MyBoxMapper;
import dongduk.dalc05.aah.domain.MyBox;

@Repository
public class MyBoxDaoImpl implements MyBoxDao {
	
	@Autowired
	private MyBoxMapper myBoxMapper;
	
	// 사용자의 box list
	@Override
	public List<MyBox> getAllList(int member_code) {
		return myBoxMapper.getAllList(member_code);
	}
	
	// 보관함에 저장하기
	@Override
	public void insertMyBox(MyBox box) {
		myBoxMapper.insertMyBox(box);
	}
	
	// 보관함에서 삭제하기
	@Override
	public void deleteMyBox(MyBox box) {
		myBoxMapper.deleteMyBox(box);
	}
}
