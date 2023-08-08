package tn.gti.recouvgtiproject.Service;

import io.swagger.v3.oas.annotations.info.Info;
import lombok.extern.slf4j.Slf4j;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.Compte;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.info;
import tn.gti.recouvgtiproject.Repository.ClientDao;
import tn.gti.recouvgtiproject.Repository.CompteDao;
import tn.gti.recouvgtiproject.Repository.DossierDao;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class ClientService implements IClientService{
    @Autowired
    ClientDao clientDao;
    @Autowired
    DossierDao dossierDao;
    @Autowired
    CompteDao compteDao;

    @Override
    public Client getClient(String idClient) {
        return clientDao.getClientByIdClient(idClient);
    }

    @Override
    public List<Client> getClients() {
        return clientDao.findAll();
    }

    @Override
    public info getClientInfo(String idClient) {
        info info = new info();
        Client client = clientDao.getClientByIdClient(idClient);
        List<Dossier> dossierList = dossierDao.findDossiersByIdClient(idClient);
        List<Compte> compteList = compteDao.getComptesByIdClient(idClient);
        info.setClient(client);
        info.setDossierList(dossierList);
        info.setComptes(compteList);

        return info;
    }



    public void generateReport(String idClient) {
        info info = getClientInfo(idClient);

        try {
            // Compile the main report
            InputStream reportTemplate = getClass().getResourceAsStream("C:\\RecouProjectGTI\\spring\\RecouvGTIProject\\src\\main\\resources\\info.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(reportTemplate);

            // Compile the subreports
            InputStream dossierSubreportTemplate = getClass().getResourceAsStream("C:\\RecouProjectGTI\\spring\\RecouvGTIProject\\src\\main\\resources\\dossiers.jrxml");
            JasperReport dossierSubreport = JasperCompileManager.compileReport(dossierSubreportTemplate);

            InputStream compteSubreportTemplate = getClass().getResourceAsStream("path_to_compte_subreport.jasper");
            JasperReport compteSubreport = JasperCompileManager.compileReport(compteSubreportTemplate);

            // Prepare data source for subreports
            JRBeanCollectionDataSource dossierDataSource = new JRBeanCollectionDataSource(info.getDossierList());
            JRBeanCollectionDataSource compteDataSource = new JRBeanCollectionDataSource(info.getComptes());

            // Set subreports and data sources as parameters
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("dossierList", dossierDataSource);
            parameters.put("comptes", compteDataSource);
            parameters.put("dossierSubreport", dossierSubreport);
            parameters.put("compteSubreport", compteSubreport);

            // Fill the report with data
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());

            // Export the report to PDF
            OutputStream outputStream = new FileOutputStream("path_to_output_file.pdf");
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
        } catch (JRException e) {
            throw new RuntimeException(e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }


    }
}
