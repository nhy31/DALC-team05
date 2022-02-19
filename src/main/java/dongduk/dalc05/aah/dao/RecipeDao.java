package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

@Repository
public interface RecipeDao {

	List<String> getIngredients(int sick_code);
	
	void insertUse(rUse use);
	
	void insertRecipe(Recipe recipe);
	
	void insertOrder(rOrder order);
	
	List<Recipe> getRecipeByKeyword(String keyword);
}
