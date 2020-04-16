package duomenys.mitybai;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Produktai_medziagos {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    private Integer produktai_id;
    private Integer maistines_medz_id;
    private Double kiekis;
    
    @JsonIgnoreProperties("produktas_medziaga")
    @ManyToOne
    @JoinColumn(insertable=false, updatable=false)    
    private Produktai produktai;
    
    @JsonIgnoreProperties("produktai_medziagos")
    @ManyToOne
    @JoinColumn(insertable=false, updatable=false)
    private Maistines_medz maistines_medz;   
    
	public Maistines_medz getMaistines_medz() {
		return maistines_medz;
	}

	public Produktai_medziagos(Integer id, Integer produktai_id, Integer id_medziagos, Double kiekis) {
		super();
		this.id = id;
		this.produktai_id = produktai_id;
		this.maistines_medz_id = id_medziagos;
		this.kiekis = kiekis;
	}
    
	public Produktai getProduktai() {
		return produktai;
	}

	public void setProduktai(Produktai produktas) {
		this.produktai = produktas;
	}

	public Produktai_medziagos() {
	
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProduktai_id() {
		return produktai_id;
	}

	public void setProduktai_id(Integer produktai_id) {
		this.produktai_id = produktai_id;
	}

	public Integer getMaistines_medz_id() {
		return maistines_medz_id;
	}

	public void setMaistines_medz_id(Integer maistines_medz_id) {
		this.maistines_medz_id = maistines_medz_id;
	}

	public Double getKiekis() {
		return kiekis;
	}

	public void setKiekis(Double kiekis) {
		this.kiekis = kiekis;
	}

	@Override
	public String toString() {
		return "Produktai_medziagos [id=" + id + ", produktai_id=" + produktai_id + ", maistines_medz_id="
				+ maistines_medz_id + ", kiekis=" + kiekis + "]";
	}
	
	
	
/*	
	@ManyToOne
	@JoinColumn(insertable=false, updatable=false)
	private Maistines_medz maistine_medz;

	public Maistines_medz getMaistine_medz() {
		return maistine_medz;
	}

	public void setMaistines_medz(Maistines_medz maistine_medz) {
		this.maistine_medz = maistine_medz;
	}
*/	
}

