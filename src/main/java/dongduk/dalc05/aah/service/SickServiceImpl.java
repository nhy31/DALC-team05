package dongduk.dalc05.aah.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.SickDao;

@Service
public class SickServiceImpl implements SickService {

	@Autowired
	private SickDao sickDao;

	@Override
	public int getSickCode(String sick_name) {
		// TODO Auto-generated method stub
		return sickDao.getSickCode(sick_name);
	}

}
