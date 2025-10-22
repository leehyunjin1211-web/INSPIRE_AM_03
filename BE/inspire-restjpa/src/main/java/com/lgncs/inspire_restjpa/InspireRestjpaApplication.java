package com.lgncs.inspire_restjpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
public class InspireRestjpaApplication {

	public static void main(String[] args) {
		
		Dotenv env = Dotenv.configure().ignoreIfMissing().load();
		env.entries().forEach(entry -> {
			System.out.println(entry.getKey()+":"+entry.getValue());
			System.setProperty(entry.getKey(), entry.getValue());
		});

		SpringApplication.run(InspireRestjpaApplication.class, args);
	}

}
// http://localhost:8088/swagger-ui/index.html