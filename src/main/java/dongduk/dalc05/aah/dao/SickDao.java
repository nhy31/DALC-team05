package dongduk.dalc05.aah.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SickDao {
	

	int getSickCode(String sick_name);
}
