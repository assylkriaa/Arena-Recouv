package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Groupe;

import java.util.List;

@Repository
public interface GroupeDao extends JpaRepository<Groupe,Long> {
    public Groupe getGroupeById(Long id);

}
