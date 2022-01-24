package dongduk.dalc05.aah.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.RecipeDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.RecipeMapper;

@Repository
public class RecipeDaoImpl implements RecipeDao {
	
	@Autowired
	private RecipeMapper crawlingMapper;
	
	@Override
	public String getIngredients(int sick_code) {
		return crawlingMapper.getIngredients(sick_code);
	}

}
