package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.ImageData;

import java.util.List;

@Repository
public interface ImageDao extends JpaRepository<ImageData,Long> {
    public List<ImageData> getImageDataByNumDossier(String numDossier);
}
