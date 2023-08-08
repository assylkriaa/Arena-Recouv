package tn.gti.recouvgtiproject.Service;

import tn.gti.recouvgtiproject.Entity.Client;
import tn.gti.recouvgtiproject.Entity.info;

import java.util.List;

public interface IClientService {
    public Client getClient(String idClient);
    public List<Client> getClients();

    public info getClientInfo(String idClient);
    public void generateReport(String idClient);

}
