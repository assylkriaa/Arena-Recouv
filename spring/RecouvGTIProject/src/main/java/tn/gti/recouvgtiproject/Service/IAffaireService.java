package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Affaire;
import tn.gti.recouvgtiproject.Entity.Compte;

import java.util.List;

public interface IAffaireService {
    public List<Long> getAllIdsAffaire();
    public Affaire getAffaireById(Long id);

    public Affaire validateAffaire(Affaire affaire);

    public String getNomPrenomByIdClient(String idClient);
    public String getNombyIddossier(String Dossier);

    public List<Long> getComptesByIdDossier(String idDossier);

    public List<Long> getAffairesByNumDossier(String idDossier);

    public List<Long> getAffairesByIDclients(String idClient);
}
