import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RisqueValidateComponent } from './risque-validate.component';

describe('RisqueValidateComponent', () => {
  let component: RisqueValidateComponent;
  let fixture: ComponentFixture<RisqueValidateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RisqueValidateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RisqueValidateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
