package tn.gti.recouvgtiproject.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.User;


@Repository
public interface UserDao extends CrudRepository<User, String> {


}
