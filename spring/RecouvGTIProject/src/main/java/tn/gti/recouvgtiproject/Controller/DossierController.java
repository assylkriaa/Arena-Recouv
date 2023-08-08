package tn.gti.recouvgtiproject.Controller;

import net.kaczmarzyk.spring.data.jpa.domain.Between;
import net.kaczmarzyk.spring.data.jpa.domain.Equal;
import net.kaczmarzyk.spring.data.jpa.domain.In;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Service.*;

import javax.transaction.Transactional;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.List;

@RestController

@RequestMapping("/dossier")
public class DossierController {
    @Autowired
    DossierService dossierService;
    @Autowired
    RegionService regionService;
    @Autowired
    CompteService compteService;
    @Autowired
    RechercheService rechercheService;
    @Autowired
    ReportService reportService;



    @GetMapping("/getalldossier")
    public List<Dossier> getDossiers() {
        return dossierService.returnAllDossier();
    }

    @GetMapping("/getallregion")
    public List<Region> getRegions() {
        return regionService.getAllRegion();
    }

    @GetMapping("/getRegionbyId/{id}")
    public Region getRegionsByid(@PathVariable Long id) {
        return dossierService.returnRegionById(id);
    }

    @GetMapping("/getallgroups")
    public List<Groupe> getGroups() {
        return dossierService.returnGroupes();
    }

    @GetMapping("/getGroupnbyId/{id}")
    public Groupe getGroupByid(@PathVariable Long id) {
        return dossierService.returnGroupeById(id);
    }

    @GetMapping("/getallsegments")
    public List<Segment> getsegments() {
        return dossierService.returnSegments();
    }

    @GetMapping("/getSegmentbyId/{id}")
    public Segment getSegmentByid(@PathVariable Long id) {
        return dossierService.returnSegmentById(id);
    }

    @GetMapping("/getallMarches")
    public List<Marche> getMarches() {
        return dossierService.returnMarches();
    }

    @GetMapping("/getMarchebyId/{id}")
    public Marche getMarcheByid(@PathVariable Long id) {
        return dossierService.returnMarcheById(id);
    }

    @GetMapping("/getDossierByNumDossier/{id}")
    public Dossier getDossierBynumDossier(@PathVariable String  id) {
        return dossierService.getDossierByNumDossier(id);
    }

    @GetMapping("/getComptebyIdclient/{id}")
    public  List<Compte> getComptesbyIdclient(@PathVariable String id) {
        return compteService.getCompteByIdClient(id);
    }

    @GetMapping("/getAllcomptes")
    public  List<Compte> getAllComptes() {
        return compteService.getAllComptes();
    }

    @GetMapping("/getIdClientByIdDossier/{id}")
    public  String getIdClientByIdDossier(@PathVariable String  id) {
        return dossierService.getIdClientByIdDossier(id);
    }

    @GetMapping("/getallTypeDossier")
    public List<TypeDossier> getTypeDossier() {
        return dossierService.returnTypeDossier();
    }

    @GetMapping("/getTypeDossierbyId/{id}")
    public TypeDossier getTypeDossierByid(@PathVariable Long id) {
        return dossierService.returntypedossierById(id);
    }

    @GetMapping("/getallAgences")
    public List<Agence> getAgences() {
        return dossierService.returnAgences();
    }

    @GetMapping("/getAgencebyId/{id}")
    public Agence getAgenceByid(@PathVariable Long id) {
        return dossierService.returnAgenceById(id);
    }

    @GetMapping("/returnComptesRenduByDossier/{numDossier}")
    public List<CompteRendu> returnComptesRenduByDossier(@PathVariable String numDossier){
        return dossierService.returnComptesRenduByDossier(numDossier);
    }

    @GetMapping("/returnCompteRenduByidCR/{numCR}")
    public CompteRendu returnCompteRenduByidCR(@PathVariable Long numCR){
        return dossierService.returnCompteRenduByidCR(numCR);
    }
    @GetMapping("/returnallCompteRendu")
    public List<CompteRendu> returnallCompteRendu() {
        return dossierService.returnallCompteRendu();
    }

    @PostMapping("/recherche")
    @ResponseBody
    public List<Dossier> recherche(@RequestBody RechercheMC rechercheMC) {
        return rechercheService.rechercherDossiers(rechercheMC);
    }

    @GetMapping("/report/{format}")
    public String generateReport(@PathVariable String format) throws FileNotFoundException, JRException {
        return reportService.exportReport(format);
    }

    @GetMapping("/reportInfo/{format}/{idClient}")
    public String generateReport(@PathVariable String format ,@PathVariable String idClient ) throws FileNotFoundException, JRException {
        return reportService.infoReport(format,idClient);
    }

    @GetMapping("/reportNew/{idClient}")
    public String re(@PathVariable String idClient) throws SQLException, JRException {
        return reportService.generateCombinedReport(idClient);
    }
}
