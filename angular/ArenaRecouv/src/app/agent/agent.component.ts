import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { agent } from '../models/agent';
import { AgentService } from '../services/agent.service';

@Component({
  selector: 'app-agent',
  templateUrl: './agent.component.html',
  styleUrls: ['./agent.component.css']
})
export class AgentComponent implements OnInit {
  agent: agent = {};
  selectedCities: any[] = [];
  selectedRegions: any[] = [];
  selectedAgences: any[] = [];
  selectedMarches: any[] = [];

  chaine?:string

  aaa: any

  query: any;

  iii: any

  agenteyy: any

  cities = [
    { name: 'Segment 1', value: '1' },
    { name: 'Segment 2', value: '2' },
  ];

  regions = [
    { name: 'Region 1', value: '1' },
    { name: 'Region 2', value: '2' },
    // Add more regions as needed
  ];

  agences = [
    { name: 'Agence 1', value: '1' },
    { name: 'Agence 2', value: '2' },
    // Add more agences as needed
  ];

  marches = [
    { name: 'Marché 1', value: '1' },
    { name: 'Marché 2', value: '2' },
    // Add more marches as needed
  ];
  constructor(private http: HttpClient, private ac: ActivatedRoute, private tt: AgentService, private router: Router) { }

  ngOnInit(): void {
    this.tt.getAllAgents().subscribe(res => this.agenteyy = res)
    this.onIdAgentChange()
  }
  validerAgent() {
    // Build the query based on the selected values
    const query = `(t.agent in (select agent from agent where 1=1 and region in(${this.getSelectedValues(this.selectedRegions)}) and agence in(${this.getSelectedValues(this.selectedAgences)}) and marche in(${this.getSelectedValues(this.selectedMarches)}) and segment in(${this.getSelectedValues(this.selectedCities)})))`;

    // Set the query value in the agent object
    this.agent.query = query;
    console.log(query)
    console.log(this.agent.query)
    console.log(this.agent)
    this.tt.validerAgent(this.agent).subscribe(() => this.router.navigate(['/agent/']));
    prompt("Agent Modifier Avec success")
    window.location.reload();
  }
  getSelectedValues(selectedItems: any[]): string {
    return selectedItems.map(item => `'${item.value}'`).join(',');
  }

  onIdAgentChange() {
    this.tt.getAgentIdAgent(this.iii).subscribe(res => {
      this.agent = res;
      console.log(this.agent.query);
      
      const regionRegex = /region\s+in\((.*?)\)/;

      const agenceRegex = /agence\s+in\((.*?)\)/;

      const marcheRegex = /marche\s+in\((.*?)\)/;

      const segmentRegex = /segment\s+in\((.*?)\)/;


      /*const chaine = "(t.cli in (select cli from Client where 1=1 and region in('1','2') and zone in('2') and
       agence in('1','3') and marche in('1','2','3') and segment in('1','2') and activite in('2253'))) and palier =2249";*/

      const regionMatches = this.agent.query?.match(regionRegex);
    
      const agenceMatches = this.agent.query?.match(agenceRegex);

      const marcheMatches = this.agent.query?.match(marcheRegex);

      const segmentMatches = this.agent.query?.match(segmentRegex);

     

      const agence = agenceMatches ? agenceMatches[1].split(',') : [];

      const marche = marcheMatches ? marcheMatches[1].split(',') : [];

      const segment = segmentMatches ? segmentMatches[1].split(',') : [];
      const region = regionMatches ? regionMatches[1].split(',') : [];

      console.log(region)
      console.log(agence)
      console.log(marche)
      console.log(segment)



      this.selectedCities = segment.map(value => ({ name: `Segment ${value.slice(1, -1)}`, value: value.slice(1, -1) }));
this.selectedRegions = region.map(value => ({ name: `Region ${value.slice(1, -1)}`, value: value.slice(1, -1) }));
this.selectedAgences = agence.map(value => ({ name: `Agence ${value.slice(1, -1)}`, value: value.slice(1, -1) }));
this.selectedMarches = marche.map(value => ({ name: `Marché ${value.slice(1, -1)}`, value: value.slice(1, -1) }));

    });
  }


}









