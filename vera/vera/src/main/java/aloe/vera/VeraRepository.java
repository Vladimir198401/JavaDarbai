package aloe.vera;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
 
	
		public interface VeraRepository extends CrudRepository<Vera, Integer>{
			
	List<Vera> findByPav(String pav);

}
 
