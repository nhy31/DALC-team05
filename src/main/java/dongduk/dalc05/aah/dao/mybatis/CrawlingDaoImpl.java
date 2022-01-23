package dongduk.dalc05.aah.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.CrawlingDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.CrawlingMapper;

@Repository
public class CrawlingDaoImpl implements CrawlingDao {
	
	@Autowired
	private CrawlingMapper crawlingMapper;
	
	@Override
	public String getIngredients(int sick_code) {
		return crawlingMapper.getIngredients(sick_code);
	}

}
