package tn.gti.recouvgtiproject.Entity;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Document {
     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long idDocument;
     private String typeDocument;
     private String fichierPath;
     private String typeFichier;
     private String fileName;

     private String numDossier;
}
