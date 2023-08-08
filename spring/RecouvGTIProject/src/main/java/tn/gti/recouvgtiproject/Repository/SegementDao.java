package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Segment;


@Repository
public interface SegementDao extends JpaRepository<Segment,Long> {
    public Segment findSegmentById(Long id);
}
