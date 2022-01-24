package dongduk.dalc05.aah.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface RecipeDao {

	String getIngredients(int sick_code);
}
