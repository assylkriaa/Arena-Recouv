package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Compte;
import tn.gti.recouvgtiproject.Repository.CompteDao;

import java.util.List;

@Service
@Slf4j
public class CompteService implements ICompteService {
    @Autowired
    CompteDao compteDao;

    @Override
    public  List<Compte> getCompteByIdClient(String id) {
        return  compteDao.getComptesByIdClient(id);
    }

    @Override
    public List<Compte> getAllComptes() {
        return compteDao.findAll();
    }
}
