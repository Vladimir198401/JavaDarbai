package com.ernadas.webstart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Trasos {
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    private String pav;

    private Double atstumas_km;

    private Integer sukilimas;
    
	public Trasos(String pav, Double atstumas_km, Integer sukilimas) {
		super();
		this.pav = pav;
		this.atstumas_km = atstumas_km;
		this.sukilimas = sukilimas;
	}
	
	public Trasos() {
		
	}

	/**
	 * @return the sukilimas
	 */
	public Integer getSukilimas() {
		return sukilimas;
	}

	/**
	 * @param sukilimas the sukilimas to set
	 */
	public void setSukilimas(Integer sukilimas) {
		this.sukilimas = sukilimas;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
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
	 * @return the atstumas_km
	 */
	public Double getAtstumas_km() {
		return atstumas_km;
	}

	/**
	 * @param atstumas_km the atstumas_km to set
	 */
	public void setAtstumas_km(Double atstumas_km) {
		this.atstumas_km = atstumas_km;
	}	
	
	public String ThAtstumasKm() {
		
		return atstumas_km.toString();	
	}
}
