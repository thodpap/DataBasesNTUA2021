import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TrackVisitsComponent } from './track-visits.component';

describe('TrackVisitsComponent', () => {
  let component: TrackVisitsComponent;
  let fixture: ComponentFixture<TrackVisitsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TrackVisitsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TrackVisitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
