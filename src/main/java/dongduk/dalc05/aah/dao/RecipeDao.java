package dongduk.dalc05.aah.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.domain.Ingredient;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

@Repository
public interface RecipeDao {

	// 레시피 메인페이지 상단 인기레시피들 16위까지 (조회수)
	List<Recipe> getTop16();
	
	// 질병에 해당하는 식재료 5개 가져오기
	List<Ingredient> getIngredients(int sick_code);
	
	// 재료가 들어가는 레시피 가져오기
	List<Recipe> getRecipes(String ingredient_name);
	
	// 코드에 해당하는 레시피 가져오기
	Recipe getRecipeFromCode(int recipe_code);
	
	// 레시피 조회 (조회수증가)
	void hitsCount(int recipe_code); 
	
	//
	List<Recipe> getRecipeByKeyword(String keyword);
}