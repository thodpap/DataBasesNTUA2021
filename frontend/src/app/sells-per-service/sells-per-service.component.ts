
import { Component, OnInit } from '@angular/core';
import { ChartType, ChartOptions } from 'chart.js';
import { SingleDataSet, Label, monkeyPatchChartJsLegend, monkeyPatchChartJsTooltip } from 'ng2-charts';
import { ServiceListService } from '../services/service-list.service';


@Component({
  selector: 'app-sells-per-service',
  templateUrl: './sells-per-service.component.html',
  styleUrls: ['./sells-per-service.component.css']
})
export class SellsPerServiceComponent implements OnInit {
  public pieChartOptions: ChartOptions = {
    responsive: true,
  };
  public pieChartLabels: Label[] = [];
  public pieChartData: SingleDataSet = []; //[300, 500, 100];
  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  public pieChartPlugins = [];

  constructor(private serviceList: ServiceListService ) {
    monkeyPatchChartJsTooltip();
    monkeyPatchChartJsLegend();
  }

  ngOnInit(): void {
    for (let s of this.serviceList.services){
      if (s != ' ') { 
        this.pieChartLabels.push(s);
        this.pieChartData.push(300);
      }
    }
  }

}
