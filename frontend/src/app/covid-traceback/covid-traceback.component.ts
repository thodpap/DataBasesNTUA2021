import { Component, OnInit } from '@angular/core';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { Person } from './person/person.model';

@Component({
  selector: 'app-covid-traceback',
  templateUrl: './covid-traceback.component.html',
  styleUrls: ['./covid-traceback.component.css']
})
export class CovidTracebackComponent implements OnInit {
  people: Person[] = [];
  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.dataService.getPeopleCovid().pipe(take(1)).subscribe(res => { 
      this.people = res;
    })
  }

}
