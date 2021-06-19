import { Component, OnInit } from '@angular/core';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { Location } from './location/location.model';

@Component({
  selector: 'app-covid-service-list',
  templateUrl: './covid-service-list.component.html',
  styleUrls: ['./covid-service-list.component.css']
})
export class CovidServiceListComponent implements OnInit {
  locations: Location[] = [
    // new Location('Gym', '250434')
  ];
  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.dataService.getLocations().pipe(take(1)).subscribe( res => {
      this.locations = [];
      console.log(res);
      for (let loc of res) {
        this.locations.push(new Location(loc.service, loc.date));
      }
      this.locations = res;
    });
  }

}
