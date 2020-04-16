package com.ernadas.skaiciaitekste;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import java.util.ArrayList;

@SpringBootApplication
public class SkaiciaiteksteApplication {

	//private static ApplicationContext context;

	private static ApplicationContext context;

	public static void main(String[] args) {
		
		SpringApplication.run(SkaiciaiteksteApplication.class, args);
		context = new ClassPathXmlApplicationContext( "file:src/beans.xml" );
		SkaiciaiTeksteTvarkymas stt = (SkaiciaiTeksteTvarkymas) context.getBean( "mainspring" );
		stt.ieskotiSkaiciu();
		stt.parodytiSkaicius();
		stt.ieskotiVienetu();
		stt.parodytiVienetus();	
		stt.surasytiVntIrAnti();
	}

}
	/*	
		context = new ClassPathXmlApplicationContext( "file:src/beans.xml" );
		SkaitymasIsFailo sif = (SkaitymasIsFailo) context.getBean( "skaitymas_is_failo" );
		sif.pradeti();
		ArrayList<String> zodziai = sif.iMasyva();
		stt.ieskotiSkaiciu();
		stt.parodytiSkaicius();
		stt.ieskotiVienetu();
		stt.parodytiVienetus();	
		stt.surasytiVntIrAnti();
	
	}

}
*/