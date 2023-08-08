package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Repository.DetailEngagementDao;

@Service
@Slf4j
public class DetailEngagementService implements IDetailEngagementService{
    @Autowired
    DetailEngagementDao detailEngagementDao;
}
