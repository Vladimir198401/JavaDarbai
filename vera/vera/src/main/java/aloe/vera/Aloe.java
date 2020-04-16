package aloe.vera;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Aloe {

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    private String pav;
    
    //@OneToMany(mappedBy="studentai",cascade=CascadeType.ALL)
    //private List<Produktai_medziagos> produktai_medziagos;    
   
	public Aloe (Integer id, String pav) {
		super();
		this.id = id;
		this.pav = pav;
		
	}
	
	public Aloe() {
		
	}
	
	public Integer getId() {
		return id;
		
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getPav() {
		return pav;
	}

	public void setPav(String pav) {
		this.pav = pav;
	}
}
