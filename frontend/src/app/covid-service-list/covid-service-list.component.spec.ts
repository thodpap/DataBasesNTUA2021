import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CovidServiceListComponent } from './covid-service-list.component';

describe('CovidServiceListComponent', () => {
  let component: CovidServiceListComponent;
  let fixture: ComponentFixture<CovidServiceListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CovidServiceListComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CovidServiceListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
