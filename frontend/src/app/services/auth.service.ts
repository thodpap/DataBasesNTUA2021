import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";
import { environment } from './../../environments/environment';
import { User } from "./user.model";
import { HttpClient, HttpParams } from "@angular/common/http"; 
import { DataService } from "./data.service";

@Injectable({ providedIn: 'root' })
export class AuthService {
    public currentUserSubject: BehaviorSubject<User>;
    public currentUser: Observable<User>;

    constructor(private http: HttpClient, private dataService: DataService) {
        this.currentUserSubject = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('currentUser')));
        this.currentUser = this.currentUserSubject.asObservable();
    }

    public get currentUserValue(): User {
        return this.currentUserSubject.value;
    }

    login(username: string, password: string) { 
        let params = new HttpParams().set("username", username).set("password", password);
        return this.http.get<User>(environment.apiUrl + '/users/authenticate', {params: params});
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
        this.currentUserSubject.next(null);
    }
}