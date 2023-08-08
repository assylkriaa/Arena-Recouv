package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Document;
import tn.gti.recouvgtiproject.Entity.Dossier;

import java.util.List;

@Repository
public interface DocumentDao extends JpaRepository<Document, Long> {
    public List<Document> findDocumentsByNumDossier(String numDossier);
}
