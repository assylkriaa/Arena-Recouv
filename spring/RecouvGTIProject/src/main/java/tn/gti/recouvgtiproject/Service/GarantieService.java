package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Repository.GarantieDao;

@Slf4j
@Service
public class GarantieService implements IGarantieService{
@Autowired
    GarantieDao garantieDao;
}


