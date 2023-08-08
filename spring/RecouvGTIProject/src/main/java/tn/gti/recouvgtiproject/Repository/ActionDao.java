package tn.gti.recouvgtiproject.Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import tn.gti.recouvgtiproject.Entity.Action;

import java.util.List;

@Repository
public interface ActionDao extends JpaRepository<Action,Long> {

    @Query(value = "CALL displayActionsByClient(:idClient);", nativeQuery = true)
    public List<Action> returnActionsByIdClient(@Param("idClient") String idClient);


}
