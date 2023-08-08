import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactclientComponent } from './contactclient.component';

describe('ContactclientComponent', () => {
  let component: ContactclientComponent;
  let fixture: ComponentFixture<ContactclientComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactclientComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactclientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
