import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { client } from '../models/client';
import { dossier } from '../models/dossier';
import { groupe } from '../models/groupe';
import { marche } from '../models/marche';
import { region } from '../models/region';
import { seg } from '../models/seg';
import { ClientService } from '../services/client.service';
import { DocumentService } from '../services/document.service';
import { DossierService } from '../services/dossier.service';

@Component({
  selector: 'app-detaildossier',
  templateUrl: './detaildossier.component.html',
  styleUrls: ['./detaildossier.component.css']
})
export class DetaildossierComponent implements OnInit {
 
  p:dossier = new dossier();  
  listdossier : any
  clients : any
  c:client = new client();
  comptes:any
  listagences : any
  listRegions : any
  listgroupes : any
  listsegements : any
  listmarche : any
  listtypedossier : any
  listCompteRendus : any
  listdocument: any
  id: string =""
  r:region = new region();
  g:groupe = new groupe();
  s:seg = new seg();
  m:marche = new marche();


  constructor(private http: HttpClient ,private ac:ActivatedRoute,private docs:DocumentService ,private ps:DossierService , private tt:ClientService, private router:Router) { }

  ngOnInit(): void {
    let id = this.ac.snapshot.params['id'];
    this.ps.getDossierbyidDossier(id).subscribe(res=>this.p=res)
    this.tt.getclients().subscribe(res=>this.clients=res);
    
    this.ps.getCompteeRenduParNumDossier(id).subscribe(res=>this.listCompteRendus=res);
    this.docs.getallBynumDossier(id).subscribe(res=>this.listdocument=res);
   
    this.ps.getIdClientByIdDossier(this.ac.snapshot.params['id']).subscribe((clientId: string) => {
        this.ps.getComptesbyidClient(clientId).subscribe(res => {
          this.comptes = res;
          console.log("les comptes de client  : ",  this.comptes)
        });
      });
     
    

    this.ps.getalldossiers().subscribe(res => {
      this.listdossier = res;
      if (this.listdossier && this.listdossier.length > 0) {
        const clientIds = this.listdossier.map((dossier: { idClient: any; }) => dossier.idClient);
        const requests = clientIds.map((clientId: string) => this.tt.getclientbyid(clientId));
        forkJoin(requests).subscribe((responses: any) => {
          this.clients = responses;
        });
      }
    });

    /*Dossier Mapping*/
 this.ps.getalltypeDossier().subscribe(res=>this.listtypedossier=res);
 this.ps.getallComptes().subscribe(res => {
   this.comptes = res;
   if (this.comptes && this.comptes.length > 0) {
     const dossierIDS = this.comptes.map((typeDossier: { iddossier: any; }) => typeDossier.iddossier);
     const requests = dossierIDS.map((regid: number) => this.ps.getTypeDossieryid(regid));
     forkJoin(requests).subscribe(responses => {
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
  getAgencelibelle(idm: number): string {
    const agence = this.listagences.find((r: any) => r.id === idm);
    return agence ? agence.libelle : '';
  }
  getDossierlibelle(idm: number): string {
    const typedossier = this.listtypedossier.find((r: any) => r.id === idm);
    return typedossier ? typedossier.libelle : '';

  }

 
  downloadImage(fileName: string): void {
    const headers = new HttpHeaders().set('Accept', 'image/png'); // Set the Accept header to specify the desired response type
  
    this.http.get(`http://localhost:8081/RecouvGTI/doc/download/${fileName}`, { responseType: 'arraybuffer', headers: headers })
      .subscribe(response => {
        this.saveFile(response, fileName); // Save the downloaded file
      });
  }
  
  private saveFile(data: any, fileName: string): void {
    const blob = new Blob([data], { type: 'image/png' });
    const url = window.URL.createObjectURL(blob);
  
    const link = document.createElement('a');
    link.href = url;
    link.download = fileName;
    link.click();
  
    window.URL.revokeObjectURL(url);
  }
}
function subscribe(arg0: (clientId: string) => void) {
  throw new Error('Function not implemented.');
}

