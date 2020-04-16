package duomenys.mitybai;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface Maisto_medz_grupesRepository extends CrudRepository<Maisto_medz_grupes, Integer>{
	
	List<Maisto_medz_grupes> findByPav(String pav);
	
}
