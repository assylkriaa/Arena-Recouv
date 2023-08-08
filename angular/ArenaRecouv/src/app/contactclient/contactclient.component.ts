import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { SelectItem } from 'primeng/api';
import { forkJoin } from 'rxjs';
import { client } from '../models/client';
import { compterendu } from '../models/compterendu';
import { document } from '../models/document';
import { dossier } from '../models/dossier';
import { FileDetails } from '../models/FileDetails';
import { groupe } from '../models/groupe';
import { marche } from '../models/marche';
import { region } from '../models/region';
import { seg } from '../models/seg';
import { ClientService } from '../services/client.service';
import { CompterenduService } from '../services/compterendu.service';
import { DocumentService } from '../services/document.service';
import { DossierService } from '../services/dossier.service';

@Component({
  selector: 'app-contactclient',
  templateUrl: './contactclient.component.html',
  styleUrls: ['./contactclient.component.css']
})
export class ContactclientComponent implements OnInit{
 
  p:dossier = new dossier();  
  listdossier : any
  clients : any
  c:client = new client();
  comptes:any
  listCompteRendus : any
  listagences : any
  listRegions : any
  listgroupes : any
  listsegements : any
  listmarche : any
  listtypedossier : any
  listdocument:any
  selectedOption:string="";
  id: string =""
  r:region = new region();
  g:groupe = new groupe();
  s:seg = new seg();
  m:marche = new marche();
  d:document =new document();
  cr:compterendu = new compterendu();
  lieuReglementOptions: SelectItem[] = [
    { label: 'Tunis', value: 'Tunis' },
    { label: 'Nabeul', value: 'Nabeul' },
    { label: 'Sfax', value: 'Sfax' },
    { label: 'Monastir', value: 'Monastir' }
  ];

  file!: File;
  fileDetails!: FileDetails;
  fileUris: Array<string> = [];

  selectedFile: File | null = null;
  
  constructor(private http: HttpClient ,private sanitizer: DomSanitizer,private ac:ActivatedRoute,private ps:DossierService , private docs:DocumentService,private tt:ClientService, private rr:CompterenduService, private router:Router) { }

  ngOnInit(): void {
    this.selectedOption=""
    let id = this.ac.snapshot.params['id'];
    this.ps.getDossierbyidDossier(id).subscribe(res=>this.p=res)
    this.tt.getclients().subscribe(res=>this.clients=res);
    this.ps.getCompteeRenduParNumDossier(id).subscribe(res=>this.listCompteRendus=res);
    this.docs.getallBynumDossier(id).subscribe(res=>this.listdocument=res);
   

             

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

  addPromessePaiement(){
    console.log(this.cr);
    prompt("Promesse de paiement saved");
    this.rr.addPromesseReglement(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }
  addFacilitePaiement
  (){
    console.log(this.cr);
    prompt("Facilite de paiement saved");
    this.rr.addFacilitePaiement(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }

  addNonReconn
  (){
    console.log(this.cr);
    prompt("Non Reconnaissance de creance saved");
    this.rr.addNonReconn(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }
  addVisite
  (){
    
    if (
      this.cr.heureVisiteDebut !== undefined &&
      this.cr.heureVisiteFin !== undefined &&
      this.cr.heureVisiteFin <= this.cr.heureVisiteDebut
    ) {
      // Afficher une erreur ou prendre une autre action appropriée lorsque l'heure de fin est inférieure ou égale à l'heure de début
      console.log("L'heure de fin doit être supérieure à l'heure de début.");
      return;
    }
    console.log(this.cr);
    prompt("visite saved");
    this.rr.addVisite(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }

  addCord
  (){
    console.log(this.cr);
    this.rr.addcord(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }
  addInc
  (){
    console.log(this.cr);
    this.rr.addinc(this.cr,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    window.location.reload();
  }
  async addimg(){
    
    this.docs.upload(this.d,this.ac.snapshot.params['id']).subscribe(()=>this.router.navigate(['/contactClient/'+this.ac.snapshot.params['id']]));
    prompt("File uploaded");

  }
  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
  }

  async uploadImage() {
    if (this.selectedFile) {
      const formData: FormData = new FormData();
      formData.append('file', this.selectedFile, this.selectedFile.name);
      
      this.http.post('http://localhost:8081/RecouvGTI/doc/up/'+ this.ac.snapshot.params['id'], formData ).subscribe(
        response => {
          console.log('Image uploaded successfully'); 
        },
        error => {
          console.error('Error uploading image:', error);
        }
      );
      window.alert("File uploaded");
      window.location.reload();
    }
  }
 
  
  transform(url:string) {
    return this.sanitizer.bypassSecurityTrustResourceUrl(url);
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

  

}
