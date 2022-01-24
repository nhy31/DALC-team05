package dongduk.dalc05.aah.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecipeMapper {
	
	String getIngredients(int sick_code);

}
