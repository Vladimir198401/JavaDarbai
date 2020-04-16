package duomenys.mitybai;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManagerFactory;

@Controller
public class PageController {
	
	@Autowired
	private ProduktaiRepository produktai_rep;
	
	@Autowired
	private Maistines_medzRepository maistines_medz_rep;
	
	@Autowired 
	private Maisto_medz_grupesRepository maisto_medz_grupes_rep;
	
	@Autowired
	private Produktai_medziagosRepository produktai_medziagos_rep;
	
	@Autowired 
	EntityManagerFactory factory;

	// @Bean
	public SessionFactory sessionFactory() {
		
	        if (factory.unwrap(SessionFactory.class) == null) {
	            throw new NullPointerException("factory is not a hibernate factory");
	        }
	        return factory.unwrap(SessionFactory.class);
	}
	
	@RequestMapping(path="/paieska", method={ RequestMethod.GET, RequestMethod.POST })
	public String paieska(
    		@RequestParam(name="id_medziagos", required=false, defaultValue="") Integer id_medziagos
    		, @RequestParam(name="check_gyv", required=false, defaultValue="0") Integer gyvuline
    		, @RequestParam(name="check_aug", required=false, defaultValue="0") Integer augaline
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neieskoti") String veiksmas
    		, Model model 
    	) {
		
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
	  
        if ( veiksmas.equals("ieskoti") ) {
        
	        Session session = this.sessionFactory().openSession(); 
			
			TopProduktaiPagalMedz top_produktai_pagal_medz =  new TopProduktaiPagalMedz ( session );
	        model.addAttribute( "lst_top_produktai", top_produktai_pagal_medz.topProduktai( id_medziagos, gyvuline, augaline ) ); 
        
        }  else  {
        	
        	model.addAttribute( "lst_top_produktai", new ArrayList<TopProduktai>() );
        }
      
        model.addAttribute( "lst_menu", Menu.values() ); 
        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute( "lst", maistines_medz_rep.findAll() );
        
        return "paieska";
    }
	
	@RequestMapping(path="/produktai", method={ RequestMethod.GET, RequestMethod.POST })
    public String produktai(
    		@RequestParam(name="id", required=false, defaultValue="") Integer id
    		, @RequestParam(name="pav", required=false, defaultValue="") String pav
    		, @RequestParam(name="kilme", required=false, defaultValue="0") Integer kilme
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
    		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
    		, Model model 
    	) {
        
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
		
		String kur_eiti = "produktas";
		
        if ( veiksmas.equals("papildyti") ) {
        	
        	List<Produktai> lst_prod = produktai_rep.findByPav(pav);
        	
        	if ( lst_prod.size() > 0 ) {
        		
        		back_end_message.setMessage( "produktas su tokiu pav '" + pav + "' jau egzistuoja" );
        		back_end_message.setCss_class( "pranesimas_red" );
        		
        	} else {
        		
	        	Produktai produktas = new Produktai( id, pav, kilme );
	        	produktai_rep.save( produktas );
	        	kur_eiti = "redirect:/produktas?id="+produktas.getId();
        		back_end_message.setMessage( "sarašas papildytas produktu '" + pav + "'" );
        		back_end_message.setCss_class( "pranesimas_green" );
        		
        	}
        }
        
        if ( veiksmas.equals("pakeisti") ) {
        	
        	Produktai produktas = new Produktai();// id, pav;
        	Optional <Produktai> found = produktai_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        		produktas = found.get();
        		produktas.setId(id);
        		produktas.setPav(pav);
        		produktas.setKilme(kilme);
        		produktai_rep.save(produktas);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Produktai> found = produktai_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        	//Produktai produktas = found.get();
        		produktai_rep.deleteById(id);
 		
 			}
        }
        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute( "lst_menu", Menu.values() ); 
        model.addAttribute( "lst", produktai_rep.findAll() );
        
        
        return kur_eiti;
    }
	
	@RequestMapping(path="/produktas", method={ RequestMethod.GET, RequestMethod.POST })
	public String produktas1(
		@RequestParam(name="id_prod_medz", required=false) Integer id_prod_medz 
		, @RequestParam(name="id", required=true) Integer id
		, @RequestParam(name="id_medziagos", required=false) Integer id_medziagos		
		, @RequestParam(name="pav", required=false) String pav
		, @RequestParam(name="kiekis", required=false) Double kiekis
		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
		, Model model 
	) {
		
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
		
		Produktai produktas = new Produktai();// id, pav;
    	// Optional <Produktai> found = produktai_rep.findById( id );
    	
    	if ( veiksmas.equals("papildyti") ) {
    		
    		Produktai_medziagos produktas_medziaga = new Produktai_medziagos();
    	
    		produktas_medziaga.setProduktai_id(id);
    		produktas_medziaga.setMaistines_medz_id(id_medziagos);
    		produktas_medziaga.setKiekis(kiekis);
    		produktai_medziagos_rep.save(produktas_medziaga);
		    back_end_message.setMessage( "sarašas papildytas maistine medziaga '" + id_medziagos  + "' ir kiekiu " + kiekis );
	    	back_end_message.setCss_class( "pranesimas_green" );
        }
    	
        if ( veiksmas.equals("pakeisti") ) {
    		Produktai_medziagos produktas_medziaga = new Produktai_medziagos();
    		System.out.println( "Produkto medziagos id: " + id_prod_medz );    		
        	Optional <Produktai_medziagos> found_produktas_medziaga = produktai_medziagos_rep.findById( id_prod_medz );
        	
        	if ( found_produktas_medziaga.isPresent() ) {

        		produktas_medziaga = found_produktas_medziaga.get();
        		produktas_medziaga.setKiekis(kiekis);
        		System.out.println( "Produkto medziaga: " + produktas_medziaga.toString() );
        		produktai_medziagos_rep.save(produktas_medziaga);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Produktai_medziagos> found_salinamas_produktas_medziaga = produktai_medziagos_rep.findById( id_prod_medz );
      
        	if ( found_salinamas_produktas_medziaga.isPresent() ) {
    			
        		//Maistines_medz maistine_medz = found.get();
        		produktai_medziagos_rep.deleteById(id_prod_medz);
 			}
        }
        
        Optional <Produktai> found = produktai_rep.findById( id );  
    	
    	if ( found.isPresent() ) {
			
    		produktas = found.get();
    		System.out.println( "medziagu sk (2).:" + produktas.getProduktai_medziagos().size() );
    		
    		back_end_message.addMessage( "<br> dabar medziagu yra: " + produktas.getProduktai_medziagos().size() );	
    	}
    	
        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute( "lst_menu", Menu.values() ); 
        model.addAttribute( "medziagos", produktas.getProduktai_medziagos() );	
        model.addAttribute( "visos_medziagos", maistines_medz_rep.findAll() );
        model.addAttribute( "pavadinimas", produktas.getPav() );
		return "produktas1";
	}
	
	@RequestMapping(path="/maistines_medz", method={ RequestMethod.GET, RequestMethod.POST })
    public String maistines_medz(
    		@RequestParam(name="id", required=false, defaultValue="") Integer id
    		, @RequestParam(name="pav", required=false, defaultValue="") String pav
    		, @RequestParam(name="maisto_medz_grupes_id", required=false, defaultValue="") Integer maisto_medz_grupes_id
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
    		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
    		, Model model 
    	) {
		
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
		
        if ( veiksmas.equals("papildyti") ) {
        	
        	List<Maistines_medz> lst_maist_medz = maistines_medz_rep.findByPav(pav);
        	
        	if ( lst_maist_medz.size() > 0 ) {
        		
        		back_end_message.setMessage( "maistine medziaga su tokiu pav '" + pav + "' jau egzistuoja" );
        		back_end_message.setCss_class( "pranesimas_red" );
        		
        	} else {
        	
	        	Maistines_medz maistine_medz = new Maistines_medz( id, pav, maisto_medz_grupes_id );
	        	maistines_medz_rep.save( maistine_medz );
	    		back_end_message.setMessage( "sarašas papildytas maistine medziaga '" + pav + "'" );
	    		back_end_message.setCss_class( "pranesimas_green" );
        	}
        }
        if ( veiksmas.equals("pakeisti") ) {
        	Maistines_medz maistine_medz = new Maistines_medz();// id, pav;
        	Optional <Maistines_medz> found = maistines_medz_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        		maistine_medz = found.get();
        		maistine_medz.setId(id);
        		maistine_medz.setPav(pav);
        		maistine_medz.setMaisto_medz_grupes_id(maisto_medz_grupes_id);
        		maistines_medz_rep.save(maistine_medz);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Maistines_medz> found = maistines_medz_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        	//Maistines_medz maistine_medz = found.get();
        	maistines_medz_rep.deleteById(id);
 		
 			}

        }
        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute("maist_medz_grupes", maisto_medz_grupes_rep.findAll());
        model.addAttribute("lst_menu", Menu.values() ); 
        model.addAttribute("lst", maistines_medz_rep.findAll() );
        
        return "maistine_medz";
    }
	@RequestMapping(path="/maisto_medz_grupes", method={ RequestMethod.GET, RequestMethod.POST })
    public String maisto_medz_grupes(
    		@RequestParam(name="id", required=false, defaultValue="") Integer id
    		, @RequestParam(name="pav", required=false, defaultValue="") String pav
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
    		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
    		, Model model 
    	) {
        
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
		
		if ( veiksmas.equals("papildyti") ) {
        	
        	List<Maisto_medz_grupes> lst_maist_medz_grup = maisto_medz_grupes_rep.findByPav(pav);
        	
        	if ( lst_maist_medz_grup.size() > 0 ) {
        		
        		back_end_message.setMessage( "maistiniu medziagu grupe su tokiu pav '" + pav + "' jau egzistuoja" );
        		back_end_message.setCss_class( "pranesimas_red" );
        		
        	} else {
        	
            	Maisto_medz_grupes maisto_medz_grupe = new Maisto_medz_grupes( id, pav );
            	maisto_medz_grupes_rep.save( maisto_medz_grupe );
	    		back_end_message.setMessage( "sarašas papildytas maistiniu medziagu grupe '" + pav + "'" );
	    		back_end_message.setCss_class( "pranesimas_green" );
        	}
        }
        if ( veiksmas.equals("pakeisti") ) {
        	
        	Maisto_medz_grupes maisto_medz_grupe = new Maisto_medz_grupes();// id, pav );
        	Optional <Maisto_medz_grupes> found = maisto_medz_grupes_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        		maisto_medz_grupe = found.get();
        		maisto_medz_grupe.setId(id);
        		maisto_medz_grupe.setPav(pav);
        		maisto_medz_grupes_rep.save(maisto_medz_grupe);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Maisto_medz_grupes> found = maisto_medz_grupes_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        	//Maisto_medz_grupes maisto_medz_grupe = found.get();
        	maisto_medz_grupes_rep.deleteById(id);
 		
 			}
        }

        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute("lst_menu", Menu.values() ); 
        model.addAttribute("lst", maisto_medz_grupes_rep.findAll() );
        
        return "maisto_medz_grupe";
    }
	@RequestMapping(path="/", method={ RequestMethod.GET, RequestMethod.POST })
    public String index(Model model) {
        
	
        model.addAttribute("lst_menu", Menu.values() ); 
        
        return "index";
    }	
	
	@RequestMapping(path="/produktai_medziagos", method={ RequestMethod.GET, RequestMethod.POST })
    public String produktai_medziagos(
    		@RequestParam(name="id", required=false, defaultValue="") Integer id
    		, @RequestParam(name="id_produkto", required=false, defaultValue="") Integer id_produkto
    		, @RequestParam(name="id_medziagos", required=false, defaultValue="") Integer id_medziagos
    		, @RequestParam(name="kiekis", required=false, defaultValue="0") Double kiekis
    		, @RequestParam(name="veiksmas", required=false, defaultValue="neveikti") String veiksmas
    		, @RequestParam(name="salinti", required=false, defaultValue="nesalinti") String salinti
    		, Model model 
    	) {
		
		BackEndMessage back_end_message = new BackEndMessage ( "nieko dar neveikem", false, "pranesimas_grey" );
		
        if ( veiksmas.equals("papildyti") ) {
        	
        	Produktai_medziagos produktas_medziaga = new Produktai_medziagos( id, id_produkto, id_medziagos, kiekis);
        	produktai_medziagos_rep.save( produktas_medziaga );
    		back_end_message.setMessage( "sarašas papildytas produkto '" + id_produkto + "' maistines medziagos '" + id_medziagos + "' kiekiu '" + kiekis + "'" );
    		back_end_message.setCss_class( "pranesimas_green" );
        }
      
        if ( veiksmas.equals("pakeisti") ) {
        	Produktai_medziagos produktas_medziaga = new Produktai_medziagos();// id, id_produkto, id_medziagos, kiekis );
        	Optional <Produktai_medziagos> found = produktai_medziagos_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
	        	produktas_medziaga = found.get();
	        	produktas_medziaga.setId(id);
	        	produktas_medziaga.setProduktai_id(id_produkto);
	        	produktas_medziaga.setMaistines_medz_id(id_medziagos);
	        	produktas_medziaga.setKiekis(kiekis);
	        	produktai_medziagos_rep.save(produktas_medziaga);
        	}

        }
        if ( salinti.equals("pasalinti") ) {
        	
        	Optional <Produktai_medziagos> found = produktai_medziagos_rep.findById( id );
        	
        	if ( found.isPresent() ) {
    			
        	//Produktai_medziagos produktas_medziaga = found.get();
        	produktai_medziagos_rep.deleteById(id);
 		
 			}
  
        }
        model.addAttribute( "back_end_message", back_end_message );
        model.addAttribute("lst_menu", Menu.values() ); 
        model.addAttribute("lst", produktai_medziagos_rep.findAll() );
        
        ArrayList<AutocompleteProd> produktu_pav = new ArrayList<AutocompleteProd>();
        
        for ( Produktai pr : produktai_rep.findAll() ) {
        	
        	produktu_pav.add( new AutocompleteProd (pr.getId(),pr.getPav()));
        }
        
        model.addAttribute("prod_pav", produktu_pav );
        
        ArrayList<AutocompleteMedz> medziagos = new ArrayList<AutocompleteMedz>();
        
        for ( Maistines_medz medz : maistines_medz_rep.findAll() ) {
        	
        	medziagos.add( new AutocompleteMedz (medz.getId(),medz.getPav()));
        }
        
        model.addAttribute("maist_medz", medziagos);
        
        return "produktas_medziaga";
    }
	
}
