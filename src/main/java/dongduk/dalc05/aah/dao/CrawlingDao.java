package dongduk.dalc05.aah.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface CrawlingDao {
	
	String getIngredients(int sick_code);

}
