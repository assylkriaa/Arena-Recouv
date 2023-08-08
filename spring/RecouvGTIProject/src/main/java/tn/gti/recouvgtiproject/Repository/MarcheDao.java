package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Groupe;
import tn.gti.recouvgtiproject.Entity.Marche;
@Repository
public interface MarcheDao extends JpaRepository<Marche,Long> {
    public Marche findMarcheById(Long id);
}
