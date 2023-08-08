package tn.gti.recouvgtiproject.Service;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.Action;
import tn.gti.recouvgtiproject.Repository.ActionDao;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.logging.Logger;

@Service
public class CsvExportService {

    @Autowired
    ActionDao actionDao;

    public CsvExportService(ActionDao actionDao) {
        this.actionDao = actionDao;
    }

    public void writeEmployeesToCsv(Writer writer) {

        List<Action> actions = actionDao.findAll();
        try (CSVPrinter csvPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT)) {
            csvPrinter.printRecord("idAction", "idClient", "idAgent","date","numDossier","observation","phase","idNom");
            for (Action employee : actions) {
                csvPrinter.printRecord(employee.getIdAction(), employee.getIdClient(), employee.getAgent(), employee.getDate(), employee.getNumDossier(),employee.getObservation(),employee.getPhase(),employee.getIdNom());
            }
        }  catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
