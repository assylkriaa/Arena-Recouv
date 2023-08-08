import { Component, NgModule, OnInit, PipeTransform } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { MarchePipe } from '../marche.pipe';
import { client } from '../models/client';
import { dossier } from '../models/dossier';
import { groupe } from '../models/groupe';
import { marche } from '../models/marche';
import { recherche } from '../models/recherche';
import { region } from '../models/region';
import { seg } from '../models/seg';
import { ClientService } from '../services/client.service';
import { DossierService } from '../services/dossier.service';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';




@Component({
  
  selector: 'app-consultationgenerale',
  templateUrl: './consultationgenerale.component.html',
  styleUrls: ['./consultationgenerale.component.css'],
 
})
export class ConsultationgeneraleComponent implements OnInit {

  listdossier : any
  clients : any
  listRegions : any
  listgroupes : any
  listsegements : any
  listmarche : any
  listrecherche: any
  comptes:any
segs:any

  formaaat:any

  id: string =""
  p:dossier = new dossier();
  c:client = new client();
  r:region = new region();
  g:groupe = new groupe();
  s:seg = new seg();
  m:marche = new marche();
  listagences : any
  rech:recherche = new recherche();
  listtypedossier:any

  constructor(private sanitizer: DomSanitizer , private ac:ActivatedRoute,private ps:DossierService , private router:Router,private tt:ClientService ) { }

  ngOnInit(): void {

    this.segs = [
      {name: 'Classe 0', code: '0'},
      {name: 'Classe 1', code: '1'},
      {name: 'Classe 2', code: '2'},
      {name: 'Classe 3', code: '3'},
      {name: 'Classe 4', code: '4'},
   
  ];
   
    this.tt.getclients().subscribe(res=>this.clients=res);
    
   
   
/*
    this.ps.getalldossiers().subscribe(res => {
      this.listdossier = res;
      if (this.listdossier && this.listdossier.length > 0) {
        const clientIds = this.listdossier.map((dossier: { idClient: any; }) => dossier.idClient);
        const requests = clientIds.map((clientId: string) => this.tt.getclientbyid(clientId));
        forkJoin(requests).subscribe(responses => {
          this.clients = responses;
        });
      }
    });*/

    /*Dossier Mapping*/
 this.ps.getalltypeDossier().subscribe(res=>this.listtypedossier=res);
 this.ps.getallComptes().subscribe(res => {
   this.comptes = res;
   if (this.comptes && this.comptes.length > 0) {
     const dossierIDS = this.comptes.map((typeDossier: { iddossier: any; }) => typeDossier.iddossier);
     const requests = dossierIDS.map((regid: number) => this.ps.getTypeDossieryid(regid));
     forkJoin(requests).subscribe((responses: any) => {
       this.listtypedossier = responses;
     });
     console.log("ceci est le dossier",this.listdossier)
   }
 });

    /*Agence Mapping*/
 this.ps.getallagence().subscribe(res=>this.listagences=res);
 this.ps.getallComptes().subscribe(res => {
   this.comptes = res;
   if (this.comptes && this.comptes.length > 0) {
     const agenceIDS = this.comptes.map((agence: { idAgence: any; }) => agence.idAgence);
     const requests = agenceIDS.map((regid: number) => this.ps.getagenceid(regid));
     forkJoin(requests).subscribe(responses => {
       this.listagences = responses;
     });
   }
 });

    /*Region Mapping*/
    this.ps.getallregions().subscribe(res=>this.listRegions=res);
    this.tt.getclients().subscribe(res => {
      this.clients = res;
      if (this.clients && this.clients.length > 0) {
        const regionIds = this.clients.map((client: { idRegion: any; }) => client.idRegion);
        const requests = regionIds.map((regid: number) => this.ps.getRegionbyid(regid));
        forkJoin(requests).subscribe(responses => {
          this.listRegions = responses;
        });
      }
    });

    /*Groupe Mapping*/
    this.ps.getallgroupe().subscribe(res=>this.listgroupes=res);
    this.tt.getclients().subscribe(res => {
      this.clients = res;
      if (this.clients && this.clients.length > 0) {
        const groupeIds = this.clients.map((client: { idGroupe: any; }) => client.idGroupe);
        const requests = groupeIds.map((grpid: number) => this.ps.getgroupebyid(grpid));
        forkJoin(requests).subscribe(responses => {
          this.listgroupes = responses;
        });
      }
    });

     /*Segement Mapping*/
     this.ps.getallsegement().subscribe(res=>this.listsegements=res);
     this.tt.getclients().subscribe(res => {
       this.clients = res;
       if (this.clients && this.clients.length > 0) {
         const segIds = this.clients.map((client: { idseg: any; }) => client.idseg);
         const requests = segIds.map((segid: number) => this.ps.getgroupebyid(segid));
         forkJoin(requests).subscribe(responses => {
           this.listsegements = responses;
         });
       }
     });

     /*Marche Mapping*/
     this.ps.getallmarche().subscribe(res=>this.listmarche=res);
     this.tt.getclients().subscribe(res => {
       this.clients = res;
       if (this.clients && this.clients.length > 0) {
         const marcheIds = this.clients.map((client: { idmarche: any; }) => client.idmarche);
         const requests = marcheIds.map((id: number) => this.ps.getmarchebyid(id));
         forkJoin(requests).subscribe(responses => {
           this.listmarche = responses;
         });
       }
     });
   
  }

  getClientNomPrenom(idClient: string): string {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.nomPrenom : '';
  }
  getClientregion(idClient: string): number {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.region : '';
  }
  
  getClientparticulier(idClient: string): string {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.particulier : '';
  }
  getClientgroupe(idClient: string): number {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.groupe : '';
  }
  getClientsegment(idClient: string): number {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.segment : '';
  }
  getClientmarche(idClient: string): number {
    const client = this.clients.find((c: any) => c.idClient === idClient);
    return client ? client.marche : '';
  }
  getAgencelibelle(idm: number): string {
    const agence = this.listagences.find((r: any) => r.id === idm);
    return agence ? agence.libelle : '';
  }
  getRegionlibelle(idRegion: number): string {
    const region = this.listRegions.find((r: any) => r.id === idRegion);
    return region ? region.libelle : '';
  }
  getGroupelibelle(idGroupe: number): string {
    const groupe = this.listgroupes.find((r: any) => r.id === idGroupe);
    return groupe ? groupe.libelle : '';
  }
  getSeglibelle(idSeg: number): string {
    const seg = this.listsegements.find((r: any) => r.id === idSeg);
    return seg ? seg.libelle : '';
  }
  getMarchelibelle(idm: number): string {
    const marche = this.listmarche.find((r: any) => r.id === idm);
    return marche ? marche.libelle : '';
  }
  getTypedossier(idt: number): string {
    const td = this.listtypedossier.find((r: any) => r.id === idt);
    return td ? td.libelle : '';
  }
  
  openPopup(id:string) {
    const url = 'http://localhost:4200/dossierDetail/'+id; // Specify the URL of the popup window
    const windowName = '_blank'; // Specify the name of the window
    const windowFeatures = 'width=500,height=500'; // Specify the size and features of the window
    window.open(url, windowName, windowFeatures);
  }

  recherche
  (){
    console.log(this.rech);
    this.ps.recherche(this.rech).subscribe(res=>this.listrecherche=res);
    console.log(this.listrecherche);
    
  }

  reportPDF(idClient: string) {
    this.ps.reportClient( idClient).subscribe(res => {
      this.formaaat = res;
      
    });
    window.alert(" saved ")
  }

 

  
}


export class ConsultationgeneraleModule {
  transform(clients: client[], marches: marche[], id: any): string {
    if (!id) {
      return ''; // Return an empty string when id is undefined or falsy
    }
    const client = clients.find((c: client) => c.idClient === id);
    const marche = marches.find((m: marche) => m.id === id);
    return marche ? marche.libelle || '' : '';
  }

  
}
/*
export class PowerPipe   implements PipeTransform  {
  transform(clients: client[], marches: marche[], id: any): string {
    if (!id) {
      return ''; // Return an empty string when id is undefined or falsy
    }
    const client = clients.find((c: client) => c.idClient === id);
    const marche = marches.find((m: marche) => m.id === id);
    return marche ? marche.libelle || '' : '';
  }
}*/

  
