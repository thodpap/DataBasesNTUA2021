import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { ChartOptions, ChartType } from 'chart.js';
import { Label, monkeyPatchChartJsLegend, monkeyPatchChartJsTooltip, SingleDataSet } from 'ng2-charts';
import { Subscription } from 'rxjs';
import { take } from 'rxjs/operators';
import { DataService } from 'src/app/services/data.service';
import { Sells } from 'src/app/services/sells.model';

@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.css']
})
export class GraphComponent implements OnInit, OnDestroy { 
  age = 0;
  type = -1;

  public pieChartOptions: ChartOptions = {
    responsive: true,
  };

  public pieChartLabels: Label[] = [];
  public pieChartData: SingleDataSet = [];

  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  public pieChartPlugins = [];

  sub1: Subscription;
  sub2: Subscription;

  constructor(private dataService: DataService) { 
    monkeyPatchChartJsTooltip();
    monkeyPatchChartJsLegend();
  }

  ngOnInit(): void { 
    this.sub1 = this.dataService.subjectAge.subscribe(res => {
      console.log("age: ", res);
      this.age = res;
      this.update();
    });
    this.sub2 = this.dataService.subjectType.subscribe(res => {
      console.log("type: ", res);
      this.type = res;
      this.update();
    });
  }
  ngOnDestroy() {
    this.sub1.unsubscribe();
    this.sub2.unsubscribe();
  }
  update() { 
    console.log('update: ', this.age, this.type);
    if (this.age == 0)  return;

    this.pieChartLabels = [];
    this.pieChartData = [];

    if (this.type == 0) {
      this.dataService.getSellsPerAge(this.age).pipe(take(1)).subscribe((res: Sells[]) => {
        for (let sell of res) {
          this.pieChartLabels.push(sell.service);
          this.pieChartData.push(+sell.sells);
        }
      });
    }
    else if (this.type == 1) {
      this.dataService.getSellsPerAgePerService(this.age).pipe(take(1)).subscribe((res: Sells[]) => {
        for (let sell of res) {
          this.pieChartLabels.push(sell.service);
          this.pieChartData.push(+sell.sells);
        }
      });
    } else if (this.type == 2) {
      this.dataService.getPopularServices(this.age).pipe(take(1)).subscribe((res: Sells[]) => {
        for (let sell of res) {
          this.pieChartLabels.push(sell.service);
          this.pieChartData.push(+sell.sells);
        }
      });
    }
  } 
} 
