package tn.gti.recouvgtiproject.Service;

import net.sf.jasperreports.engine.base.JRBasePrintPage;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.Compte;
import tn.gti.recouvgtiproject.Entity.Dossier;
import tn.gti.recouvgtiproject.Entity.info;
import tn.gti.recouvgtiproject.Repository.ClientDao;
import tn.gti.recouvgtiproject.Repository.DossierDao;
import net.sf.jasperreports.engine.*;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.*;

@Service
public class ReportService {
    @Autowired
    DossierDao dossierDao;
    @Autowired
    ClientService clientService;
    @Autowired
    ClientDao clientDao;
    private final DataSource dataSource;

    @Autowired
    public ReportService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public String exportReport(String reportFormat) throws FileNotFoundException, JRException {
        String path = "D:\\report";
        List<Dossier> dossiers = dossierDao.findAll();
        //load file and compile it
        File file = ResourceUtils.getFile("classpath:dossiers.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(dossiers);
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("createdBy", "Assyl Kriaa");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
        if (reportFormat.equalsIgnoreCase("html")) {
            JasperExportManager.exportReportToHtmlFile(jasperPrint, path + "\\dossiers.html");
        }
        if (reportFormat.equalsIgnoreCase("pdf")) {
            JasperExportManager.exportReportToPdfFile(jasperPrint, path + "\\dossiers.pdf");
        }

        return "report generated in path : " + path;
    }

    /*public String infoReport(String reportFormat,String idClient) throws FileNotFoundException, JRException {
        String path = "C:\\xampp\\htdocs\\report";
        info info = clientService.getClientInfo(idClient);
        //load file and compile it
        File file = ResourceUtils.getFile("classpath:info.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(Collections.singletonList(info));
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("createdBy", "Assyl Kriaa");
       // parameters.put("dossierListSubreport", "C:\\RecouProjectGTI\\spring\\RecouvGTIProject\\src\\main\\resources\\dossiers.jasper");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
        if (reportFormat.equalsIgnoreCase("html")) {
            JasperExportManager.exportReportToHtmlFile(jasperPrint, path + "\\"+idClient+"info.html");
        }
        if (reportFormat.equalsIgnoreCase("pdf")) {
            JasperExportManager.exportReportToPdfFile(jasperPrint, path + "\\"+idClient+"info.pdf");
        }

        return "report generated in path : " + path;
    }*/
    public String infoReport(String reportFormat, String idClient) throws FileNotFoundException, JRException {
        String path = "C:\\xampp\\htdocs\\report";
        List<Dossier> dossiers = dossierDao.findDossiersByIdClient(idClient);
        info info = clientService.getClientInfo(idClient);

        // Compile info report
        File infoFile = ResourceUtils.getFile("classpath:info.jrxml");
        JasperReport infoJasperReport = JasperCompileManager.compileReport(infoFile.getAbsolutePath());
        JRBeanCollectionDataSource infoDataSource = new JRBeanCollectionDataSource(Collections.singletonList(info));
        Map<String, Object> infoParameters = new HashMap<>();
        infoParameters.put("createdBy", "Assyl Kriaa");
        JasperPrint infoJasperPrint = JasperFillManager.fillReport(infoJasperReport, infoParameters, infoDataSource);

        // Compile dossiers report
        File dossiersFile = ResourceUtils.getFile("classpath:dossiers.jrxml");
        JasperReport dossiersJasperReport = JasperCompileManager.compileReport(dossiersFile.getAbsolutePath());
        JRBeanCollectionDataSource dossiersDataSource = new JRBeanCollectionDataSource(dossiers);
        Map<String, Object> dossiersParameters = new HashMap<>();
        dossiersParameters.put("createdBy", "Assyl Kriaa");
        JasperPrint dossiersJasperPrint = JasperFillManager.fillReport(dossiersJasperReport, dossiersParameters, dossiersDataSource);

        // Combine the two JasperPrint objects
     List<JRPrintPage> dossiersPages = dossiersJasperPrint.getPages();
        for (JRPrintPage page : dossiersPages) {
            infoJasperPrint.addPage(page);
        }



        // Export the combined report
        if (reportFormat.equalsIgnoreCase("html")) {
            JasperExportManager.exportReportToHtmlFile(infoJasperPrint, path  + "\\"+idClient+ "info.html");
        } else if (reportFormat.equalsIgnoreCase("pdf")) {
            JasperExportManager.exportReportToPdfFile(infoJasperPrint, path  + "\\"+idClient+ "info.pdf");
        }

        return "Combined report generated in path: " + path;
    }

    public String generateCombinedReport(String idClient) throws JRException, SQLException {
        String reportPath = "C:\\RecouProjectGTI\\spring\\RecouvGTIProject\\src\\main\\resources\\combined.jrxml";
        String outputFilePath = "C:\\xampp\\htdocs\\report\\" + idClient + "info.pdf";

        // Load the JRXML template
        JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);

        // Set the parameters
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("idClientP", idClient);

        // Create the JasperPrint object
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource.getConnection());

        // Export the report to PDF
        JasperExportManager.exportReportToPdfFile(jasperPrint, outputFilePath);

        return "Combined report generated in path: " + outputFilePath;
    }


    @Scheduled(cron = "${scheduled.job.cron}")
    public void JasperJob() throws JRException, SQLException {

        for(Client c : clientDao.findAll()){
            String result  = generateCombinedReport(c.getIdClient());
            System.out.println(result);
        }
    }

}

