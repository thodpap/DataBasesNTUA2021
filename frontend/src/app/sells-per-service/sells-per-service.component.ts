
import { Component, OnInit } from '@angular/core';
import { ChartType, ChartOptions } from 'chart.js';
import { SingleDataSet, Label, monkeyPatchChartJsLegend, monkeyPatchChartJsTooltip } from 'ng2-charts';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { Sells } from '../services/sells.model';
import { ServiceListService } from '../services/service-list.service';
import { TrackVisitsResponse } from '../track-visits/track-visits-response.model';


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

  constructor(private serviceList: ServiceListService, private dataService: DataService) {
    monkeyPatchChartJsTooltip();
    monkeyPatchChartJsLegend();
  }

  ngOnInit(): void {
    this.dataService.getSellsPerService().pipe(take(1)).subscribe((res: Sells[]) => {
      for (let sell of res) { 
        this.pieChartLabels.push(sell.service); 
        this.pieChartData.push(+sell.sells);
      }  
    }); 
  }

}
