import { Component, OnDestroy, OnInit } from '@angular/core'; 
import { ChartType, ChartOptions } from 'chart.js';
import { DataService } from '../services/data.service'; 
import { ServiceListService } from '../services/service-list.service'; 

@Component({
  selector: 'app-age-group',
  templateUrl: './age-group.component.html',
  styleUrls: ['./age-group.component.css']
})
export class AgeGroupComponent implements OnInit {
  public pieChartOptions: ChartOptions = {
    responsive: true,
  };
  age = 0;
  type = 0;    
  constructor(private serviceList: ServiceListService, private dataService: DataService) {
    
  }

  ngOnInit(): void {
     
  } 
  onChange(a) {
    switch(a) {
      case "0":
        return ;
        case "1":
          this.age = 20;
          break;
        case "2":
          this.age = 41;
          break;
        case "3":
          this.age = 61;
          break;
      default:
        break;
    }
    this.dataService.subjectAge.next(this.age);
    console.log(a);
  } 
  onChange2(a) {
    console.log(a);
    switch(a) {
      case "0":
        return ;
        case "1":
          this.type = 0;
          break;
        case "2":
          this.type = 1;
          break;
        case "3":
          this.type = 2;
          break;
      default:
        break; 
    }
    this.dataService.subjectType.next(this.type);
  }

}



 
