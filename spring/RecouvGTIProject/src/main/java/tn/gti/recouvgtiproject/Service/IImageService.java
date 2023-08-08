package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.ImageData;

import java.util.List;

public interface IImageService {
    public List<ImageData> getFiles(String numDossier);
}
