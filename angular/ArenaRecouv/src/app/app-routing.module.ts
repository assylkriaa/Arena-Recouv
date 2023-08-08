import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule, Routes } from '@angular/router';
import { ActionComponent } from './action/action.component';
import { AgentComponent } from './agent/agent.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { ConsultationgeneraleComponent } from './consultationgenerale/consultationgenerale.component';
import { ContactclientComponent } from './contactclient/contactclient.component';
import { DetaildossierComponent } from './detaildossier/detaildossier.component';
import { MissionComponent } from './mission/mission.component';
import { ProcedurejudicComponent } from './procedurejudic/procedurejudic.component';
import { RisqueValidateComponent } from './risque-validate/risque-validate.component';
import { RisqueComponent } from './risque/risque.component';


const routes: Routes = [
  {path:"login", component:LoginComponent},
  {path:"consultationGenerale", component:ConsultationgeneraleComponent},
  {path:"procedurejudic", component:ProcedurejudicComponent},
  {path:"proceduremission", component:MissionComponent},
  {path:"action", component:ActionComponent},
  {path:"agent", component:AgentComponent},
  {path:"risque", component:RisqueComponent},
  {path:"risquevalidate", component:RisqueValidateComponent},
  {path:"dossierDetail/:id",component:DetaildossierComponent},
  {path:"contactClient/:id",component:ContactclientComponent},
   {path:"", redirectTo:"/login", pathMatch:"full"}, 
   {path:"home", component:HomeComponent},

   {path:"**", redirectTo:"/login", pathMatch:"full"}



,
];

@NgModule({
  imports: [CommonModule,
    BrowserModule,RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
