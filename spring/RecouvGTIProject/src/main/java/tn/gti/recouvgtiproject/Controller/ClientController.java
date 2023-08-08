package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tn.gti.recouvgtiproject.Entity.*;
import tn.gti.recouvgtiproject.Repository.ActionDao;
import tn.gti.recouvgtiproject.Repository.nomenDao;
import tn.gti.recouvgtiproject.Service.ActionService;
import tn.gti.recouvgtiproject.Service.ClientService;
import tn.gti.recouvgtiproject.Service.CsvExportService;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController

@RequestMapping("/client")
public class ClientController {
    @Autowired
    ClientService clientService;
    @Autowired
    ActionService actionService;
    @Autowired
    nomenDao nomenDao;
    @Autowired
    CsvExportService csvExportService;

    @GetMapping("/getClientByid/{id}")
    public Client getClient(@PathVariable String id) {
        return clientService.getClient(id);
    }
    @GetMapping("/getAll")
    public List<Client> getallClient() {
        return clientService.getClients();
    }

    @GetMapping("/getClientInfo/{idClient}")
    public info getClientInfo(@PathVariable String idClient) {
        return clientService.getClientInfo(idClient);
    }


    @GetMapping("/getClientHistorique/{idClient}")
    public List<Action> getClientHistorique(@PathVariable String idClient) {
        return actionService.returnActionsByIdClient(idClient);
    }

    @GetMapping("/allAction")
    public List<Action> getActions() {
        return actionService.allAction();
    }

    @GetMapping("/getNomen/{idNom}")
    public Nomenclature getNomen(@PathVariable String idNom) {
        return nomenDao.getNomenclatureByIdNom(idNom);
    }

    @GetMapping("/download")
    public void getAllEmployeesInCsv(HttpServletResponse servletResponse) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PrintWriter writer = new PrintWriter(outputStream);

        // Write the CSV content to the ByteArrayOutputStream
        csvExportService.writeEmployeesToCsv(writer);
        writer.flush();

        // Set the response headers for CSV download
        servletResponse.setContentType("text/csv");
        servletResponse.setHeader("Content-Disposition", "attachment; filename=\"actions.csv\"");

        // Write the ByteArrayOutputStream to the response OutputStream
        ServletOutputStream responseOutputStream = servletResponse.getOutputStream();
        outputStream.writeTo(responseOutputStream);
        outputStream.flush();
        responseOutputStream.flush();
        responseOutputStream.close();
    }

    @GetMapping("/getAllNomen")
    public List<Nomenclature> getAllNomen() {
        return nomenDao.findAll();
    }

}
