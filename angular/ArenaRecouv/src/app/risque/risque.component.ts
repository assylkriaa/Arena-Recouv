import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { rechrisque } from '../models/rechrisque';
import { risque } from '../models/risque';
import { DossierService } from '../services/dossier.service';
import { RisqueService } from '../services/risque.service';


@Component({
  selector: 'app-risque',
  templateUrl: './risque.component.html',
  styleUrls: ['./risque.component.css'],
  styles: [
    `
    .modal {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: none;
      justify-content: center;
      align-items: center;
    }

    .modal.show {
      display: flex;
    }

    .modal-content {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    }

    
    `
  ]
})
export class RisqueComponent implements OnInit {
  listRisques:any
  listagences : any
  idR:any
  dossiers:any
 
  r:risque = new risque();
 

  showModal = false;
  showModal2 = false;
  showModal3 = false;

  natureProduit:any
  nDossier:any
  rech:rechrisque=new rechrisque();
  listfiltres:any 
  
  constructor(private dialog: MatDialog,private http: HttpClient ,private ac:ActivatedRoute , private router:Router , private rs:RisqueService , private ps:DossierService) { }

  ngOnInit(): void {
    this.rs.getallRisques().subscribe(res=>this.listfiltres=res);
    this.rs.getallDossierIDS().subscribe(res=>this.dossiers=res);
   this.rs.getallRisques().subscribe(res=>this.listfiltres=res);
     /*Agence Mapping*/
 this.ps.getallagence().subscribe(res=>this.listagences=res);
 ;
  }
  onIdSelectionChange(){
    this.rs.getRisqueByIdRisque(this.idR).subscribe(res=>this.r=res);
    this.r={}
  }

  delete(id:number){
    this.rs.deleteRisque(id).subscribe();
    window.alert('Risque supprimer avec succès')
    window.location.reload();
  }
  ajouter(
  ){
    this.rs.ajouter(this.r).subscribe();
    console.log(this.r)
    window.alert('Risque added successfuly')
    window.location.reload();
  }

  valider(){
   

    this.rs.validerRisque(this.r).subscribe();
    console.log(this.r)
    window.alert('Risque validated successfuly')
    window.location.reload();
    

  }
  
  getAgencelibelle(idm: number): string {
    const agence = this.listagences.find((r: any) => r.id === idm);
    return agence ? agence.libelle : '';
  }

  openPopup() {
    const url = 'http://localhost:4200/risquevalidate'; // Specify the URL of the popup window
    const windowName = '_blank'; // Specify the name of the window
    const windowFeatures = 'width=500,height=500'; // Specify the size and features of the window
    window.open(url, windowName, windowFeatures);
  }

  openDialog(id:number) {
    this.showModal = true;
   
    
   
  }
  openDialog2(id:number) {
    this.showModal2 = true;
    if(id==0){this.r={}}else{
    this.rs.getRisqueByIdRisque(id).subscribe(res=>this.r=res);}
    
   
  }
  openDialog3(id:number) {
    this.showModal3 = true;
    if(id==0){this.r={}}else{
    this.rs.getRisqueByIdRisque(id).subscribe(res=>this.r=res);}
    
   
  }

  closeDialog() {
    this.showModal = false;
    this.showModal2 = false;
    this.showModal3 = false;

  }

  onFiltreChange(){

    this.rech.natureProduit=this.natureProduit;
    this.rech.numDossier=this.nDossier;
    this.rs.rechercheRisque(this.rech).subscribe(res=>this.listfiltres=res);
    this.rech={}
   
  }
 
  
 
}
