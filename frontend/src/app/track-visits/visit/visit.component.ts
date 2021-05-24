import { Component, Input, OnInit } from '@angular/core';
import { TrackVisitsResponse } from '../track-visits-response.model';

@Component({
  selector: 'app-visit',
  templateUrl: './visit.component.html',
  styleUrls: ['./visit.component.css']
})
export class VisitComponent implements OnInit {
  @Input() person: TrackVisitsResponse;
  constructor() { }

  ngOnInit(): void {
  }

}
