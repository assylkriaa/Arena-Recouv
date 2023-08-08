package tn.gti.recouvgtiproject.Entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Compte {
    @Id
    private Long numCompte;
    private Long agence;
    private Float montant;
    private Long typeDossier;
    private Float mntImpaye;
    private Integer jrImpaye;
    private Float mntSdb;
    private Integer jrSdb;

    private String idClient;




}
