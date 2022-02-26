package dongduk.dalc05.aah.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dongduk.dalc05.aah.dao.RecipeDao;
import dongduk.dalc05.aah.dao.mybatis.mapper.RecipeMapper;
import dongduk.dalc05.aah.domain.Ingredient;
import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;
import dongduk.dalc05.aah.util.PagingVO;

@Repository
public class RecipeDaoImpl implements RecipeDao {
	
	@Autowired
	private RecipeMapper recipeMapper;
	
	// 레시피 메인페이지 상단 인기레시피들 16위까지 (조회수)
	@Override
	public List<Recipe> getTop16() { return recipeMapper.getTop16(); }
	
	// 모든 레시피 불러오기
	@Override
	public List<Recipe> getAllRecipes()  { return recipeMapper.getAllRecipes(); }
	
	// 질병에 해당하는 식재료 5개 가져오기
	@Override
	public List<Ingredient> getIngredients(int sick_code) { return recipeMapper.getIngredients(sick_code); }

	// 재료가 들어가는 레시피 가져오기
	@Override
	public List<Recipe> getRecipes(String ingredient_name) { return recipeMapper.getRecipes(ingredient_name); }

	// 코드에 해당하는 레시피 가져오기
	@Override
	public Recipe getRecipeFromCode(int recipe_code) { return recipeMapper.getRecipeFromCode(recipe_code); }
	
	// 레시피 조회 (조회수증가)
	public void hitsCount(int recipe_code) { recipeMapper.hitsCount(recipe_code); }
	

	@Override
	public List<Recipe> getRecipeByKeyword(String keyword) {
		return recipeMapper.getRecipeByKeyword(keyword);
	}

	// 레시피에 사용된 재료들
	@Override
	public List<rUse> getUses(int recipe_code) { return recipeMapper.getUses(recipe_code);}

	// 레시피 과정
	@Override
	public List<rOrder> getOrders(int recipe_code) { return recipeMapper.getOrders(recipe_code); }
	

}