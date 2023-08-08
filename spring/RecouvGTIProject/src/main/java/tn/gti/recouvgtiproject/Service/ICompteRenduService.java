package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.CompteRendu;

public interface ICompteRenduService {

    public CompteRendu ajoutPromesseReglement(CompteRendu compteRendu, String numDossier);
    public CompteRendu ajoutFacilitePaiement(CompteRendu compteRendu, String numDossier);
    public CompteRendu ajoutNonReconn(CompteRendu compteRendu , String numDossier);
    public CompteRendu ajoutVisite(CompteRendu compteRendu , String numDossier);
    public CompteRendu ajoutCordonnées(CompteRendu compteRendu , String numDossier);
    public CompteRendu ajoutinc(CompteRendu compteRendu , String numDossier);
}
