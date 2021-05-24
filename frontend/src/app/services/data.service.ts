import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
 
import { environment } from './../../environments/environment'; 
import { Sells } from './sells.model';
import { TrackVisits } from './track-visits.model';
import { TrackVisitsResponse } from '../track-visits/track-visits-response.model';
import { CustomerListResponse } from '../list-customers/customer-list-response.model';

@Injectable({ providedIn: 'root' })
export class DataService {
    constructor(private http: HttpClient) { }

    // getAll() {
    //     return this.http.get<User[]>(`${environment.apiUrl}/users`);
    // }

    // register(user: User) {
    //     return this.http.post(`${environment.apiUrl}/users/register`, user);
    // }

    // delete(id: number) {
    //     return this.http.delete(`${environment.apiUrl}/users/${id}`);
    // }

    getTrackVisits(obj: TrackVisits) {
        let params = new HttpParams();
        params.append('parameters', obj.toString());
        return this.http.get< Array<TrackVisitsResponse> >(`${environment.apiUrl}/track-visits`, {params: params});
    }

    getSellsPerService() {
        return this.http.get<Sells>(`${environment.apiUrl}/sells-per-service`);
    }

    getListCustomers(service: string) {
        let params = new HttpParams();
        params.append('service-name', service);
        return this.http.get< Array<CustomerListResponse> >(`${environment.apiUrl}/list-customer`, {params: params});
    }


}