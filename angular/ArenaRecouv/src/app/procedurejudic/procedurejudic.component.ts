import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { affaire } from '../models/affaire';
import { AffaireService } from '../services/affaire.service';
import { ClientService } from '../services/client.service';
import { DocumentService } from '../services/document.service';
import { DossierService } from '../services/dossier.service';

@Component({
  selector: 'app-procedurejudic',
  templateUrl: './procedurejudic.component.html',
  styleUrls: ['./procedurejudic.component.css']
})
export class ProcedurejudicComponent implements OnInit {
  oldNumAffaires:any
  selectedAffaireId!: number;
  selectedIdDossier!: string;
  comptes:any
  nomPrenom!: string;
  aff:affaire = new affaire();  
  tf: affaire = { idAffaire: 0 };
  constructor(private http: HttpClient ,private ac:ActivatedRoute,private fs:AffaireService ,private ps:DossierService , private tt:ClientService, private router:Router) { }

  ngOnInit(): void {
    this.fs.getAffaireIds().subscribe(res=>this.oldNumAffaires=res);
    //this.fs.getAffaireIdsBynumDossier(this.selectedIdDossier).subscribe(res=>this.oldNumAffaires=res);
    this.fs.getAffaireById(this.selectedAffaireId).subscribe(res=>this.aff=res)

    this.fs.getAffaireById(this.selectedAffaireId).subscribe(res=>this.aff=res)

    

   
    
   
  }
  onAffaireSelectionChange(){
    this.fs.getAffaireById(this.selectedAffaireId).subscribe(res=>this.aff=res)
    this.selectedAffaireId = this.aff.idAffaire !== undefined ? this.aff.idAffaire : 0;
this.selectedIdDossier = this.aff.numDossier !== undefined ? this.aff.numDossier : '';
this.fs.getComptesByIdDossier(this.selectedIdDossier).subscribe(res => {
  this.comptes = res; 
});

    //this.selectedIdDossier = this.aff.numDossier
  }
  valideraffaire(){
    this.aff.idAffaire=this.selectedAffaireId;
    this.aff.numDossier=this.selectedIdDossier;

    this.fs.validerAffaire(this.aff).subscribe(()=>this.router.navigate(['/procedurejudic/']));
    window.alert('Affaire validated successfuly')
    window.location.reload();

  }
  onIdDossierSelectionChange(){
    this.fs.getNombyIddossier(this.selectedIdDossier).subscribe(res=>this.aff.nomPrenom=res)
    this.fs.getComptesByIdDossier(this.selectedIdDossier).subscribe(res => {
      this.comptes = res; 
    });
    //console.log(this.fs.getNombyIddossier(this.selectedIdDossier))
    console.log(this.aff.nomPrenom)
  }

  initializeFields() {
    this.selectedIdDossier = ''; // Clear the selected dossier ID
    this.selectedAffaireId=0
    this.aff = {
     
    };
  }
  
  
}
