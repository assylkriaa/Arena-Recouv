import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { affaire } from '../models/affaire';
import { mission } from '../models/mission';

@Injectable({
  providedIn: 'root'
})
export class AffaireService {
  AffairetURL : string ="http://localhost:8081/RecouvGTI/affaire/";
  constructor(private myHttp : HttpClient) { 
    
  }

  getAffaireIds():Observable<number>{
    return this.myHttp.get<number>(this.AffairetURL+"getAffaireId/");
  }
  getAffaireById(id:number){
    return this.myHttp.get<affaire>(this.AffairetURL+"getAffaireById/"+id);
  }

  validerAffaire(affaire: affaire): Observable<affaire> {
    return this.myHttp.post<affaire>(this.AffairetURL + 'validate/', affaire);
  }

 /* getNombyIddossier(id: string){
    return this.myHttp.get(this.AffairetURL + "getNombyIddossier/" + id);
    //, { responseType: 'text' }
  }*/
  getNombyIddossier(id: string): Observable<string> {
    return this.myHttp.get(this.AffairetURL + "getNombyIddossier/" + id, { responseType: 'text' });
  }

  getComptesByIdDossier(id:string):Observable<number>{
    return this.myHttp.get<number>(this.AffairetURL+"getComptesByIdDossier/"+id);
  }
  
  getAffaireIdsBynumDossier(id:string):Observable<number>{
    return this.myHttp.get<number>(this.AffairetURL+"getAffairesByNumDossier/"+id);
  }
  getAffaireIdsByIdClients(id:string):Observable<number>{
    return this.myHttp.get<number>(this.AffairetURL+"getAffairesByIDclients/"+id);
  }

  validerMission(mission: mission): Observable<mission> {
    return this.myHttp.post<mission>(this.AffairetURL + 'validateMission/', mission);
  }
  getMissionsIdsByIdClients(id:string):Observable<number>{
    return this.myHttp.get<number>(this.AffairetURL+"getMissionsByIDclient/"+id);
  }
  getMissionByIdMission(id:number):Observable<mission>{
    return this.myHttp.get<mission>(this.AffairetURL+"getMissionByidMission/"+id);
  }
}
