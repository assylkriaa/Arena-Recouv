package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Mission;

import java.util.List;

public interface IMissionService {
    public Mission validated(Mission ms);
    public List<Long> getIdMissionsByIdClient(String idClient);
    public Mission getMissionByIdMission(Long idMission);
}
