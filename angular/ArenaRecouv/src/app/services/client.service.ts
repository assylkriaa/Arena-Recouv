import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { action } from '../models/action';
import { client } from '../models/client';
import { nomenc } from '../models/nomenc';

@Injectable({
  providedIn: 'root'
})
export class ClientService {
  clientURL : string ="http://localhost:8081/RecouvGTI/client/";
  constructor(private myHttp : HttpClient) { 
    
  }
  getclientbyid(id:string):Observable<client>{
    return this.myHttp.get<client>(this.clientURL+"getClientByid/"+id);
  }
  getclients():Observable<client>{
    return this.myHttp.get<client>(this.clientURL+"getAll/");
  }

  getActions():Observable<action>{
    return this.myHttp.get<action>(this.clientURL+"allAction/");
  }
  getActionsByIdClient(id:string):Observable<action>{
    return this.myHttp.get<action>(this.clientURL+"getClientHistorique/"+id);
  }
  getNomenByIdNom(id:string):Observable<nomenc>{
    return this.myHttp.get<nomenc>(this.clientURL+"getNomen/"+id);
  }
  downloadCSV():Observable<string>{
    return this.myHttp.get<string>(this.clientURL+"download/");
  }
  getAllNomen():Observable<nomenc>{
    return this.myHttp.get<nomenc>(this.clientURL+"getAllNomen/");
  }
}

