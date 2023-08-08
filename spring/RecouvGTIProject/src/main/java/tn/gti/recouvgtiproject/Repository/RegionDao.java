package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Groupe;
import tn.gti.recouvgtiproject.Entity.Region;

@Repository
public interface RegionDao extends JpaRepository<Region,Long> {
    public Region getRegionById(Long id);
}
