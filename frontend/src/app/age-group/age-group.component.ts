import { Component, OnDestroy, OnInit } from '@angular/core'; 
import { ChartType, ChartOptions } from 'chart.js';
import { SingleDataSet, Label, monkeyPatchChartJsLegend, monkeyPatchChartJsTooltip } from 'ng2-charts';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { Sells } from '../services/sells.model';
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
  public pieChartLabels_20_40: Label[] = [];
  public pieChartData_20_40: SingleDataSet = [];  
  
  public pieChartLabels_41_60: Label[] = [];
  public pieChartData_41_60: SingleDataSet = [];  

  public pieChartLabels_61: Label[] = [];
  public pieChartData_61: SingleDataSet = [];  

  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  public pieChartPlugins = [];
  
  constructor(private serviceList: ServiceListService, private dataService: DataService) {
    monkeyPatchChartJsTooltip();
    monkeyPatchChartJsLegend();
  }

  ngOnInit(): void {
    this.dataService.getSellsPerAge(20).pipe(take(1)).subscribe((res: Sells[]) => {
      for (let sell of res) {
        this.pieChartLabels_20_40.push(sell.service);
        this.pieChartData_20_40.push(sell.sells);
      }
    });
    this.dataService.getSellsPerAge(41).pipe(take(1)).subscribe((res: Sells[]) => {
      for (let sell of res) {
        this.pieChartLabels_41_60.push(sell.service);
        this.pieChartData_41_60.push(sell.sells);
      }
    });
    this.dataService.getSellsPerAge(61).pipe(take(1)).subscribe((res: Sells[]) => {
      for (let sell of res) {
        this.pieChartLabels_61.push(sell.service);
        this.pieChartData_61.push(sell.sells);
      }
    }); 
  } 

}



 
