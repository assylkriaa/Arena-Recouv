package tn.gti.recouvgtiproject.Service;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tn.gti.recouvgtiproject.Entity.Role;
import tn.gti.recouvgtiproject.Entity.User;
import tn.gti.recouvgtiproject.Repository.RoleDao;
import tn.gti.recouvgtiproject.Repository.UserDao;

import javax.annotation.PostConstruct;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.regex.Pattern;

@Service
@Slf4j
public class UserService implements  IUserService {



    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private LoginAttemptService loginAttemptService;

    @PostConstruct
    public void initRoleAndUser() {
        Role Directeur = new Role();
        Directeur.setRoleName("Directeur Departement Informatique");
        Directeur.setRoleDescription("Admin");
        roleDao.save(Directeur);


        User adminUser = new User();
        adminUser.setId("1234");
        adminUser.setUserPassword(getEncodedPassword("assyl123"));
        adminUser.setUserFirstName("Assyl");
        adminUser.setUserLastName("kriaa");
        adminUser.setAdress("Urbain Nord");
        adminUser.setEmail("assyl.kriaa@gmail.com");
        adminUser.setTel("+21699000000");
        Set<Role> adminRoles = new HashSet<>();
        adminRoles.add(Directeur);
        adminUser.setRole(adminRoles);
        userDao.save(adminUser);


    }
    public ResponseEntity<?> getUsers( ) {

       List<User> users = (List<User>) userDao.findAll();
        return ResponseEntity.status(HttpStatus.OK).body(users);

    }

    @Override
    public ResponseEntity<?> signUp(User user , boolean isStaff ){
        if (user.getId() ==null || user.getId().length() !=8  ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez corriger le champs CIN");
        }
        else if (  user.getUserFirstName() ==null || user.getUserFirstName().length() <2   ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un prenom correcte");
        }  else if (  user.getUserLastName() ==null || user.getUserLastName().length() <2  ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un nom correcte");
        }
        else if ( user.getAdress() == null  ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir une  adresse correcte");
        }
        else if ( user.getTel() == null || !Pattern.matches("\\b\\d{8}\\b", user.getTel()) ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un num tel correcte");
        }
        else if ( user.getEmail() == null || !Pattern.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", user.getEmail()) ) {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un email  correcte");
        }

        else {
            if(!isStaff) {
                Role role = roleDao.findById("Patient").get();

                Set<Role> userRoles = new HashSet<>();
                userRoles.add(role);
                user.setRole(userRoles);
            }
            user.setUserPassword(getEncodedPassword(user.getUserPassword()));
            userDao.save(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(user);
        }
    }


    public ResponseEntity<?> updateUser(User user ,String id ) {
        User oldUser=userDao.findById(id).get();
        if (user.getTel() != null) {
            if (!Pattern.matches("\\b\\d{8}\\b", user.getTel())) {
                return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un num tel correcte");
            }
            oldUser.setTel(user.getTel());
        }
         if (user.getEmail() != null) {
            if (!Pattern.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", user.getEmail())) {
                return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("veuillez saisir un email  correcte");
            }
            oldUser.setEmail(user.getEmail());
        }
         if (user.getAdress() != null) {
            oldUser.setAdress(user.getAdress());
        }

            userDao.save(oldUser);
            return ResponseEntity.status(HttpStatus.OK).body(oldUser);

    }
    @Transactional
    public ResponseEntity<?> deleteUser(String id ) {

        Optional<User> user = userDao.findById(id);
         if(!user.isPresent()) {
             return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("there is no such user with this id: "+id);
         }

        userDao.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).body("User deleted");

    }

    public ResponseEntity<?> banUser(String id)  {
        Optional<User> user = userDao.findById(id);
        if(user.isPresent() ){
            user.get().setIsBanned(Boolean.TRUE);
            userDao.save(user.get());
            log.debug("User banned", user);
            return  ResponseEntity.status(HttpStatus.OK).body("");
        }
        else return  ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("");
    }

    public ResponseEntity<?> allowUser(String id) {

        Optional<User> user = userDao.findById(id);
        if(user.isPresent() ){
            user.get().setIsBanned(Boolean.FALSE);
            userDao.save(user.get());
            loginAttemptService.evictUserFromLoginAttemptCache(user.get().getId());
            log.debug("User allowed", user);

            return  ResponseEntity.status(HttpStatus.OK).body("user authorized ");

        } else  return ResponseEntity.status(HttpStatus.OK).body("Invalid Id ");
    }

    public String getEncodedPassword(String password) {
        return passwordEncoder.encode(password);
    }

    public String getIdCurrentUser(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails)principal).getUsername();
        } else {
            return principal.toString();
        }
    }




/*

test fourat

*/
public User getUserById(String id)
    {
        return userDao.findById(id).get();
    }

    @Override
    public String getUserFirstAndLast(String id) {
    String result ="";
        for(User user:userDao.findAll()){
            if(user.getId().equals(id)){
                result = user.getUserFirstName()+"  "+user.getUserLastName() ;
            }
        }
        return result;
    }


}
