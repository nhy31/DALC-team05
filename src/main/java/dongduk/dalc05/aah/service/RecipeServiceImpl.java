package dongduk.dalc05.aah.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dongduk.dalc05.aah.dao.RecipeDao;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDao recipeDao;
	
	public List<String> getIngredients(int sick_code) {
		return recipeDao.getIngredients(sick_code);
	}

	@Override
	public void insertUse(rUse use) {
		// TODO Auto-generated method stub
		recipeDao.insertUse(use);
		
	}

	@Override
	public void insertRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		recipeDao.insertRecipe(recipe);
	}

	@Override
	public void insertOrder(rOrder order) {
		recipeDao.insertOrder(order);
	};
}
