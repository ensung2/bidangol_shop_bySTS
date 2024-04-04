package com.shop.bidangol;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class BidangolStsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BidangolStsApplication.class, args);
	}

}
