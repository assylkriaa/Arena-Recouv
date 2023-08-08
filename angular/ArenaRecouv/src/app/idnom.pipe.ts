import { Pipe, PipeTransform } from '@angular/core';
import { map, Observable, of } from 'rxjs';
import { ClientService } from './services/client.service';

@Pipe({
  name: 'idnom'
})
export class idnomPipe implements PipeTransform {
  constructor(private ds: ClientService) {}
  transform(id: any): Observable<string> {
    if (!id) {
      return of(''); // Return an observable with an empty string when id is undefined or falsy
    }
     console.log(this.ds.getNomenByIdNom(id).pipe)
    return this.ds.getNomenByIdNom(id).pipe(
      map((nomenc: { libelle?: any }) => nomenc ? nomenc.libelle || '' : '')
    );
  }

}
