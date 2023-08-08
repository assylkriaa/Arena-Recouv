package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Groupe;
import tn.gti.recouvgtiproject.Entity.TypeDossier;

@Repository
public interface TypeDossierDao extends JpaRepository<TypeDossier,Long> {
    public TypeDossier findTypeDossierById(Long id);
}
