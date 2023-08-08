import { TestBed } from '@angular/core/testing';

import { CompterenduService } from './compterendu.service';

describe('CompterenduService', () => {
  let service: CompterenduService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CompterenduService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
