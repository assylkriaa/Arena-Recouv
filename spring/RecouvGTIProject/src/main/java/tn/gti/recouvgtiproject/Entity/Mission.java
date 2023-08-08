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
public class Mission {
    @Id
    private Long idMission;
    private String idClient;
    private String nomPrenom;
    private String ncpt;
    private String typeMission;
    private String natureAss;
    private String typePrestataire;
    private String prestataire;
    @Temporal(TemporalType.DATE)
    private Date dateTransmission;
    private String resultat;
    private String sort;
    @Temporal(TemporalType.DATE)
    private Date date;
    private Float montant;
    private String observation;

    private Long idAffaire;
}
