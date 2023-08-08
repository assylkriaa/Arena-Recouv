package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Action;
import tn.gti.recouvgtiproject.Repository.ActionDao;

import java.util.List;

@Service
@Slf4j
public class ActionService implements IActionService{
    @Autowired
    ActionDao actionDao;


    @Override
    public List<Action> returnActionsByIdClient(String idClient) {
        return actionDao.returnActionsByIdClient(idClient);
    }

    @Override
    public List<Action> allAction() {
        return actionDao.findAll();
    }
}
