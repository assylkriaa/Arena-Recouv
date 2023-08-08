import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { client } from '../models/client';
import { compte } from '../models/compte';
import { mission } from '../models/mission';
import { AffaireService } from '../services/affaire.service';
import { ClientService } from '../services/client.service';
import { DossierService } from '../services/dossier.service';

@Component({
  selector: 'app-mission',
  templateUrl: './mission.component.html',
  styleUrls: ['./mission.component.css']
})
export class MissionComponent implements OnInit {
  ms: mission = new mission();
  compte: compte = new compte();
  client: client = new client(); 
  oldNumAffaires: any
  comptes: any
  missions: any
  idClient: any
  nom:any
  selectedmission:any
  constructor(private http: HttpClient, private ac: ActivatedRoute, private fs: AffaireService, private ps: DossierService, private tt: ClientService, private router: Router) { }

  ngOnInit(): void {
   
    //this.fs.getAffaireIdsByIdClients(this.idClient).subscribe(res => this.oldNumAffaires = res);

    //this.ps.getComptesbyidClient(this.idClient).subscribe(res => this.comptes = res);
  }
  onIdClientSelectionChange() {
    this.ps.getComptesbyidClient(this.idClient).subscribe(res => this.comptes = res);
    this.tt.getclientbyid(this.idClient).subscribe(res => this.client = res);
    this.fs.getAffaireIdsByIdClients(this.idClient).subscribe(res => this.oldNumAffaires = res);
    this.fs.getMissionsIdsByIdClients(this.idClient).subscribe(res => this.missions = res);
    console.log(this.idClient)
  

  }
  validerMission(){

    this.ms.idClient=this.idClient
    this.ms.nomPrenom=this.client.nomPrenom
    this.fs.validerMission(this.ms).subscribe(()=>this.router.navigate(['/proceduremission/']));
    window.alert('Mission validated successfuly')
    window.location.reload();

  }
  onMissionSelectionChange(){
   
    this.fs.getMissionByIdMission(this.selectedmission).subscribe(res => this.ms = res);
    this.fs.getMissionByIdMission(this.selectedmission).subscribe(res => this.client.nomPrenom = res.nomPrenom);
  }
  resetForm(){
    this.ms = {};
  }
}
