package duomenys.mitybai;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Maistines_medz {
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    private String pav;
    private Integer maisto_medz_grupes_id;
    
    
    @JsonIgnoreProperties("maistines_medz")
    @OneToMany(mappedBy = "maistines_medz",cascade = CascadeType.ALL)   
    private List<Produktai_medziagos> produktai_medziagos;
	
    public List<Produktai_medziagos> getProduktai_medziagos() {
		return produktai_medziagos;
	}

	public void setProduktai_medziagos(List<Produktai_medziagos> produktai_medziagos) {
		this.produktai_medziagos = produktai_medziagos;
	}
	
    @JsonIgnoreProperties("maistines_medz")
    @ManyToOne
    @JoinColumn(insertable=false, updatable=false)
    private Maisto_medz_grupes maisto_medz_grupes;
        
	public Maisto_medz_grupes getMaisto_medz_grupes() {
		return maisto_medz_grupes;
	}

	public void setMaisto_medz_grupes(Maisto_medz_grupes maisto_medz_grupes) {
		this.maisto_medz_grupes = maisto_medz_grupes;
	}

	public Maistines_medz(Integer id, String pav, Integer maisto_medz_grupes_id) {
		super();
		this.id = id;
		this.pav = pav;
		this.maisto_medz_grupes_id = maisto_medz_grupes_id;
		
	}
	
	public Maistines_medz() {
		
	}
	/**
	 * @return the id
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
	/**
	 * @return the id_grupes
	 */
	public Integer getMaisto_medz_grupes_id() {
		return maisto_medz_grupes_id;
	}

	/**
	 * @param pav the id_grupes to set
	 */
	public void setMaisto_medz_grupes_id(Integer maisto_medz_grupes_id) {
		this.maisto_medz_grupes_id = maisto_medz_grupes_id;
	}

	/*public String Id_grupes_string() {
		
		return id_grupes.toString();	
	}*/
}
