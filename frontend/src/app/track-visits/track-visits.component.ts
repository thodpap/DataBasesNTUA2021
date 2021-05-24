import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ServiceListService } from '../services/service-list.service';

@Component({
  selector: 'app-track-visits',
  templateUrl: './track-visits.component.html',
  styleUrls: ['./track-visits.component.css']
})
export class TrackVisitsComponent implements OnInit {
  services_list = [];
  trackVisitsForm: FormGroup;
  
  constructor(private serviceList: ServiceListService,
      private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.services_list = this.serviceList.services;
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

    console.log(this.trackVisitsForm.value); 
  }
}
