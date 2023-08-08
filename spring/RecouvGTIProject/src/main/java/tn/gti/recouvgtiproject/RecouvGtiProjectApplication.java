package tn.gti.recouvgtiproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class RecouvGtiProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(RecouvGtiProjectApplication.class, args);
	}

}
