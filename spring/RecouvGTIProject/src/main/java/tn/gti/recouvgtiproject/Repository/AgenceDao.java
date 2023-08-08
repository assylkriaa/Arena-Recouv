package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Agence;
import tn.gti.recouvgtiproject.Entity.Groupe;

@Repository
public interface AgenceDao extends JpaRepository<Agence,Long> {
    public Agence findAgenceById(Long id);
}
