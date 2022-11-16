package com.elcric.somasync;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class SomasyncApplication {

	public static void main(String[] args) {
		SpringApplication.run(SomasyncApplication.class, args);
	}

}
