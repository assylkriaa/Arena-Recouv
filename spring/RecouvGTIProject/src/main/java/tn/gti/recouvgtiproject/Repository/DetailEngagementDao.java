package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.DetailEngagement;
@Repository
public interface DetailEngagementDao extends JpaRepository<DetailEngagement,Long> {
}
