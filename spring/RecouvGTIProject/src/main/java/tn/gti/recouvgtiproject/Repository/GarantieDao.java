package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.Garantie;
@Repository
public interface GarantieDao extends JpaRepository<Garantie, Long> {
}
