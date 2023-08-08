package tn.gti.recouvgtiproject.Entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CompteRendu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="numCompteRendu")
    private Long numeroCompteRendu=Long.valueOf(0);
    @Temporal(TemporalType.DATE)
    private Date dateSaisieCompteRendu;
    private String compteRendu;
    private String utulisateur;
    private Long agence;
    //obligatoire
    private String clientContacteAvec;
    private String autreElement;
    private String typeCompteRendu;
    private Float montantReglement;
    @Temporal(TemporalType.DATE)
    private Date dateReglement;
    private String lieuReglement;
    private Float montantFacilitePaiement;
    private Integer nombreEcheanceFacilitePaiement;
    private Float montantEcheanceFP1;
    @Temporal(TemporalType.DATE)
    private Date dateEcheanceFP1;
    private Float montantEcheanceFP2;
    @Temporal(TemporalType.DATE)
    private Date dateEcheanceFP2;
    private Float montantEcheanceFP3;
    @Temporal(TemporalType.DATE)
    private Date dateEcheanceFP3;
    private Float montantEcheanceFP4;
    @Temporal(TemporalType.DATE)
    private Date dateEcheanceFP4;
    private Float montantEcheanceFP5;
    @Temporal(TemporalType.DATE)
    private Date dateEcheanceFP5;
    private String observationNonReconaissanceCreance;
    @Temporal(TemporalType.DATE)
    private Date dateVisite;
    private Float heureVisiteDebut;
    private Float heureVisiteFin;
    private Integer tel1NC;
    private Integer tel2NC;
    private String faxNC;
    private String adresseNC;
    private String observationIncapacite;

    private String numDossier;
}
