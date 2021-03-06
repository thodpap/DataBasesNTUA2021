import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { ServiceListService } from '../services/service-list.service';
import { TrackVisits } from '../services/track-visits.model';
import { TrackVisitsResponse } from './track-visits-response.model';

@Component({
  selector: 'app-track-visits',
  templateUrl: './track-visits.component.html',
  styleUrls: ['./track-visits.component.css']
})
export class TrackVisitsComponent implements OnInit {
  services_list = [];
  trackVisitsForm: FormGroup;
  results: Array<TrackVisitsResponse> = [];

  constructor(private serviceList: ServiceListService,
      private formBuilder: FormBuilder,
      private dataService :DataService) { }

  ngOnInit(): void {
    this.services_list = this.serviceList.allServices;
    this.trackVisitsForm = this.formBuilder.group({ 
      date: [null],
      service: [null],
      sign: [null], 
      cost: [null]
    });
  } 
  onSubmit() {
    if (this.trackVisitsForm.invalid) {
      alert('Invalid Cost');
      return;
    }
    let service = null;
    let sign = null; 

    if (+this.trackVisitsForm.value.service > 0) {
      service = this.serviceList.services[+this.trackVisitsForm.value.service];
    }
    switch(this.trackVisitsForm.value.sign) {
      case "0":
        sign = "null"
        break;
      case "1":
        sign = '>';
        break;
      case "2":
        sign = '<';
        break;
      case "3":
        sign = '=';
        break;
      case "4":
        sign = '>=';
      case "5":
        sign = '<='; 
      default:
        break;
    } 
    const argument = new TrackVisits(
      this.trackVisitsForm.value.date,
      service,
      sign,
      this.trackVisitsForm.value.cost
    );
 
    this.dataService.getTrackVisits(argument).pipe(take(1)).subscribe((res: TrackVisitsResponse[]) => { 
      this.results = res; 
    });
  }
}
