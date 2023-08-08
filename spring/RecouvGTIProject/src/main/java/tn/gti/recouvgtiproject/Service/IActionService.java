package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Action;

import java.util.List;

public interface IActionService {
    public List<Action> returnActionsByIdClient(String idClient);
    public List<Action> allAction();
}
