package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.RecipeDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.RecipeMapper;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

@Repository
public class RecipeDaoImpl implements RecipeDao {
	
	@Autowired
	private RecipeMapper recipeMapper;
	
	@Override
	public List<String> getIngredients(int sick_code) {
		return recipeMapper.getIngredients(sick_code);
	}

	@Override
	public void insertUse(rUse use) {
		 recipeMapper.insertUse(use);
		
	}

	@Override
	public void insertRecipe(Recipe recipe) {
		 recipeMapper.insertRecipe(recipe);
		
	}

	@Override
	public void insertOrder(rOrder order) {
		 recipeMapper.insertOrder(order);
		
	}

}
