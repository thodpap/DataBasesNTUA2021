import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CovidTracebackComponent } from './covid-traceback.component';

describe('CovidTracebackComponent', () => {
  let component: CovidTracebackComponent;
  let fixture: ComponentFixture<CovidTracebackComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CovidTracebackComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CovidTracebackComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
