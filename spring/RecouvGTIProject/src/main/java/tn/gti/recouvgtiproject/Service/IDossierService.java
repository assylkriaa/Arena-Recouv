package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.*;

import java.util.List;

public interface IDossierService {
    public List<Dossier> returnAllDossier();
    public Region returnRegionById(Long id);
    public Groupe returnGroupeById(Long id) ;
    public List<Groupe> returnGroupes();
    public Segment returnSegmentById(Long id) ;
    public List<Segment> returnSegments();
    public Marche returnMarcheById(Long id) ;
    public List<Marche> returnMarches();
    public Dossier getDossierByNumDossier(String idDossier);

    public String getIdClientByIdDossier(String numDossier);

    public TypeDossier returntypedossierById(Long id) ;
    public List<TypeDossier> returnTypeDossier();
    public Agence returnAgenceById(Long id) ;
    public List<Agence> returnAgences();
    public List<CompteRendu> returnComptesRenduByDossier(String numDossier);
    public CompteRendu returnCompteRenduByidCR(Long idComptR);
    public List<CompteRendu> returnallCompteRendu();

    public List<String> returnAllDossierIDS();
    /**
     * Flitre de recherche
     * */
    public List<Dossier> findDossiersParAgence(Long idAgence);
    public List<Dossier> findDossierParMarche(Long idMarche);
    public List<Dossier> findDossierParRegion(Long idRegion);
    public List<Dossier> findDossierParGroupe(Long idGroupe);
    public List<Dossier> findDossierParSegment(Long idGroupe);
}
