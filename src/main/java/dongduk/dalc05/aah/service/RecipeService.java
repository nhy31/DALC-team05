package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

public interface RecipeService {
	
	public List<String> getIngredients(int sick_code);
	
	public void insertUse(rUse use);
	
	public void insertRecipe(Recipe recipe);
	

	public void insertOrder(rOrder order);

}
