package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Affaire;

import java.util.List;

@Repository
public interface AffaireDao extends JpaRepository<Affaire,Long> {
    public Affaire getAffaireByIdAffaire(Long id);


}
