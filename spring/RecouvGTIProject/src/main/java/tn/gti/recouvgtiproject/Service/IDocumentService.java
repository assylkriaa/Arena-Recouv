package tn.gti.recouvgtiproject.Service;

import org.springframework.web.multipart.MultipartFile;
import tn.gti.recouvgtiproject.Entity.Document;

import java.io.IOException;
import java.util.List;

public interface IDocumentService {
    public Document ajoutDocument(Document doc,String numDossier);

    public List<Document> getAllDocuments();
    public List<Document> findDocumentsByNumDossier(String numDossier);

    public String uploadImage(MultipartFile file , String numDossier) throws IOException;
}
