package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tn.gti.recouvgtiproject.Service.CompteService;
import tn.gti.recouvgtiproject.Service.DetailEngagementService;

@RestController
@RequestMapping("/detailengagement")
public class DetailEngagementController {
    @Autowired
    DetailEngagementService detailEngagementService;
}
