import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { User } from '../models/user';
import { UserAuthServiceService } from './user-auth-service.service';

@Injectable({
  providedIn: 'root'
})
export class UserServiceService {

  public host: string="https://localhost:8081/RecouvGTI/user";
  PATH_OF_API = 'http://localhost:8081/RecouvGTI/user';

  requestHeader = new HttpHeaders({ 'No-Auth': 'True' });
  constructor(
    private httpclient: HttpClient,
    private userAuthService :UserAuthServiceService

  ) {}

  ngOnInit(): void {

  } public login(loginData: any) {
    return this.httpclient.post(this.PATH_OF_API + '/authenticate', loginData, {
      headers: this.requestHeader,
    });
  }
  public getUsers() : Observable<User[]>{
    return this.httpclient.get<User[]>(this.PATH_OF_API + '/getAll',{
      headers: this.requestHeader
    });

  }

  public banUser(id:any) : Observable<any>{
    return this.httpclient.put<any>(this.PATH_OF_API + '/ban/'+id,{
      headers: this.requestHeader
    });

  }

  public allowUser(id:any) : Observable<any>{
    return this.httpclient.put<any>(this.PATH_OF_API + '/allow/'+id,{
      headers: this.requestHeader
    });

  }

  public getUserDetails(id:any):Observable<User> {


    return this.httpclient.get<User>(`${this.PATH_OF_API}${'/getuser/'}${id}`, {
      headers: this.requestHeader
    });
  }

  update(user: User,id:any): Observable<any> {
    console.log(user);
    return this.httpclient.put<User>(this.PATH_OF_API+"/update/"+id, user,
      {
        headers: this.requestHeader,
      });
  }

     create(user: User): Observable<User> {
    console.log(user);
    return this.httpclient.post<User>(this.PATH_OF_API+"/signup", user,
    {
      headers: this.requestHeader,
    });
  }

  public roleMatch(allowedRoles: string[]): boolean {
    let isMatch = false;
    const userRoles: any = this.userAuthService.getRoles();
    if (userRoles != null && userRoles) {
      for (let i = 0; i < userRoles.length; i++) {

        for (let j = 0; j < allowedRoles.length; j++) {

          if (userRoles[i].roleName === allowedRoles[j]) {

            isMatch = true;
            return isMatch;
          }
        }
      }
    }
    return isMatch;

  }

 

   getUserByNickname(cin:string):Observable<User> {
    
    return this.httpclient.get<User> (`${this.PATH_OF_API}${'/getuser/'}${cin}`);

   }

   getUserFirstAndLast(cin:string):Observable<string>{
    return this.httpclient.get<string> (`${this.PATH_OF_API}${'/getUserNamebyID/'}${cin}`);
   }

}
