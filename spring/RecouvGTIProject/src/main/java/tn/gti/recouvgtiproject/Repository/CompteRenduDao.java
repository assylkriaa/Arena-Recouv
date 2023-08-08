package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.CompteRendu;

import java.util.List;

@Repository
public interface CompteRenduDao extends JpaRepository<CompteRendu,Long> {
    public List<CompteRendu> findCompteRendusByNumDossier(String numD);
    public CompteRendu findCompteRenduByNumeroCompteRendu(Long numC);
}
