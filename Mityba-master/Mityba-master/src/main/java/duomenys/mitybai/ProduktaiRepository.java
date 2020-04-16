package duomenys.mitybai;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
//import java.util.stream.*;
//import org.springframework.data.repository.Repository;
import org.springframework.data.repository.CrudRepository;
// import org.springframework.data.repository.query.Param;



public interface ProduktaiRepository extends CrudRepository<Produktai, Integer>{
	
	List<Produktai> findByPav(String pav);
    	//Produktai findByPav(String pav);
	
	@Query(value="SELECT id, pav, kilme FROM produktai WHERE maistines_medz=1", nativeQuery = true)
	List<Produktai> findAllQuery();	
}
