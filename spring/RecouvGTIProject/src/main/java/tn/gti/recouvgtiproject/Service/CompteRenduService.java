package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.CompteRendu;
import tn.gti.recouvgtiproject.Repository.CompteRenduDao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class CompteRenduService implements ICompteRenduService{
@Autowired
    CompteRenduDao compteRenduDao;

    @Override
    public CompteRendu ajoutPromesseReglement(CompteRendu compteRendu , String numDossier) {
        /*List<CompteRendu> lr = compteRenduDao.findAll();
        Long id = Long.valueOf(lr.size());
         compteRendu.setNumeroCompteRendu(id);
        */
        Date date = new Date();

        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Promesse de réglement");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("MontantReglement:"+compteRendu.getMontantReglement()+"-DateReglement:"+compteRendu.getDateReglement()+"-LieuReglement:"+compteRendu.getLieuReglement()+"-"+"Type:Promesse de réglement");
        return compteRenduDao.save(compteRendu);
    }

    @Override
    public CompteRendu ajoutFacilitePaiement(CompteRendu compteRendu, String numDossier) {
        Date date = new Date();
        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Facilité de paiement");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("montantFacilitePaiement:"+compteRendu.getMontantFacilitePaiement()+"-NombreEcheance:"+compteRendu.getNombreEcheanceFacilitePaiement()+"-"+compteRendu.getDateEcheanceFP1()+":"+compteRendu.getMontantEcheanceFP1()+"-"+compteRendu.getDateEcheanceFP2()+":"+compteRendu.getMontantEcheanceFP2()+"-"+compteRendu.getDateEcheanceFP3()+":"+compteRendu.getMontantEcheanceFP3()+"-"+compteRendu.getDateEcheanceFP4()+":"+compteRendu.getMontantEcheanceFP4()+"-"+compteRendu.getDateEcheanceFP5()+":"+compteRendu.getMontantEcheanceFP5()+"-Type:Facilité de paiement");
        return compteRenduDao.save(compteRendu);
    }

    @Override
    public CompteRendu ajoutNonReconn(CompteRendu compteRendu, String numDossier) {
        Date date = new Date();
        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Pas de reconnaissance de la créance");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("Observation:"+compteRendu.getObservationNonReconaissanceCreance()+"-Type:Pas de reconnaissance de la créance");
        return compteRenduDao.save(compteRendu);
    }

    @Override
    public CompteRendu ajoutVisite(CompteRendu compteRendu, String numDossier) {
        Date date = new Date();
        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Visite");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("Date Visite:"+compteRendu.getDateVisite()+"Debut Heure Visite:"+compteRendu.getHeureVisiteDebut()+"Fin Heure Visite:"+compteRendu.getHeureVisiteFin()+"-Type:Visite");
        return compteRenduDao.save(compteRendu);
    }

    @Override
    public CompteRendu ajoutCordonnées(CompteRendu compteRendu, String numDossier) {
        Date date = new Date();
        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Nouvelles coordonnées");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("tel1:"+compteRendu.getTel1NC()+"tel2:"+compteRendu.getTel2NC()+"Fax:"+compteRendu.getFaxNC()+"adresse:"+compteRendu.getAdresseNC()+"-Type:Nouvelles coordonnées");
        return compteRenduDao.save(compteRendu);
    }

    @Override
    public CompteRendu ajoutinc(CompteRendu compteRendu, String numDossier) {
        Date date = new Date();
        compteRendu.setDateSaisieCompteRendu(date);
        compteRendu.setTypeCompteRendu("Incapacité");
        compteRendu.setNumDossier(numDossier);
        compteRendu.setCompteRendu("Incapacité Observation:"+compteRendu.getObservationIncapacite()+"-Type:Incapacité");
        return compteRenduDao.save(compteRendu);
    }
}
