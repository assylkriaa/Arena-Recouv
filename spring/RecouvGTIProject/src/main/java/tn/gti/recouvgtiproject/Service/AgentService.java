package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Agent;
import tn.gti.recouvgtiproject.Repository.AgentDao;

@Slf4j
@Service
public class AgentService implements IAgentService{
    @Autowired
    AgentDao agentDao;

    @Override
    public Agent ajoutAgent(Agent agent) {
        for(Agent a:agentDao.findAll()){
            if(a.getIdAgent()==agent.getIdAgent()){
                a.setNomPrenom(agent.getNomPrenom());
                a.setProfil(agent.getProfil());
                a.setQuery(agent.getQuery());

                return agentDao.save(a);
            }else{
                return agentDao.save(agent);
            }
        }
        return agent;
    }
}
