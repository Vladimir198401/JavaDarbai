package testai.ataskaita;

//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.Optional;

import org.junit.jupiter.api.Test;
//import org.junit.Test;
//import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
																						// import org.springframework.boot.test.autoconfigure.orm.jpa.*; - nereikia iš pvz. !

//import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.boot.test.context.SpringBootTest;

import testai.ataskaita.Atsakymai;

//@RunWith(SpringRunner.class)
@SpringBootTest

public class AtsakymaiRepositoryTest {
	
	// @DataJpaTest	
	@Autowired
	private AtsakymaiRepository atsakymaiRepository;
	   
	@Test
	public void testSaveGetAtsakymai() {
	        																			     // System.out.println (" starting here test ! ");    	
		Atsakymai atsakymas = new Atsakymai ( "tikriausiai", 2, 1);
		Atsakymai atsakym = atsakymaiRepository.save(atsakymas);
		Atsakymai atsa = (Atsakymai) atsakymaiRepository.findByPav("tikriausiai");
	        											
		assertNotNull(atsakymas);
		        																			     // System.out.println (" kt2 ! ");        
		assertNotNull(atsa);        
		        																			     // System.out.println (" kt3 ! ");        
		assertEquals(atsa.getPav(), atsakymas.getPav());
		        																				 // -- neveiks kt4 nespaudina .. 
		assertEquals(atsa.getTeisingas(), atsakymas.getTeisingas());
		        							
		atsakymaiRepository.deleteById(atsakym.getId());				  
	        																		         // System.out.println (" ending here test ! ");
	}
	    
	@Test   
	public void testFindAllAtsakymai() {
		assertNotNull(atsakymaiRepository.findAll());
	}
	    
	@Test    
	public void deleteFoundedByName() {
	        																			// System.out.println (" kt6 ! ");       
		Atsakymai atsakymas = new Atsakymai ( "nemanau", 2, 1 );
		Atsakymai atsa = atsakymaiRepository.save(atsakymas);
		atsakymaiRepository.delete(atsa);
		Atsakymai atsakym = (Atsakymai) atsakymaiRepository.findByPav("nemanau");
		
		assertNull( atsakym );			
	   
	}    
	@Test
	public void deletByAtsakymaiIdTest() {
	    	
		Atsakymai atsakym = null;
		Atsakymai atsakymas = new Atsakymai(  "viskas", 2, 1);    	
		Atsakymai atsa = atsakymaiRepository.save(atsakymas);
        Integer id_prod = atsa.getId();
        atsakymaiRepository.deleteById(id_prod);
        Optional <Atsakymai> found = atsakymaiRepository.findById( id_prod );
        
		if ( found.isPresent() ) {
			
			 atsakym = found.get();
		}
        assertEquals( atsakym, null );        
    }   
}
