import { Pipe, PipeTransform } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { DossierService } from './services/dossier.service';

@Pipe({
  name: 'marchepipe'
})
export class MarchePipe implements PipeTransform {
  constructor(private ds: DossierService) {}

  transform(id: any): Observable<string> {
    if (!id) {
      return of(''); // Return an observable with an empty string when id is undefined or falsy
    }
     console.log(this.ds.getmarchebyid(id).pipe)
    return this.ds.getmarchebyid(id).pipe(
      map((marche: { libelle?: any }) => marche ? marche.libelle || '' : '')
    );
  }
}
