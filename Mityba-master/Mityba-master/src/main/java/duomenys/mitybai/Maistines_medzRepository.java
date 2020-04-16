package duomenys.mitybai;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface Maistines_medzRepository extends CrudRepository<Maistines_medz, Integer>{
	
	List<Maistines_medz> findByPav(String pav);
	
}
