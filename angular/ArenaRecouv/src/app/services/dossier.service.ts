import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { agence } from '../models/agence';
import { compte } from '../models/compte';
import { compterendu } from '../models/compterendu';
import { dossier } from '../models/dossier';
import { groupe } from '../models/groupe';
import { marche } from '../models/marche';
import { recherche } from '../models/recherche';
import { region } from '../models/region';
import { seg } from '../models/seg';

@Injectable({
  providedIn: 'root'
})
export class DossierService {
   dossierURL : string ="http://localhost:8081/RecouvGTI/dossier/";
  constructor(private myHttp : HttpClient) { 
    
  }
  getalldossiers():Observable<dossier>{
    return this.myHttp.get<dossier>(this.dossierURL+"getalldossier/");
  }
  getallregions():Observable<region>{
    return this.myHttp.get<region>(this.dossierURL+"getallregion/");
  }
  getRegionbyid(id:number):Observable<region>{
    return this.myHttp.get<region>(this.dossierURL+"getRegionbyId/"+id);
  }

  getallgroupe():Observable<groupe>{
    return this.myHttp.get<groupe>(this.dossierURL+"getallgroups/");
  }
  getgroupebyid(id:number):Observable<groupe>{
    return this.myHttp.get<groupe>(this.dossierURL+"getGroupnbyId/"+id);
  }

  getallsegement():Observable<seg>{
    return this.myHttp.get<seg>(this.dossierURL+"getallsegments/");
  }
  getsegementbyid(id:number):Observable<seg>{
    return this.myHttp.get<seg>(this.dossierURL+"getSegmentbyId/"+id);
  }

  getallmarche():Observable<marche>{
    return this.myHttp.get<marche>(this.dossierURL+"getallMarches/");
  }
  getmarchebyid(id:number):Observable<marche>{
    return this.myHttp.get<marche>(this.dossierURL+"getMarchebyId/"+id);
  }
  getDossierbyidDossier(id:number):Observable<dossier>{
    return this.myHttp.get<dossier>(this.dossierURL+"getDossierByNumDossier/"+id);
  }
  getComptesbyidClient(id:string):Observable<compte>{
    return this.myHttp.get<compte>(this.dossierURL+"getComptebyIdclient/"+id);
  }
  getallComptes():Observable<compte>{
    return this.myHttp.get<compte>(this.dossierURL+"getAllcomptes/");
  }
  getIdClientByIdDossier(id:string){
    return this.myHttp.get<string>(this.dossierURL+"getIdClientByIdDossier/"+id);
  }

  getalltypeDossier():Observable<dossier>{
    return this.myHttp.get<dossier>(this.dossierURL+"getallTypeDossier/");
  }
  getTypeDossieryid(id:number):Observable<dossier>{
    return this.myHttp.get<dossier>(this.dossierURL+"getTypeDossierbyId/"+id);
  }

  getallagence():Observable<agence>{
    return this.myHttp.get<agence>(this.dossierURL+"getallAgences/");
  }
  getagenceid(id:number):Observable<agence>{
    return this.myHttp.get<agence>(this.dossierURL+"getAgencebyId/"+id);
  }
  getCompteeRenduParNumDossier(id:string):Observable<compterendu>{
    return this.myHttp.get<compterendu>(this.dossierURL+"returnComptesRenduByDossier/"+id);
  }
  getCompteeRenduParIdCompteRendu(id:number):Observable<compterendu>{
    return this.myHttp.get<compterendu>(this.dossierURL+"returnCompteRenduByidCR/"+id);
  }
  getCompteeRendus():Observable<compterendu>{
    return this.myHttp.get<compterendu>(this.dossierURL+"returnallCompteRendu/");
  }
  recherche(rech: recherche): Observable<dossier> {
    return this.myHttp.post<dossier>(this.dossierURL + 'recherche/', rech);
  }
  reportClient( id:string) {
    return this.myHttp.get<string>(this.dossierURL + 'reportNew/'+id);
  }
  
  
  
  /*async getIdClientByIdDossier(id: string): Promise<string> {
    const response = await this.myHttp.get<string>(this.dossierURL + "getIdClientByIdDossier/" + id).toPromise();
    return response ?? ''; // Return an empty string if the response is null or undefined
  }*/


}
