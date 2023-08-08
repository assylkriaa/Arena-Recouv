import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcedurejudicComponent } from './procedurejudic.component';

describe('ProcedurejudicComponent', () => {
  let component: ProcedurejudicComponent;
  let fixture: ComponentFixture<ProcedurejudicComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProcedurejudicComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcedurejudicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
