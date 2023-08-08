package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Nomenclature;
@Repository
public interface nomenDao extends JpaRepository<Nomenclature,Long> {
    public Nomenclature getNomenclatureByIdNom(String idNom);
}
