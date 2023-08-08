package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.gti.recouvgtiproject.Entity.Agent;
import tn.gti.recouvgtiproject.Entity.CompteRendu;
import tn.gti.recouvgtiproject.Repository.AgentDao;
import tn.gti.recouvgtiproject.Service.AgentService;

import java.util.List;

@RestController
@RequestMapping("/agent")
public class AgentController {
    @Autowired
    AgentDao agentDao;
    @Autowired
    AgentService agentService;

    @PostMapping("/addAgent")
    @ResponseBody
    public Agent ajoutAgent(@RequestBody Agent agent){
        return agentService.ajoutAgent(agent);
    }

    @GetMapping("/getAgentById/{idAgent}")
    public Agent getAgent(@PathVariable Long idAgent){
        return agentDao.getAgentByIdAgent(idAgent);
    }

    @GetMapping("/getAllAgents")
    public List<Agent> getAllAgent(){
        return agentDao.findAll();
    }

}
