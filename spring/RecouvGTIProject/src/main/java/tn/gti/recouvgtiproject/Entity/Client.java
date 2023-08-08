package tn.gti.recouvgtiproject.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor

@NoArgsConstructor
public class Client {
    @Id
    private String idClient;
    private String nomPrenom ;
    private Long region;
    private Long agence;
    /* 0 si Client Non Particulier  // 1 si Client Particulier */
    private Integer particulier;
    private Long groupe;
    private Long segment;
    private Long marche;





}
