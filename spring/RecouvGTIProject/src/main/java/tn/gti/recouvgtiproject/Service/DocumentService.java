package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tn.gti.recouvgtiproject.Entity.Document;
import tn.gti.recouvgtiproject.Entity.ImageData;
import tn.gti.recouvgtiproject.Repository.DocumentDao;
import tn.gti.recouvgtiproject.Repository.StorageRepository;
import tn.gti.recouvgtiproject.util.ImageUtils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class DocumentService implements IDocumentService{
    @Autowired
    DocumentDao documentDao;

    @Autowired
    private StorageRepository repository;

    @Override
    public Document ajoutDocument(Document doc,String numDossier) {
        doc.setNumDossier(numDossier);
        Long id = documentDao.count() + 1 ;
        String currentFilePath = doc.getFichierPath();
        String newFilePath = "C:\\xampp\\htdocs\\images\\"+id+"."+doc.getTypeFichier(); // Spécifiez le nouveau chemin d'accès ici

        try {
            // Créer un objet Path pour le fichier actuel
            Path currentPath = Paths.get(currentFilePath);

            // Créer un objet Path pour le nouveau chemin d'accès
            Path newPath = Paths.get(newFilePath);

            // Déplacer le fichier vers le nouveau chemin d'accès
            Files.move(currentPath, newPath, StandardCopyOption.REPLACE_EXISTING);

            // Mettre à jour le chemin d'accès dans l'objet Document
            doc.setFichierPath(newFilePath);

        } catch (IOException e) {
            // Gérer les erreurs lors du déplacement du fichier
            e.printStackTrace();
            // Vous pouvez lancer une exception ou retourner une réponse d'erreur appropriée ici
        }
        return documentDao.save(doc);
    }

    @Override
    public List<Document> getAllDocuments() {
        return documentDao.findAll();
    }

    @Override
    public List<Document> findDocumentsByNumDossier(String numDossier) {
        return documentDao.findDocumentsByNumDossier(numDossier);
    }

    public String uploadImage(MultipartFile file , String numDossier) throws IOException {


        ImageData imageData =  repository.save(ImageData.builder().numDossier(numDossier)
                .name(file.getOriginalFilename())
                .type(file.getContentType())
                .imageData(ImageUtils.compressImage(file.getBytes())).build());

        if (imageData != null) {
            return "file uploaded successfully : " + file.getOriginalFilename();
        }
        return null;
    }

    public byte[] downloadImage(String fileName){
        List<ImageData> dbImageData = repository.findAllByName(fileName);
        byte[] images=ImageUtils.decompressImage(dbImageData.get(0).getImageData());
        return images;
    }

}
