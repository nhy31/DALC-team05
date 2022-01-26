package dongduk.dalc05.aah.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dongduk.dalc05.aah.domain.Recipe;
import dongduk.dalc05.aah.domain.rOrder;
import dongduk.dalc05.aah.domain.rUse;

@Mapper
public interface RecipeMapper {
	
	List<String> getIngredients(int sick_code);
	
	void insertRecipe(Recipe recipe);
	
	void insertUse(rUse use);
	
	void insertOrder(rOrder order);

}
