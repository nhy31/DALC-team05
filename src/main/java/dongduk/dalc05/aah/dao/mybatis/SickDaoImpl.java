package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.SickDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.SickMapper;
import dongduk.dalc05.aah.domain.Sick;

@Repository
public class SickDaoImpl implements SickDao {

	@Autowired
	private SickMapper sickMapper;
	
	// sick_code로 질병이름 불러오기
	@Override
	public String getSickName(int sick_code) {
		return sickMapper.getSickName(sick_code);
	}

	// sick_name으로 질병코드 불러오기
	@Override
	public int getSickCode(String sick_name) {
		return sickMapper.getSickCode(sick_name);
	}

	
	// sickName 전체 불러오기
	@Override
	public List<Sick> getSickNameList() {
		return sickMapper.getSickNameList();
	}

	
}
