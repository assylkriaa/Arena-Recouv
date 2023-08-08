import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultationgeneraleComponent } from './consultationgenerale.component';

describe('ConsultationgeneraleComponent', () => {
  let component: ConsultationgeneraleComponent;
  let fixture: ComponentFixture<ConsultationgeneraleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConsultationgeneraleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ConsultationgeneraleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
