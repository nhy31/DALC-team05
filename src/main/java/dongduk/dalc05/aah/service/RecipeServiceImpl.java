package dongduk.dalc05.aah.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.RecipeDao;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDao recipeDao;
	
	public String getIngredients(int sick_code) {
		return recipeDao.getIngredients(sick_code);
	};

}
