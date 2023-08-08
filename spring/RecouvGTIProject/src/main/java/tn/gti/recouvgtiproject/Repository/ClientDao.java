package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Client;

import java.util.List;

@Repository
public interface ClientDao extends JpaRepository<Client, String> {
    public Client getClientByIdClient(String idClient);

    public List<Client> findByNomPrenom(String nomPrenom);
}
