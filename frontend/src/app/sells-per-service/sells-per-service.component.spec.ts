import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SellsPerServiceComponent } from './sells-per-service.component';

describe('SellsPerServiceComponent', () => {
  let component: SellsPerServiceComponent;
  let fixture: ComponentFixture<SellsPerServiceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SellsPerServiceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SellsPerServiceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
