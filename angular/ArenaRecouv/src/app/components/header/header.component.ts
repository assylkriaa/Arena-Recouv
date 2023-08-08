import { Component, OnInit } from '@angular/core';

import {Router} from "@angular/router";

import { UserAuthServiceService } from 'src/app/services/user-auth-service.service';
import { UserServiceService } from 'src/app/services/user-service.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  idCurrentUser: string | null | undefined;

  constructor(private userAuthService: UserAuthServiceService,
              private router: Router,
              private userService: UserServiceService) {
  }

  ngOnInit(): void {
    this.idCurrentUser = this.userAuthService.getUserId()
  }

  logout() {
    this.userAuthService.clear();
    this.router.navigate(['/home']); // Redirection vers la route 'accueil'
    this.idCurrentUser = null;
  }

  goToBack() {

    this.router.navigate(['/back']); // Redirection vers la route 'accueil'

  }

  roleMatch(): boolean {
    return this.userService.roleMatch(['HeadSupervisor'])
  }
}
