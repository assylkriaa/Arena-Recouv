package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.RechercheMC;

import java.util.List;
@Repository
public interface RechercheDao extends JpaRepository<Dossier, String> {

    @Query("SELECT cc FROM Dossier cc, Client h, Compte o WHERE   1=1 AND cc.idClient = h.idClient AND cc.idClient = o.idClient " +
            "AND (:idClient IS NULL OR cc.idClient = :idClient) " +
            "AND (:typeDossier IS NULL OR cc.typeDossier = :typeDossier) " +
            "AND (:jourSdbDu IS NULL OR cc.joursdb >= :jourSdbDu) " +
            "AND (:jourSdbAu IS NULL OR cc.joursdb <= :jourSdbAu) " +
            "AND (:jourImpDu IS NULL OR cc.jourimp  >= :jourImpDu) " +
            "AND (:jourImpAu IS NULL OR cc.jourimp <= :jourImpAu) " +
            "AND (:classeFinal IS NULL OR cc.classeFinal = :classeFinal) " +
            "AND (:groupe IS NULL OR h.groupe = :groupe) " +
            "AND (:region IS NULL OR h.region = :region) " +
            "AND (:segment IS NULL OR h.segment = :segment) " +
            "AND (:marche IS NULL OR h.marche = :marche) " +
            "AND (:agence IS NULL OR o.agence = :agence)")
    List<Dossier> recherche(@Param("idClient") String idClient, @Param("typeDossier") Long typeDossier,
                            @Param("jourSdbDu") Integer jourSdbDu, @Param("jourSdbAu") Integer jourSdbAu,
                            @Param("jourImpDu") Integer jourImpDu, @Param("jourImpAu") Integer jourImpAu,
                            @Param("classeFinal") String classeFinal, @Param("groupe") Long groupe,
                            @Param("region") Long region, @Param("segment") Long segment,
                            @Param("marche") Long marche, @Param("agence") Long agence);
}
