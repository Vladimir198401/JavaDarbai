package aloe.vera;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
 
	
		public interface AloeRepository extends CrudRepository<Aloe, Integer>{
			
	List<Aloe> findByPav(String pav);

}
 
