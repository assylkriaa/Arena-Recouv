package tn.gti.recouvgtiproject.Entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Action {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAction ;
    private String idClient ;
    private String agent;
    private LocalDateTime date = LocalDateTime.now();
    private String numDossier;
    private String observation;
    private String phase;
    private String idNom;

}
