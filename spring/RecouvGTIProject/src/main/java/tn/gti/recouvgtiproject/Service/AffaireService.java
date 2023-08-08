package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Repository.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class AffaireService implements IAffaireService{
    @Autowired
    AffaireDao affaireDao;
    @Autowired
    ClientDao clientDao;
    @Autowired
    DossierDao dossierDao;
    @Autowired
    CompteDao compteDao;
    @Autowired
    ActionDao actionDao;
    @Autowired
    DossierService dossierService;

    @Override
    public List<Long> getAllIdsAffaire() {
        List<Long> result= new ArrayList<>();
        List<Affaire> list= new ArrayList<>();
        list = affaireDao.findAll();
        for(Affaire affaire : list){

            result.add(affaire.getIdAffaire());
        }
        return result;
    }

    @Override
    public Affaire getAffaireById(Long id) {
        return affaireDao.getAffaireByIdAffaire(id);
    }

    @Override
    public Affaire validateAffaire(Affaire affaire) {
        Action action = new Action();
        for (Affaire f : affaireDao.findAll()){
            if (f.getIdAffaire()==affaire.getIdAffaire()){
                f.setAffaire(affaire.getAffaire());
                f.setAvocat(affaire.getAvocat());
                f.setDispositif(affaire.getDispositif());
                f.setJuridiction(affaire.getJuridiction());
                f.setDateJugement(affaire.getDateJugement());
                f.setDateAudience(affaire.getDateAudience());
                f.setDateTransmission(affaire.getDateTransmission());
                f.setLocalite(affaire.getLocalite());
                f.setMntAutres(affaire.getMntAutres());
                f.setMntIntr(affaire.getMntIntr());
                f.setMntJugement(affaire.getMntJugement());
                f.setMntPr(affaire.getMntPr());
                f.setMontantImp(affaire.getMontantImp());
                f.setNatureAss(affaire.getNatureAss());
                f.setNcpt(affaire.getNcpt());
                f.setNomPrenom(affaire.getNomPrenom());
                f.setNumDossier(affaire.getNumDossier());
                f.setTribunal(affaire.getTribunal());

                //Action Saving
                action.setIdClient(dossierService.getIdClientByIdDossier(affaire.getNumDossier()));
                action.setNumDossier(affaire.getNumDossier());
                action.setAgent("1234");
                action.setDate(LocalDateTime.now());
                action.setIdNom("ua");
                action.setObservation("Affaire : "+affaire.getIdAffaire()+" , valider avec Succès le : "+LocalDateTime.now()+", Affaire appliqué sur Client : "+dossierService.getIdClientByIdDossier(affaire.getNumDossier())+ "N°compte : "+affaire.getNcpt() );
                actionDao.save(action);

                return affaireDao.save(f);
            }
            else {

                //Action Saving
                action.setIdClient(dossierService.getIdClientByIdDossier(affaire.getNumDossier()));
                action.setNumDossier(affaire.getNumDossier());
                action.setAgent("1234");
                action.setDate(LocalDateTime.now());
                action.setIdNom("aa");
                action.setObservation("Affaire : "+affaire.getIdAffaire()+" , valider avec Succès le : "+LocalDateTime.now()+", Affaire appliqué sur Client : "+dossierService.getIdClientByIdDossier(affaire.getNumDossier())+ "N°compte : "+affaire.getNcpt() );
                actionDao.save(action);

                return affaireDao.save(affaire);
            }
        }
        return affaire;
    }

    @Override
    public String getNomPrenomByIdClient(String idClient) {
        String a ="" ;
        List<Client> clientList=clientDao.findAll();
        for(Client client : clientList){
            if(client.getIdClient().equals(idClient)){
                a= client.getNomPrenom();
            }
        }
        return a;
    }

    @Override
    public String getNombyIddossier(String numDossier) {
        List<Dossier> dossierLis = dossierDao.findAll();
        String result="";
        for(Dossier dossier:dossierLis ){
            if(dossier.getNumDossier().equals(numDossier)){
                result =  getNomPrenomByIdClient(dossier.getIdClient());
            }
        }
        return result;
    }

    @Override
    public List<Long> getComptesByIdDossier(String idDossier) {
        List<Compte> comptes = new ArrayList<>();
        List<Long> result = new ArrayList<>();
        Dossier dossier = dossierDao.getDossierByNumDossier(idDossier);
        comptes=compteDao.getComptesByIdClient(dossier.getIdClient());
        for(Compte c:comptes){
            result.add(c.getNumCompte());

        }

        return result;
    }

    @Override
    public List<Long> getAffairesByNumDossier(String idDossier) {
        List<Long> AffaireIds = new ArrayList<Long>();
        List<Affaire> affaires = affaireDao.findAll();
        for(Affaire a: affaires){
            if(a.getNumDossier().equals(idDossier)){
            AffaireIds.add(a.getIdAffaire());}

        }
        return AffaireIds;
    }

    @Override
    public List<Long> getAffairesByIDclients(String idClient) {
        List<Long> result = new ArrayList<>();
        List<Dossier> dossierList = dossierDao.findDossiersByIdClient(idClient);
        List<Affaire> affaireList = affaireDao.findAll();
        for (Affaire affaire : affaireList) {
            for (Dossier dossier : dossierList) {
                String affaireNumDossier = affaire.getNumDossier();
                String dossierNumDossier = dossier.getNumDossier();
                if (affaireNumDossier != null && affaireNumDossier.equals(dossierNumDossier)) {
                    result.add(affaire.getIdAffaire());
                }
            }
        }
        return result;
    }


   /* public List<Long> getAffairesByIDclients(String idClient) {
        List<Long> result = new ArrayList<>();
        List<Dossier> dossierList = dossierDao.findDossiersByIdClient(idClient);
        List<Affaire> affaireList = affaireDao.findAll();
        for(Affaire affaire:affaireList){
            for(Dossier dossier:dossierList){
                if(affaire.getNumDossier().equals(dossier.getNumDossier()))
                {
                    result.add(affaire.getIdAffaire());
                }
            }

        }
        return result;
    }*/
}
