package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tn.gti.recouvgtiproject.Service.GarantieService;

@RestController
@RequestMapping("/garantie")
public class GarantieController {
    @Autowired
    GarantieService garantieService;
}
