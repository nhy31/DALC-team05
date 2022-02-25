package dongduk.dalc05.aah.service;

import java.util.List;

import dongduk.dalc05.aah.domain.Ingredient;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

public interface RecipeService {
	
	// 레시피 메인페이지 상단 인기레시피들 16위까지 (조회수)
	public List<Recipe> getTop16();
	
	// 질병에 해당하는 식재료 5개 가져오기
	public List<Ingredient> getIngredients(int sick_code);
	
	// 재료가 들어가는 레시피 가져오기
	public List<Recipe> getRecipes(String ingredient_name);
	
	// 코드에 해당하는 레시피 가져오기
	public Recipe getRecipeFromCode(int recipe_code);
	
	// 레시피 조회 (조회수증가)
	public void hitsCount(int recipe_code); 
	
	public List<Recipe> getRecipeByKeyword(String keyword);
}