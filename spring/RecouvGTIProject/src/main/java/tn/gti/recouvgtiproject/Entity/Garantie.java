package tn.gti.recouvgtiproject.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Garantie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idGarantie;

    private String natureGarantie;
    private String typeGarantie;
    private String natureHypothèque;
    @Temporal(TemporalType.DATE)
    private Date dateEnregistrement;
    @Temporal(TemporalType.DATE)
    private Date dateInscription;
    private String pariPassu;
    private String rang;
    private Float montant;
    private Float estimationInitiale;
    private Float estimationCourante;
    private Integer numeroTitre;
    private String typeTitre;
    private String droitHypotheque;
    private String adresse;
    private String typeBien;
    private String  garantieDeb;
    private String mainLevee;
    private String codePPT;
    private String nomCaution;
    private String typeDocCaution;
    private Date DateDelivrance;
    private Integer numeroDocument;
    private String observation;
    private Integer hauteurM;
    private String numeroCongeM;
    @Temporal(TemporalType.DATE)
    private Date dateRenouvellementM;
    @Temporal(TemporalType.DATE)
    private Date dateExpirationM;
    private Integer portAttM;
    private String jaugeageM;
    private String numDossier;


}
