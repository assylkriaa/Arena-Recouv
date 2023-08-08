package tn.gti.recouvgtiproject.Service;

import org.springframework.http.ResponseEntity;
import tn.gti.recouvgtiproject.Entity.User;

public interface IUserService {

    public ResponseEntity<?> getUsers( );

    public ResponseEntity<?> signUp(User user , boolean isStaff );

    public ResponseEntity<?> updateUser(User user ,String id );

    public ResponseEntity<?> deleteUser(String id ) ;

    public String getEncodedPassword(String password);

    public ResponseEntity<?> allowUser(String id);

    public ResponseEntity<?> banUser(String id);
    public User getUserById(String id);

    public String getUserFirstAndLast(String id);
}
