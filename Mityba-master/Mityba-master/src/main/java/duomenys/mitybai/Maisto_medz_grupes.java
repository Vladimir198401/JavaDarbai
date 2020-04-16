package duomenys.mitybai;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 * @author Septintas
 *
 */
@Entity
public class Maisto_medz_grupes {
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    private String pav;
    
    @OneToMany(mappedBy="maisto_medz_grupes",cascade=CascadeType.ALL)
    private List<Maistines_medz> maistines_medz;
    
	public List<Maistines_medz> getMaistines_medz() {
		return maistines_medz;
	}

	public void setMaistines_medz(List<Maistines_medz> maistines_medz) {
		this.maistines_medz = maistines_medz;
	}

	public Maisto_medz_grupes() {

	}    
    
	public Maisto_medz_grupes(Integer id, String pav) {
		super();
		this.id = id;
		this.pav = pav;
	}
	
	@Override
	public String toString() {
		return "Maisto_medz_grupes [id=" + id + ", pav=" + pav + "]";
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
