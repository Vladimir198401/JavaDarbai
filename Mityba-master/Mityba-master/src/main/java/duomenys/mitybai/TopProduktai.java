package duomenys.mitybai;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;


public class TopProduktai implements Serializable{
	
	@Id
	private int prod_id;
	private String pav;
	private double kiekis;
	private int gyvuline;
	private int augaline;
	
	public TopProduktai() {
	}	
	
	public void setProd_id ( int prod_id ) {
		
		this.prod_id = prod_id;
	}
	
	public int getProd_id ( ) {
		
		return this.prod_id; 
	}
	
	public void setPav ( String pav ) {
		
		this.pav = pav;
	}
	
	public String getPav ( ) {
		
		return this.pav; 
	}	
	
	public double getKiekis ( ) {
		
		return this.kiekis; 
	}
	
	public void setKiekis ( double kiekis ) {
		
		this.kiekis = kiekis;
	}

	public int getGyvuline() {
		return gyvuline;
	}

	public void setGyvuline(int gyvuline) {
		this.gyvuline = gyvuline;
	}

	public int getAugaline() {
		return augaline;
	}

	public void setAugaline(int augaline) {
		this.augaline = augaline;
	}
}
