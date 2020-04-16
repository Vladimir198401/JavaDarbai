package duomenys.mitybai;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;


@Entity //iesko duomenu bazeje tokios lenteles
public class Produktai {
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    private String pav;
    private Integer kilme;
    
    @OneToMany(mappedBy="produktai",cascade=CascadeType.ALL)
    @JsonIgnoreProperties("produktai")
    private List<Produktai_medziagos> produktai_medziagos;    
   
	public Produktai(Integer id, String pav, Integer kilme) {
		super();
		this.id = id;
		this.pav = pav;
		this.kilme = kilme;
		
	}
	
	public Produktai() {
		
	}
	/**
	 * @return the pav
	 */
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * @return the pav
	 */
	public String getPav() {
		return pav;
	}

	/**
	 * @param pav the pav to set
	 */
	public void setPav(String pav) {
		this.pav = pav;
	}
	
	public Integer getKilme() {
		return kilme;
	}

	public void setKilme(Integer kilme) {
		this.kilme = kilme;
	}

	public List<Produktai_medziagos> getProduktai_medziagos() {
		
		return produktai_medziagos;
	}
	public void setProduktai_medziagos (List<Produktai_medziagos> produktai_medziagos) {
		
		this.produktai_medziagos = produktai_medziagos;
	}

}
