package dongduk.dalc05.aah.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.CommunityDao;
import dongduk.dalc05.aah.dao.CrawlingDao;

@Service
public class CrawlingServiceImpl implements CrawlingService {
	
	@Autowired
	private CrawlingDao crawlingDao;
	
	public String getIngredients(int sick_code) {
		return crawlingDao.getIngredients(sick_code);
	};

}
