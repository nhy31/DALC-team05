package dongduk.dalc05.aah.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.SickDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.SickMapper;

@Repository
public class SickDaoImpl implements SickDao {

	@Autowired
	private SickMapper sickMapper;
	


	@Override
	public int getSickCode(String sick_name) {
		// TODO Auto-generated method stub
		return sickMapper.getSickCode(sick_name);
	}

}
