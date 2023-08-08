package tn.gti.recouvgtiproject.Service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.RechercheMC;
import tn.gti.recouvgtiproject.Repository.ClientDao;
import tn.gti.recouvgtiproject.Repository.DossierDao;
import tn.gti.recouvgtiproject.Repository.RechercheDao;

import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Service
public class RechercheService {
   @Autowired
    DossierDao dossierDao;
    @Autowired
    DossierService dossierService;
    @Autowired
    ClientDao clientDao;
    @Autowired
    RechercheDao rechercheDao;
    public RechercheService(DossierDao dossierDao) {
        this.dossierDao = dossierDao;
    }

/*
    public List<Dossier> rechercherDossiers(

            RechercheMC r
    ) {

     List<Dossier> dossiers = new ArrayList<>();
     if (r.idClient != null ){
      dossiers =  dossierDao.findDossiersByIdClient(r.idClient);}
     else{
       dossiers = new ArrayList<>();
     }

     List<Dossier> dossiers1 = new ArrayList<>();
     if (r.agence != null ){
         dossiers1 = dossierService.findDossiersParAgence(r.agence);}
         else{
       dossiers1 = new ArrayList<>();
      }
     List<Dossier> dossiers2 = new ArrayList<>();
     if (r.marche != null ){
         dossiers2 = dossierService.findDossierParMarche(r.marche);}
     else{
       dossiers2 = new ArrayList<>();
     }

     List<Dossier> dossiers3 = new ArrayList<>();
     if (r.region != null ){
         dossiers3 = dossierService.findDossierParRegion(r.region);}
     else{
       dossiers3 = new ArrayList<>();
     }

     List<Dossier> dossiers4 = new ArrayList<>();
     if (r.groupe != null ){
       dossiers4 = dossierService.findDossierParGroupe(r.groupe);
     }
     else{
       dossiers4 = new ArrayList<>();
     }

     List<Dossier> dossiers5 = new ArrayList<>();
     if (r.segment != null ){
         dossiers5= dossierService.findDossierParSegment(r.segment);}
     else{
      dossiers5 = new ArrayList<>();
     }

     List<Dossier> dossiers6= new ArrayList<>();
     if (r.classeFinal != null ){
       dossiers6 =  dossierDao.findDossiersByClasseFinal(r.classeFinal);
     }
     else{
       dossiers6 = new ArrayList<>();
     }

     List<Dossier> dossiers7 = new ArrayList<>();
     if(r.typeDossier != null ){
       dossiers7 =  dossierDao.findDossiersByTypeDossier(r.typeDossier);
     } else{
       dossiers7 = new ArrayList<>();
     }
     List<Dossier> dossiers8 = new ArrayList<>();
     if(r.jourImpDu != null ){
       dossiers8 =  dossierDao.findDossiersByJourIMPdu(r.jourImpDu);
     }
     else{
       dossiers8 = new ArrayList<>();
     }
     List<Dossier> dossiers9 = new ArrayList<>();
     if(r.jourImpAu != null ){
      dossiers9 =  dossierDao.findDossiersByJourIMPau(r.jourImpAu);
     } else{
      dossiers9 = new ArrayList<>();
     }
     List<Dossier> dossiers10 = new ArrayList<>();
     if(r.jourSdbDu != null ){
      dossiers10 =  dossierDao.findDossiersByJourSDBdu(r.jourSdbDu);
     }else{
      dossiers10 = new ArrayList<>();
     }
     List<Dossier> dossiers11 = new ArrayList<>();
     if(r.jourSdbAu != null ){
       dossiers11 =  dossierDao.findDossiersByJourSDBau(r.jourSdbAu);
     }else{
       dossiers11 = new ArrayList<>();
     }
        // Appliquez les autres critères de recherche de manière similaire

        List<Dossier> result = new ArrayList<>();
        result.addAll(dossiers);
        result.addAll(dossiers1);
        result.addAll(dossiers2);
        result.addAll(dossiers3);
        result.addAll(dossiers4);
        result.addAll(dossiers5);
        result.addAll(dossiers6);
        result.addAll(dossiers7);
        result.addAll(dossiers8);
        result.addAll(dossiers9);
        result.addAll(dossiers10);
        result.addAll(dossiers11);

        List<Dossier> uniqueLines = removeRedundantLines(result);

     Set<String> uniqueNumDossiers = new HashSet<>();
     List<Dossier> finalList = new ArrayList<>();

     for (Dossier dossier : result) {
      if (!uniqueNumDossiers.contains(dossier.getNumDossier())) {
       uniqueNumDossiers.add(dossier.getNumDossier());
       finalList.add(dossier);
      }
     }

     return finalList;

    }*/

    public List<Dossier> rechercherDossiers(

            RechercheMC r
    ){
        List <Dossier> result = new ArrayList<>();
        result = rechercheDao.recherche(r.idClient,r.typeDossier,r.jourSdbDu,r.jourSdbAu,r.jourImpDu,r.jourImpAu,r.classeFinal,r.groupe,r.region,r.segment,r.marche,r.agence);
        List<Dossier> uniqueLines = removeRedundantLines(result);

        Set<String> uniqueNumDossiers = new HashSet<>();
        List<Dossier> finalList = new ArrayList<>();

        for (Dossier dossier : result) {
            if (!uniqueNumDossiers.contains(dossier.getNumDossier())) {
                uniqueNumDossiers.add(dossier.getNumDossier());
                finalList.add(dossier);
            }
        }

        return finalList;
    }


    public static List<Dossier> removeRedundantLines(List<Dossier> lines) {
        Set<Dossier> uniqueSet = new HashSet<>(lines);
        return new ArrayList<>(uniqueSet);
    }
}

