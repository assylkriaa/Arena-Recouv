package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.gti.recouvgtiproject.Entity.ImageData;

import java.util.List;
import java.util.Optional;

public interface StorageRepository extends JpaRepository<ImageData,Long> {


    List<ImageData> findAllByName(String fileName);
}
