import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ClientService } from '../services/client.service';
import { UserServiceService } from '../services/user-service.service';
import * as Papa from 'papaparse';


@Component({
  selector: 'app-action',
  templateUrl: './action.component.html',
  styleUrls: ['./action.component.css']
})
export class ActionComponent implements OnInit {

  actionlist:any
  nomencList:any
  mappedlist:any
  
  nom:any
  result:any
  btnText:  String = "Export CSV";
  constructor(private http: HttpClient, private ac: ActivatedRoute, private tt: ClientService, private router: Router , private us: UserServiceService) { }

  ngOnInit(): void {
    this.tt.getActions().subscribe(res=>this.actionlist=res);
    this.tt.getAllNomen().subscribe(res=>this.nomencList=res);
   
  }
  downloadCSV(){
    this.tt.downloadCSV().subscribe(res=>this.result=res);

   

  }

  exportToCsv(): void {
    /*this.mappedlist = this.actionlist.map((action: { idNom: number; }) => {
      const correspondingNomenc = this.nomencList.find((nomenc: { idNom: number; }) => nomenc.idNom === action.idNom);
      return {  libelle: correspondingNomenc ? correspondingNomenc.libelle : '' };
    });*/

      this.mappedlist = this.actionlist.map((action: { idNom: number; }) => {
        const correspondingNomenc = this.nomencList.find((nomenc: { idNom: number; } )=> nomenc.idNom === action.idNom);
        const libelle = correspondingNomenc ? correspondingNomenc.libelle : '';
        return { ...action, libelle };
      });
    
    
    
    const csv = Papa.unparse(this.mappedlist);
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'table.csv';
    a.click();
    window.URL.revokeObjectURL(url);
    a.remove();
  }


}
