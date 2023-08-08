package tn.gti.recouvgtiproject.Service;

import com.sun.jdi.LongValue;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Action;
import tn.gti.recouvgtiproject.Entity.Affaire;
import tn.gti.recouvgtiproject.Entity.Mission;
import tn.gti.recouvgtiproject.Repository.ActionDao;
import tn.gti.recouvgtiproject.Repository.AffaireDao;
import tn.gti.recouvgtiproject.Repository.MissionDao;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class MissionService implements IMissionService{
    @Autowired
    MissionDao missionDao;
    @Autowired
    ActionDao actionDao;
    @Autowired
    AffaireDao affaireDao;
    @Override
    public Mission validated(Mission ms) {
        Action action = new Action();
        for (Mission m : missionDao.findAll()){
            if (m.getIdMission()==ms.getIdMission()){
                m.setIdClient(ms.getIdClient());
                m.setNomPrenom(ms.getNomPrenom());
                m.setNcpt(ms.getNcpt());
                m.setTypeMission(ms.getTypeMission());
                m.setNatureAss(ms.getNatureAss());
                m.setTypePrestataire(ms.getTypePrestataire());
                m.setPrestataire(ms.getPrestataire());
                m.setDateTransmission(ms.getDateTransmission());
                m.setResultat(ms.getResultat());
                m.setSort(ms.getSort());
                m.setDate(ms.getDate());
                m.setMontant(ms.getMontant());
                m.setObservation(ms.getObservation());
                m.setIdAffaire(ms.getIdAffaire());
                //Action Saving
                action.setIdClient(ms.getIdClient());
                action.setNumDossier(affaireDao.getAffaireByIdAffaire(ms.getIdAffaire()).getNumDossier());
                action.setAgent("1234");
                action.setDate(LocalDateTime.now());
                action.setIdNom("um");
                action.setObservation("Mission : "+ms.getIdMission()+" valider avec Succès le : "+LocalDateTime.now()+", Mission appliqué sur Client : "+ms.getIdClient()+ "N°compte : "+ms.getNcpt() );
                actionDao.save(action);

                return missionDao.save(m);
            }
            else {

                //Action Saving
                action.setIdClient(ms.getIdClient());
                action.setNumDossier(affaireDao.getAffaireByIdAffaire(ms.getIdAffaire()).getNumDossier());
                action.setAgent("1234");
                action.setDate(LocalDateTime.now());
                action.setIdNom("am");
                action.setObservation("Mission :"+ms.getIdMission()+" ,  valider avec Succès le : "+LocalDateTime.now()+", Mission appliqué sur Client : "+ms.getIdClient()+ "N°compte : "+ms.getNcpt() );
                actionDao.save(action);
                return missionDao.save(ms);
            }
        }
        return ms;
    }

    @Override
    public List<Long> getIdMissionsByIdClient(String idClient) {
        List<Long> result = new ArrayList<>();
        List<Mission> missionList = missionDao.findAll();
        for (Mission mission : missionList) {
            String missionIdClient = mission.getIdClient();
            if (missionIdClient != null && missionIdClient.equals(idClient)) {
                result.add(mission.getIdMission());
            }
        }
        return result;
    }

    @Override
    public Mission getMissionByIdMission(Long idMission) {
        return missionDao.getMissionsByIdMission(idMission);
    }
}
