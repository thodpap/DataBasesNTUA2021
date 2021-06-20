import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { HeaderComponent } from './header/header.component';
import { TrackVisitsComponent } from './track-visits/track-visits.component';
import { SellsPerServiceComponent } from './sells-per-service/sells-per-service.component';
import { LoginComponent } from './login/login.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from "@angular/common/http";
import { ListCustomersComponent } from './list-customers/list-customers.component';
import { CovidTracebackComponent } from './covid-traceback/covid-traceback.component';
import { CovidServiceListComponent } from './covid-service-list/covid-service-list.component';
import { AgeGroupComponent } from './age-group/age-group.component';
import { ErrorInterceptor } from './services/error.interceptor';
import { JwtInterceptor } from './services/jwt.interceptor';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import { CommonModule } from '@angular/common';  
import { ProfileComponent } from './profile/profile.component';
import { VisitComponent } from './track-visits/visit/visit.component';
import { CustomersComponent } from './list-customers/customers/customers.component';
import { ChartsModule } from 'ng2-charts';
import { LocationComponent } from './covid-service-list/location/location.component';
import { PersonComponent } from './covid-traceback/person/person.component';
import { GraphComponent } from './age-group/graph/graph.component';
 

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    HeaderComponent,
    TrackVisitsComponent,
    SellsPerServiceComponent,
    LoginComponent,
    ListCustomersComponent,
    CovidTracebackComponent,
    CovidServiceListComponent,
    AgeGroupComponent, 
    ProfileComponent,
    VisitComponent,
    CustomersComponent,
    LocationComponent,
    PersonComponent,
    GraphComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,  
    ChartsModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true }, 
  ],
  bootstrap: [AppComponent],
  exports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class AppModule { }
