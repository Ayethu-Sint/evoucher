package com.example.evoucher;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
//@EnableCaching
public class EvoucherApplication {

	public static void main(String[] args) {
		SpringApplication.run(EvoucherApplication.class, args);
	}

}
