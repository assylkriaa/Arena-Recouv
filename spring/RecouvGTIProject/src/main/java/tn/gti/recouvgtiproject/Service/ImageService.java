package tn.gti.recouvgtiproject.Service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.gti.recouvgtiproject.Entity.ImageData;
import tn.gti.recouvgtiproject.Repository.ImageDao;

import java.util.List;

@Service
@Slf4j
public class ImageService implements IImageService{
    @Autowired
    ImageDao imageDao;


    @Override
    public List<ImageData> getFiles(String numDossier) {
        return imageDao.getImageDataByNumDossier(numDossier);
    }
}
