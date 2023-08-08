package tn.gti.recouvgtiproject.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tn.gti.recouvgtiproject.Service.MissionService;

@RestController
@RequestMapping("/mission")
public class MissionController {
    @Autowired
    MissionService missionService;
}
