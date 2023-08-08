import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, NgForm, Validators} from "@angular/forms";
import { Router } from '@angular/router';
import { User } from 'src/app/models/user';
import { UserServiceService } from 'src/app/services/user-service.service';
import { UserAuthServiceService } from 'src/app/services/user-auth-service.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user:User = new User();
  email: any;
  password: any;
  constructor(private userService: UserServiceService,
              private userAuthService: UserAuthServiceService,
              private router: Router) { }

  ngOnInit(): void {
  }
  login(loginForm: NgForm) {
    this.userService.login(loginForm.value).subscribe(
      (response: any) => {
        const statut = response.user.banned;
        if (statut === true) {
          // notification user banned
        }
        else{
          this.router.navigate(['/home']);
         /* this.userAuthService.setRoles(response.user.role);
          this.userAuthService.setToken(response.jwtToken);
          const user = response.user.userFirstName;
          localStorage.setItem('nomUser', JSON.stringify(user));
          const userId = response.user.id;
          localStorage.setItem('id', JSON.stringify(userId));
          console.log(user);
          const role = response.user.role[0].roleName;

          console.log("statut"+statut)
            this.router.navigate(['/home']);
          */

        }
      },
      () => {
        window.alert('identifiant ou mot de passe incorrect');
      }

    );
  }


}
