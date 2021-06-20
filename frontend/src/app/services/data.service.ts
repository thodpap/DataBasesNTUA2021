import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
 
import { environment } from './../../environments/environment'; 
import { Sells } from './sells.model';
import { TrackVisits } from './track-visits.model';
import { TrackVisitsResponse } from '../track-visits/track-visits-response.model';
import { CustomerListResponse } from '../list-customers/customer-list-response.model';
import { Location } from '../covid-service-list/location/location.model';
import { Person } from '../covid-traceback/person/person.model';
import { ProfileData } from '../profile/profile.model';

@Injectable({ providedIn: 'root' })
export class DataService {
    nfc_id: string; 

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
    

    // Track visits q1
    getTrackVisits(obj: TrackVisits) {
        let params = new HttpParams().set("params", obj.toString()); 
        return this.http.get<TrackVisitsResponse[]>(environment.apiUrl + '/track-visits', {params: params});
    }

    // Sells per service q2a
    getSellsPerService() {
        return this.http.get<Sells[]>(environment.apiUrl + '/sells-per-service');
    }

    // Sells per service q2b
    getListCustomers(service: string) {
        let params = new HttpParams().set("params", service); 
        return this.http.get<CustomerListResponse[]>(environment.apiUrl + '/list-customer', {params: params});
    }
    
    // Get the location of where the user went q3
    getLocations() {
        let params = new HttpParams().set("nfc_id", this.nfc_id);
        return this.http.get<Location[]>(environment.apiUrl + '/covid-service-list', {params: params});
    }

    // q4
    getPeopleCovid() {
        let params = new HttpParams().set("nfc_id", this.nfc_id);
        return this.http.get<Person[]>(environment.apiUrl + '/people-covid', {params: params});
    }

    // services per ages q5
    getSellsPerAge(age : number) {
        return this.http.get<Sells[]>(environment.apiUrl + '/sells-per-age/' + age); 
    }

    // get Users profile data
    getUserData() {
        let params = new HttpParams().set("nfc_id", this.nfc_id);
        return this.http.get<ProfileData>(environment.apiUrl + '/profile-data', {params: params});
    }
    changePassword(password:string) {
        const body = {nfc_id: this.nfc_id, password: password};
        return this.http.put<any>(environment.apiUrl + '/profile-data', body);
    }



}