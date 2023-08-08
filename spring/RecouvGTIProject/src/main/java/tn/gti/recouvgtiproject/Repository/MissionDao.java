package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Mission;

import java.util.List;

@Repository
public interface MissionDao extends JpaRepository<Mission,Long> {

    public Mission getMissionsByIdMission(Long idMission);
}
