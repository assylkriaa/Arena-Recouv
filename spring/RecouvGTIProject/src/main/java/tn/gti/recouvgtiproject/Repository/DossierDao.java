package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Dossier;

import java.util.List;

@Repository
public interface DossierDao extends JpaRepository<Dossier, String> {
public Dossier getDossierByNumDossier(String idDossier);
public List<Dossier> findDossiersByIdClient(String idClient);
public List<Dossier> findDossiersByClasseFinal(String  classeFinal);
public List<Dossier> findDossiersByTypeDossier(Long typedossier);
public List<Dossier> findAllByIdClient(String idClient);
public Dossier findDossierByNumDossier(String numDossier);
}




