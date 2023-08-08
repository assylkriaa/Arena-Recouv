import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { InputTextModule } from 'primeng/inputtext';

import { ButtonModule } from 'primeng/button';
import { PasswordModule } from 'primeng/password';
import { HomeComponent } from './components/home/home.component';
import { FooterComponent } from './components/footer/footer.component';
import { LoginComponent } from './components/login/login.component';
import { HeaderComponent } from './components/header/header.component';
import { ConsultationgeneraleComponent } from './consultationgenerale/consultationgenerale.component';

import { MarchePipe } from './marche.pipe';
import { DetaildossierComponent } from './detaildossier/detaildossier.component';

import { DividerModule } from 'primeng/divider';
import { ContactclientComponent } from './contactclient/contactclient.component';
import { FileUploadModule } from 'primeng/fileupload';
import { ProcedurejudicComponent } from './procedurejudic/procedurejudic.component';
import { MissionComponent } from './mission/mission.component';
import { RisqueComponent } from './risque/risque.component';
import { RisqueValidateComponent } from './risque-validate/risque-validate.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { ActionComponent } from './action/action.component';
import { TableModule } from 'primeng/table';
import { idnomPipe } from './idnom.pipe';
import { AgentComponent } from './agent/agent.component';
import { MultiSelectModule } from 'primeng/multiselect';
import { FieldsetModule } from 'primeng/fieldset';
import {DropdownModule} from 'primeng/dropdown';
import { CalendarModule } from 'primeng/calendar';
import { ToolbarModule } from 'primeng/toolbar';

@NgModule({
    declarations: [
        AppComponent,
        LoginComponent,
        HomeComponent,
        FooterComponent,
        HeaderComponent,
        ConsultationgeneraleComponent,
        MarchePipe,
        DetaildossierComponent,
        ContactclientComponent,
        ProcedurejudicComponent,
        MissionComponent,
        RisqueComponent,
        RisqueValidateComponent,
        ActionComponent,
        idnomPipe,
        AgentComponent
        
        
        
    ],
    providers: [],
    bootstrap: [AppComponent],
    imports: [
        BrowserModule,
        AppRoutingModule,
        FormsModule,
        ReactiveFormsModule,
        HttpClientModule,
        InputTextModule,
        ButtonModule,
        PasswordModule,
        DividerModule,
        FileUploadModule,
        BrowserAnimationsModule,
        MatDialogModule,
        MultiSelectModule,
        FieldsetModule,
        DropdownModule,
        TableModule,
        CalendarModule,
        ToolbarModule

        
        
        
        
    ],
    exports: [
        MarchePipe
      ]
})
export class AppModule { }
