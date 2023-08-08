package tn.gti.recouvgtiproject.Entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RechercheMC {
    @Id
    public String idClient =null;
    public Long agence=null;
    public Long marche=null;
    public Long region=null;
    public Long groupe=null;
    public Long segment=null;
    public String classeFinal=null;
    public Long typeDossier=null;
    public Integer jourSdbDu=null;
    public Integer jourSdbAu=null;
    public Integer jourImpDu=null;
    public Integer jourImpAu=null;
}
