package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Risque;

import java.util.List;

public interface IRisqueService {
    public Risque validate(Risque risque);
    public List<Risque> returnAllRisques();
    public void delete(Long idRisque);
    public Risque getRisqueByIdRisque(Long idRisque);

    public Risque ajouter (Risque risque);
}
