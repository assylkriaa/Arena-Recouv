import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { document } from '../models/document';
import { FileDetails } from '../models/FileDetails';

@Injectable({
  providedIn: 'root'
})
export class DocumentService {
  dossierURL : string ="http://localhost:8081/RecouvGTI/doc/";
  constructor(private myHttp : HttpClient) { }
  upload(doc: document,id:string){
    return this.myHttp.post<document>(this.dossierURL + 'upload/'+id, doc);
  }
  getall():Observable<document>{
    return this.myHttp.get<document>(this.dossierURL+"getAll/");
  }
  getallBynumDossier(id:string):Observable<document>{
    return this.myHttp.get<document>(this.dossierURL+"getAllbynumDossier/"+id);
  }

  uploadf(file: File , id:string): Observable<FileDetails> {

    const formData: FormData = new FormData();
    formData.append('file', file);
    return this.myHttp.post<FileDetails>(this.dossierURL+"up/", formData+id);
  }
  
  /*downloadImage(fileName: string): void {
    const headers = new HttpHeaders().set('Accept', 'image/png'); // Set the Accept header to specify the desired response type
  
    this.myHttp.get(this.dossierURL +'download/'+fileName, { responseType: 'arraybuffer', headers: headers })
      .subscribe(response => {
        this.saveFile(response, fileName); // Save the downloaded file
      });*/
}
