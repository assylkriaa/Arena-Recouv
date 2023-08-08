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
public class Agence {
    @Id
    private Long id;
    private String libelle;
}
