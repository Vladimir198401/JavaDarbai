package aloe.vera;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import aloe.vera.Menu;
import aloe.vera.Aloe;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManagerFactory;

@Controller
public class PageController {
	
	@Autowired 
	private AloeRepository aloe_rep;
	
	
	@Autowired 
	EntityManagerFactory factory;

	// @Bean
	public SessionFactory sessionFactory() {
		
	        if (factory.unwrap(SessionFactory.class) == null) {
	            throw new NullPointerException("factory is not a hibernate factory");
	        }
	        return factory.unwrap(SessionFactory.class);
	}
	
	@RequestMapping(path="/", method={ RequestMethod.GET, RequestMethod.POST })
    public String index(Model model) {
        
	
        model.addAttribute("lst_menu", Menu.values() ); 
        
        return "index";
    }
	
	@RequestMapping(path="/vera", method={ RequestMethod.GET, RequestMethod.POST })
    public String vera(Model model) {
        
	
        model.addAttribute("lst_menu", Menu.values() ); 
        
        return "vera";
    }
	
	@RequestMapping(path="/zera", method={ RequestMethod.GET, RequestMethod.POST })
    public String zera(Model model) {
        
	
        model.addAttribute("lst_menu", Menu.values() ); 
        
        return "zera";
    }
	
	@RequestMapping(path="/bera", method={ RequestMethod.GET, RequestMethod.POST })
    public String bera(Model model) {
        
	
        model.addAttribute("lst_menu", Menu.values() ); 
        
        return "bera";
    }

	@RequestMapping(path="/aloe", method={ RequestMethod.GET, RequestMethod.POST })
    public String studentai(
    		@RequestParam(name="id", required=false, defaultValue="") Integer id
    		, @RequestParam(name="pav", required=false, defaultValue="") String pav
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
    		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
    		, Model model 
    	) {
       
        if ( veiksmas.equals("papildyti") ) {
        	
        	List<Aloe> lst_prod = aloe_rep.findByPav(pav);
        	
        	if ( lst_prod.size() > 0 ) {
        		
        	}else {
        		  
	        	Aloe aloe = new Aloe( id, pav );
	        	aloe_rep.save( aloe );
        	 
        	}
        }
        if ( veiksmas.equals("pakeisti") ) {
        	
        	Aloe aloe = new Aloe();// id, pav;
        	Optional <Aloe> found = aloe_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        		aloe = found.get();
        		aloe.setId(id);
        		aloe.setPav(pav);
        		aloe_rep.save(aloe);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Aloe> found = aloe_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			 
        		aloe_rep.deleteById(id);
 		
 			}
        } 
        model.addAttribute( "lst_menu", Menu.values() ); 
        model.addAttribute( "lst", aloe_rep.findAll() );
        
        
        return "aloe";
    }
}