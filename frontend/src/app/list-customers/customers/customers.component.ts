import { Component, Input, OnInit } from '@angular/core';
import { CustomerListResponse } from '../customer-list-response.model';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.css']
})
export class CustomersComponent implements OnInit {
  @Input() customer: CustomerListResponse;
  
  constructor() { }

  ngOnInit(): void {
  }

}
