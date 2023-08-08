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
public class DetailEngagement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idDetailEngagement;
    private String nomPrenom;
    @Temporal(TemporalType.DATE)
    private Date echeance;
    private String effet;
    private String principale;
    private String interet;
    private String interConv;
    private Float frais;
    private Integer idRisque;


}
