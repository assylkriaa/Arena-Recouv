package tn.gti.recouvgtiproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.Document;
import tn.gti.recouvgtiproject.Entity.ImageData;
import tn.gti.recouvgtiproject.Service.DocumentService;
import tn.gti.recouvgtiproject.Service.ImageService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

import static org.springframework.http.MediaType.MULTIPART_FORM_DATA_VALUE;
import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequestMapping("/doc")
public class DocumentController {
    @Autowired
    DocumentService documentService;
    @Autowired
    ImageService imageService;
     /*
    @PostMapping("/upload")
    public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file ) {

        String fileName = file.getOriginalFilename();
        try {
            file.transferTo( new File("D:\\upload\\" + fileName));
            Path fileNameAndPath = Paths.get("D:\\upload\\" , file.getOriginalFilename());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        return ResponseEntity.ok("File uploaded successfully.");
    }*/


    @PostMapping("/upload/{numDossier}")
    @ResponseBody
    public Document upload(@RequestBody Document document , @PathVariable String numDossier) {


        return documentService.ajoutDocument(document,numDossier);
    }

    @GetMapping("/getAll")
    public List<Document> getallDocs() {
        return documentService.getAllDocuments();
    }

    @GetMapping("/getAllbynumDossier/{numDossier}")
    public List<ImageData> getallDocsBynumDossier(@PathVariable String numDossier) {
        return imageService.getFiles(numDossier);
    }

    @PostMapping("/up/{numDossier}")
    public ResponseEntity<?> uploadImage( MultipartFile file, @PathVariable String numDossier) throws IOException {
        String uploadImage = documentService.uploadImage(file,numDossier);
        return ResponseEntity.status(HttpStatus.OK)
                .body(uploadImage);
    }

    @GetMapping("/download/{fileName}")
    public ResponseEntity<?> downloadImage(@PathVariable String fileName){
        byte[] imageData=documentService.downloadImage(fileName);
        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf("image/png"))
                .body(imageData);

    }



}