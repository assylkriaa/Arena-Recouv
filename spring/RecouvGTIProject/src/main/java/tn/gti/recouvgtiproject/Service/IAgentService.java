package tn.gti.recouvgtiproject.Service;

import org.springframework.web.bind.annotation.PathVariable;
import tn.gti.recouvgtiproject.Entity.Agent;

public interface IAgentService {
    public Agent ajoutAgent( Agent agent );
}
