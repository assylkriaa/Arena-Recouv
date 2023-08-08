package tn.gti.recouvgtiproject.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Risque {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idRisque;
    private Long agence;
    private Integer totalEngagement;
    private String natureProduit;
    private Float montantCreanceEntree;
    private Float tauxICmarge;
    private Float montantRecupere;
    private Float montantICEntree;
    private Float tauxIndexe;
    private Float tauxIRmarge;
    private Float montantFrais;
    private Float montantRestantDut;
    private String observation;


    private String numDossier;



}
