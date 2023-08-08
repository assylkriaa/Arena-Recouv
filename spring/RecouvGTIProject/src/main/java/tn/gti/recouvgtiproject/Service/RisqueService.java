package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Repository.ActionDao;
import tn.gti.recouvgtiproject.Repository.DossierDao;
import tn.gti.recouvgtiproject.Repository.RisqueDao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
public class RisqueService implements IRisqueService{
    @Autowired
    RisqueDao risqueDao;
    @Autowired
    ActionDao actionDao;
    @Autowired
    DossierDao dossierDao;

    @Override
    public Risque validate(Risque risque) {
        Action action = new Action();
        if(risqueDao.findAll().isEmpty()){
            return risqueDao.save(risque);
        }
        else{
        for(Risque r : risqueDao.findAll()){
            if(r.getIdRisque()==risque.getIdRisque()){
                r.setAgence(risque.getAgence());
                r.setTotalEngagement(risque.getTotalEngagement());
                r.setNatureProduit(risque.getNatureProduit());
                r.setMontantCreanceEntree(risque.getMontantCreanceEntree());
                r.setTauxICmarge(risque.getTauxICmarge());
                r.setTauxIRmarge(risque.getTauxIRmarge());
                r.setTauxIndexe(risque.getTauxIndexe());
                r.setMontantICEntree(risque.getMontantICEntree());
                r.setMontantRecupere(risque.getMontantRecupere());
                r.setMontantFrais(risque.getMontantFrais());
                r.setMontantRestantDut(risque.getMontantRestantDut());
                r.setObservation(risque.getObservation());
                r.setNumDossier(risque.getNumDossier());

                //Action Saving
                action.setIdClient(dossierDao.getDossierByNumDossier(risque.getNumDossier()).getIdClient());
                action.setNumDossier(risque.getNumDossier());
                action.setAgent("1234");
                action.setDate(LocalDateTime.now());
                action.setIdNom("ur");
                action.setObservation("Risque : "+risque.getIdRisque()+" , valider avec Succès le : "+LocalDateTime.now()+", Risque appliqué sur Client : "+dossierDao.getDossierByNumDossier(risque.getNumDossier()).getIdClient()+ "N°Dossier : "+risque.getNumDossier() );
                actionDao.save(action);

                return risqueDao.save(r);
            }
            else {

                    List<Risque> risques = risqueDao.findAll();
                    int lastIndex = risques.size() - 1;
                    Long lastIdRisque = risques.get(lastIndex).getIdRisque();
                    Long newIdRisque = lastIdRisque + 2;

                    //Action Saving
                    action.setIdClient(dossierDao.getDossierByNumDossier(risque.getNumDossier()).getIdClient());
                    action.setNumDossier(risque.getNumDossier());
                    action.setAgent("1234");
                    action.setDate(LocalDateTime.now());
                    action.setIdNom("ar");
                    action.setObservation("Risque : "+newIdRisque+" , valider avec Succès le : "+LocalDateTime.now()+", Risque appliqué sur Client : "+dossierDao.getDossierByNumDossier(risque.getNumDossier()).getIdClient()+ "N°Dossier : "+risque.getNumDossier() );
                    actionDao.save(action);


            }
        }
        return risque;
    }}

    @Override
    public List<Risque> returnAllRisques() {
        return risqueDao.findAll();
    }

    @Override
    public void delete(Long idRisque) {
        Risque risque = risqueDao.getRisqueByIdRisque(idRisque);
        Action action = new Action();
        action.setIdClient(dossierDao.getDossierByNumDossier(risque.getNumDossier()).getIdClient());
        action.setNumDossier(risque.getNumDossier());
        action.setAgent("1234");
        action.setDate(LocalDateTime.now());
        action.setIdNom("dr");
        action.setObservation("Risque : "+risque.getIdRisque()+" , est Supprimé avec Succès le : "+LocalDateTime.now()+" par Agent :"+action.getAgent());
        actionDao.save(action);

        risqueDao.deleteById(idRisque);
    }

    @Override
    public Risque getRisqueByIdRisque(Long idRisque) {
        return risqueDao.getRisqueByIdRisque(idRisque);
    }

    @Override
    public Risque ajouter(Risque risque) {
        return risqueDao.save(risque);
    }

    public List<Risque> reRisque( RechercheRisque r){
        List <Risque> result = new ArrayList<>();
        result = risqueDao.recherche(r.natureProduit, r.numDossier);
        List<Risque> uniqueLines = removeRedundantLines(result);

        Set<Long> uniqueNumRisque = new HashSet<>();
        List<Risque> finalList = new ArrayList<>();

        for (Risque risque : result) {
            if (!uniqueNumRisque.contains(risque.getIdRisque())) {
                uniqueNumRisque.add(risque.getIdRisque());
                finalList.add(risque);
            }
        }

        return finalList;
    }

    public static List<Risque> removeRedundantLines(List<Risque> lines) {
        Set<Risque> uniqueSet = new HashSet<>(lines);
        return new ArrayList<>(uniqueSet);
    }


}
