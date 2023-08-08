package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Compte;

import java.util.List;

public interface ICompteService {
    public  List<Compte> getCompteByIdClient(String id);
    public List<Compte> getAllComptes();
}
