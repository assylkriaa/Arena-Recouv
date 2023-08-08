import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { agent } from '../models/agent';

@Injectable({
  providedIn: 'root'
})
export class AgentService {
 
  agentURL : string ="http://localhost:8081/RecouvGTI/agent/";
  constructor(private myHttp : HttpClient) { }
  validerAgent(agent: agent): Observable<agent> {
    return this.myHttp.post<agent>(this.agentURL + 'addAgent/', agent);
  }
  getAgentIdAgent(id: number): Observable<agent>{
    return this.myHttp.get<agent>(this.agentURL + "getAgentById/" + id);
  }
  getAllAgents(): Observable<agent>{
    return this.myHttp.get<agent>(this.agentURL + "getAllAgents/");
  }
}
