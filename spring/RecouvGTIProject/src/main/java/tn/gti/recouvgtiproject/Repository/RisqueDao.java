package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.Risque;

import java.util.List;

@Repository
public interface RisqueDao extends JpaRepository<Risque, Long> {
    public Risque getRisqueByIdRisque(Long idRisque);


    @Query("SELECT cc FROM Risque cc WHERE   1=1  " +
            "AND (:natureProduit IS NULL OR cc.natureProduit = :natureProduit) " +
            "AND (:numDossier IS NULL OR cc.numDossier = :numDossier) ")
    List<Risque> recherche(@Param("natureProduit") String natureProduit, @Param("numDossier") String numDossier);
}

