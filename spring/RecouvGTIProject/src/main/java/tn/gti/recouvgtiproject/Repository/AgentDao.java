package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Agent;

import java.util.List;
@Repository
public interface AgentDao extends JpaRepository<Agent,Long> {
    public Agent getAgentByIdAgent(Long idAgent);

}
