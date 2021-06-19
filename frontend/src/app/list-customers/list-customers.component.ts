import { Component, OnInit } from '@angular/core';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { ServiceListService } from '../services/service-list.service';
import { CustomerListResponse } from './customer-list-response.model';

@Component({
  selector: 'app-list-customers',
  templateUrl: './list-customers.component.html',
  styleUrls: ['./list-customers.component.css']
})
export class ListCustomersComponent implements OnInit {
  services = [];
  people: Array<CustomerListResponse> = [
    // new CustomerListResponse('Thodoris', 'Paparrigopoulos', '20'),
    // new CustomerListResponse('Orfeas', 'Filippopoulos', '20'), 
  ];

  constructor(private serviceList: ServiceListService,
    private dataService: DataService) { }

  ngOnInit(): void {
    this.services = this.serviceList.services;
  }
  onChange(value: string) {
    if (value == ' '){
      return ;
    } 
    this.dataService.getListCustomers(value).pipe(take(1)).subscribe(
      (res) => {
        console.log(res);
        this.people = res;
      }
    );
    console.log(value);
  }
}
