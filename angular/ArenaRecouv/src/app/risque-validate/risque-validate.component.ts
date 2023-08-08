import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { risque } from '../models/risque';
import { DossierService } from '../services/dossier.service';
import { RisqueService } from '../services/risque.service';

@Component({
  selector: 'app-risque-validate',
  templateUrl: './risque-validate.component.html',
  styleUrls: ['./risque-validate.component.css']
})
export class RisqueValidateComponent implements OnInit {
  listRisques:any
  listagences : any
  idR:any
  dossiers:any
  r:risque = new risque();
  constructor(private http: HttpClient ,private ac:ActivatedRoute , private router:Router , private rs:RisqueService , private ps:DossierService) { }

  ngOnInit(): void {
    this.rs.getallRisques().subscribe(res=>this.listRisques=res);
    this.rs.getallDossierIDS().subscribe(res=>this.dossiers=res);

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

  valider(){
   

    this.rs.validerRisque(this.r).subscribe();
    window.alert('Risque validated successfuly')
    window.location.reload();

  }
  
  getAgencelibelle(idm: number): string {
    const agence = this.listagences.find((r: any) => r.id === idm);
    return agence ? agence.libelle : '';
  }
}
