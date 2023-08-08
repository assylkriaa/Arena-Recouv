package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Repository.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class DossierService implements IDossierService{
    @Autowired
    DossierDao dossierDao;
    @Autowired
    RegionDao regionDao;
    @Autowired
    GroupeDao groupeDao;
    @Autowired
    SegementDao segmentDao;
    @Autowired
    MarcheDao marcheDao;
    @Autowired
    AgenceDao agenceDao;
    @Autowired
    TypeDossierDao typeDossierDao;
    @Autowired
    CompteRenduDao compteRenduDao;
    @Autowired
    CompteDao compteDao;
    @Autowired
    ClientDao clientDao;

    @Override
    public List<Dossier> returnAllDossier() {
        return dossierDao.findAll();
    }

    @Override
    public Region returnRegionById(Long id) {
     return regionDao.getRegionById(id);
    }

    @Override
    public Groupe returnGroupeById(Long id) {
        return groupeDao.getGroupeById(id);
    }
    @Override
    public List<Groupe> returnGroupes() {
        return groupeDao.findAll();
    }

    @Override
    public Segment returnSegmentById(Long id) {
        return segmentDao.findSegmentById(id);
    }

    @Override
    public List<Segment> returnSegments() {
       return segmentDao.findAll();
    }

    @Override
    public Marche returnMarcheById(Long id) {
        return marcheDao.findMarcheById(id);
    }

    @Override
    public List<Marche> returnMarches() {
        return marcheDao.findAll();
    }

    @Override
    public Dossier getDossierByNumDossier(String idDossier) {
        return dossierDao.getDossierByNumDossier(idDossier);
    }

    @Override
    public String getIdClientByIdDossier(String numDossier) {
        return dossierDao.getDossierByNumDossier(numDossier).getIdClient();
    }

    @Override
    public TypeDossier returntypedossierById(Long id) {
        return typeDossierDao.findTypeDossierById(id);
    }

    @Override
    public List<TypeDossier> returnTypeDossier() {
        return typeDossierDao.findAll();
    }

    @Override
    public Agence returnAgenceById(Long id) {
        return agenceDao.findAgenceById(id);
    }

    @Override
    public List<CompteRendu> returnComptesRenduByDossier(String numDossier) {
      return   compteRenduDao.findCompteRendusByNumDossier(numDossier);
    }

    @Override
    public CompteRendu returnCompteRenduByidCR(Long idComptR) {
       return compteRenduDao.findCompteRenduByNumeroCompteRendu(idComptR);
    }

    @Override
    public List<CompteRendu> returnallCompteRendu() {
        return compteRenduDao.findAll();
    }

    @Override
    public List<String> returnAllDossierIDS() {
        List<String> result = new ArrayList<>();
        for(Dossier dossier:dossierDao.findAll()){
            result.add(dossier.getNumDossier());
        }
        return result;
    }

    @Override
    public List<Dossier> findDossiersParAgence(Long idAgence) {
        List<Dossier> listDossier = new ArrayList<>();
        List<Compte> lc = compteDao.findAll();
        for(Compte compte :lc){
            if(compte.getAgence()==idAgence){
                String clientID = compte.getIdClient();
                for(Dossier dossier : dossierDao.findAll() ){
                    if(dossier.getIdClient().equals(clientID)){
                        listDossier.add(dossier);
                    }
                }
            }
        }
        return listDossier;
    }

    @Override
    public List<Dossier> findDossierParMarche(Long idMarche) {
        List<Dossier> listDossier = new ArrayList<>();
        for( Client client : clientDao.findAll()){
            if(client.getMarche()==idMarche){
                String  clientID = client.getIdClient();
                for(Dossier dossier : dossierDao.findAll() ){
                    if(dossier.getIdClient().equals(clientID)){
                        listDossier.add(dossier);
                    }
                }

            }
        }
        return listDossier;
    }

    @Override
    public List<Dossier> findDossierParRegion(Long idRegion) {
        List<Dossier> listDossier = new ArrayList<>();
        for( Client client : clientDao.findAll()){
            if(client.getRegion()==idRegion){
                String  clientID = client.getIdClient();
                for(Dossier dossier : dossierDao.findAll() ){
                    if(dossier.getIdClient().equals(clientID)){
                        listDossier.add(dossier);
                    }
                }

            }
        }
        return listDossier;
    }

    @Override
    public List<Dossier> findDossierParGroupe(Long idGroupe) {
        List<Dossier> listDossier = new ArrayList<>();
        for( Client client : clientDao.findAll()){
            if(client.getGroupe()==idGroupe){
                String  clientID = client.getIdClient();
                for(Dossier dossier : dossierDao.findAll() ){
                    if(dossier.getIdClient().equals(clientID)){
                        listDossier.add(dossier);
                    }
                }

            }
        }
        return listDossier;
    }

    @Override
    public List<Dossier> findDossierParSegment(Long idSegement) {
        List<Dossier> listDossier = new ArrayList<>();
        for( Client client : clientDao.findAll()){
            if(client.getSegment()==idSegement){
                String  clientID = client.getIdClient();
                for(Dossier dossier : dossierDao.findAll() ){
                    if(dossier.getIdClient().equals(clientID)){
                        listDossier.add(dossier);
                    }
                }

            }
        }
        return listDossier;
    }

    @Override
    public List<Agence> returnAgences() {
        return agenceDao.findAll();
    }
}
