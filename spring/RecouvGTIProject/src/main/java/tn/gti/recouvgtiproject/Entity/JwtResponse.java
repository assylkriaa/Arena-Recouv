package tn.gti.recouvgtiproject.Entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class JwtResponse {

    private User user;
    private String jwtToken;


}
