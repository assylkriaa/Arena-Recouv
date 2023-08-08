package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Service.AffaireService;
import tn.gti.recouvgtiproject.Service.MissionService;

import java.util.List;

@RestController
@RequestMapping("/affaire")
public class AffaireController {
    @Autowired
    AffaireService affaireService;
    @Autowired
    MissionService missionService;

    @GetMapping("/getAffaireId")
    public List<Long> getAllIdsAffaire()
    {
      return affaireService.getAllIdsAffaire();
    }
    @GetMapping("/getAffaireById/{id}")
    public Affaire getAffaireById(@PathVariable Long id)
    {
        return affaireService.getAffaireById(id);
    }

    @PostMapping("/validate")
    @ResponseBody
    public Affaire validate(@RequestBody Affaire affaire) {
        return affaireService.validateAffaire(affaire);
    }

    @GetMapping("/getNombyIddossier/{numDossier}")
    public String getNombyIddossier(@PathVariable String numDossier){
        return affaireService.getNombyIddossier(numDossier);
    }
    @GetMapping("/getComptesByIdDossier/{numDossier}")
    public List<Long> getComptesByIdDossier(@PathVariable String numDossier){
        return affaireService.getComptesByIdDossier(numDossier);
    }

    @GetMapping("/getAffairesByNumDossier/{idDossier}")
    public List<Long> getAffairesByNumDossier(@PathVariable String idDossier){
        return affaireService.getAffairesByNumDossier(idDossier);
    }

    @GetMapping("/getAffairesByIDclients/{idClient}")
    public List<Long> getAffairesByIDclients(@PathVariable String idClient){
        return affaireService.getAffairesByIDclients(idClient);
    }
    @PostMapping("/validateMission")
    @ResponseBody
    public Mission validateMission(@RequestBody Mission mission) {
        return missionService.validated(mission);
    }

    @GetMapping("/getMissionsByIDclient/{idClient}")
    public List<Long> getIdMissionsByIdClient(@PathVariable String idClient){
        return missionService.getIdMissionsByIdClient(idClient);
    }

    @GetMapping("/getMissionByidMission/{idMission}")
    public Mission getMissionByIdMission(@PathVariable Long idMission){
        return missionService.getMissionByIdMission(idMission);
    }
}

