package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tn.gti.recouvgtiproject.Entity.CompteRendu;
import tn.gti.recouvgtiproject.Service.CompteRenduService;

@RestController
@RequestMapping("/compterendu")
public class CompteRenduController {
    @Autowired
    CompteRenduService compteRenduService;

    @PostMapping("/PromesseReglement/{numDossier}")
    @ResponseBody
    public CompteRendu ajoutPromesseReglement(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutPromesseReglement(compteRendu,numDossier);
    }
    @PostMapping("/FacilitePaiement/{numDossier}")
    @ResponseBody
    public CompteRendu ajoutFacilitePaiement(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutFacilitePaiement(compteRendu,numDossier);
    }
    @PostMapping("/NonReconnaissance/{numDossier}")
    @ResponseBody
    public CompteRendu ajoutNonReconnaissance(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutNonReconn(compteRendu,numDossier);
    }
    @PostMapping("/visite/{numDossier}")
    @ResponseBody
    public CompteRendu ajoutVisite(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutVisite(compteRendu,numDossier);
    }
    @PostMapping("/Nouvellescoordon/{numDossier}")
    @ResponseBody
    public CompteRendu Nouvellescoordon(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutCordonnées(compteRendu,numDossier);
    }
    @PostMapping("/inc/{numDossier}")
    @ResponseBody
    public CompteRendu inc(@RequestBody CompteRendu compteRendu,@PathVariable String numDossier){
        return  compteRenduService.ajoutinc(compteRendu,numDossier);
    }
}
