package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Region;
import tn.gti.recouvgtiproject.Repository.RegionDao;

import java.util.List;
@Service
@Slf4j
public class RegionService implements IRegionServie{
    @Autowired
    RegionDao regionDao;
    @Override
    public List<Region> getAllRegion() {
        return regionDao.findAll();
    }
}
