package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.gti.recouvgtiproject.Entity.Affaire;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.RechercheRisque;
import tn.gti.recouvgtiproject.Entity.Risque;
import tn.gti.recouvgtiproject.Service.DossierService;
import tn.gti.recouvgtiproject.Service.RisqueService;

import java.util.ArrayList;
import java.util.List;

@RestController

@RequestMapping("/risque")
public class RisqueController {
    @Autowired
    RisqueService risqueService;
    @Autowired
    DossierService dossierService;

    @PostMapping("/validateRisque")
    @ResponseBody
    public Risque validate(@RequestBody Risque risque) {
        return risqueService.validate(risque);
    }

    @PostMapping("/ajouter")
    @ResponseBody
    public Risque ajouter(@RequestBody Risque risque) {
        return risqueService.ajouter(risque);
    }


    @GetMapping("/getAll")
    public List<Risque> getallRisque() {
        return risqueService.returnAllRisques();
    }

    @DeleteMapping ("/DeleteRisque/{idRisque}")
    public void deleteRisque(@PathVariable Long idRisque) {
         risqueService.delete(idRisque);
    }

    @GetMapping("/getAllDossierIDS")
    public List<String> getallDosIDS() {
        return dossierService.returnAllDossierIDS();
    }
    @GetMapping("/getRisqueByIdRisque/{idRisque}")
    public Risque getRisqueByIdRisque(@PathVariable Long idRisque) {
        return risqueService.getRisqueByIdRisque(idRisque);
    }
    @PostMapping("/rechercheR")
    public List<Risque> rechercherRisque(@RequestBody RechercheRisque risque) {

        return risqueService.reRisque(risque);


    }
}
