package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.SickDao;
import dongduk.dalc05.aah.domain.Sick;

@Service
public class SickServiceImpl implements SickService {

	@Autowired
	private SickDao sickDao;
	
	// sick_code로 질병이름 불러오기
	@Override
	public String getSickName(int sick_code) {
		return sickDao.getSickName(sick_code);
	}

	// sick_name으로 질병코드 불러오기
	@Override
	public int getSickCode(String sick_name) {
		// TODO Auto-generated method stub
		return sickDao.getSickCode(sick_name);
	}
	
	// sickName 전체 불러오기
	@Override
	public List<Sick> getSickNameList() {
		return sickDao.getSickNameList();
	}

}
