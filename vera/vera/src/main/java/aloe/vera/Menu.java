package aloe.vera;

public enum Menu {

	
	 Aloe("/aloe", "Ar tu noretum ?")
	,Vera("/vera", "Did you want?")
	,Zera("/zera", "Ты хочешь?")
	,Bera("/bera", "Möchten Sie?");
	 
	private final String itemurl;
	private final String naujasPavadinimas;
	
	Menu( String url, String pavadinimas ) {
		this.itemurl = url;
		this.naujasPavadinimas = pavadinimas;
	}
	
	public String itemurl() {
		return this.itemurl;
	}
	public String naujasPavadinimas() {
		return this.naujasPavadinimas;
	}
}