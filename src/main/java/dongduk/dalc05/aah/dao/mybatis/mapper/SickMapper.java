package dongduk.dalc05.aah.dao.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SickMapper {
	

	int getSickCode(String sick_name);

}
