import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { rechrisque } from '../models/rechrisque';
import { risque } from '../models/risque';

@Injectable({
  providedIn: 'root'
})
export class RisqueService {
  risqueURL : string ="http://localhost:8081/RecouvGTI/risque/";
  constructor(private myHttp : HttpClient) { 

  }
   getallRisques():Observable<risque>{
    return this.myHttp.get<risque>(this.risqueURL+"getAll/");
  }
  validerRisque(risque: risque): Observable<risque> {
    return this.myHttp.post<risque>(this.risqueURL + 'validateRisque/', risque);
  }
  ajouter(risque: risque): Observable<risque> {
    return this.myHttp.post<risque>(this.risqueURL + 'ajouter/', risque);
  }
  deleteRisque(id: number){
    return this.myHttp.delete<risque>(this.risqueURL + 'DeleteRisque/'+id);
  }

  getallDossierIDS():Observable<string>{
    return this.myHttp.get<string>(this.risqueURL+"getAllDossierIDS/");
  }

  getRisqueByIdRisque(id:number):Observable<risque>{
    return this.myHttp.get<risque>(this.risqueURL+"getRisqueByIdRisque/"+id);
  }
  rechercheRisque(r:rechrisque):Observable<risque>{
    return this.myHttp.post<risque>(this.risqueURL+"rechercheR/", r);
  }
}
