import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { compterendu } from '../models/compterendu';

@Injectable({
  providedIn: 'root'
})
export class CompterenduService {
  compteRurl : string ="http://localhost:8081/RecouvGTI/compterendu/";
  constructor(private myHttp : HttpClient) { 
    
  }
  addPromesseReglement(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"PromesseReglement/"+id,compterendu)
  }
  addFacilitePaiement(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"FacilitePaiement/"+id,compterendu)
  }
  addNonReconn(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"NonReconnaissance/"+id,compterendu)
  }
  addVisite(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"visite/"+id,compterendu)
  }
  addcord(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"Nouvellescoordon/"+id,compterendu)
  }
  addinc(compterendu:compterendu,id:string){
    return this.myHttp.post(this.compteRurl+"inc/"+id,compterendu)
  }
}
