import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetaildossierComponent } from './detaildossier.component';

describe('DetaildossierComponent', () => {
  let component: DetaildossierComponent;
  let fixture: ComponentFixture<DetaildossierComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetaildossierComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetaildossierComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
