package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.MyBoxDao;
import dongduk.dalc05.aah.domain.MyBox;

@Service
public class MyBoxServiceImpl implements MyBoxService {

	@Autowired
	private MyBoxDao myBoxDao;
	
	// 사용자의 box list
	@Override
	public List<MyBox> getAllList(int member_code) {
		return myBoxDao.getAllList(member_code);
	}
		
	// 보관함에 저장하기
	@Override
	public void insertMyBox(MyBox box) {
		myBoxDao.insertMyBox(box);
	}
		
	// 보관함에서 삭제하기
	@Override
	public void deleteMyBox(MyBox box) {
		myBoxDao.deleteMyBox(box);
	}
	
}
