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
import { RegisterComponent } from './register/register.component';
import { fakeBackendProvider } from './services/fake-backend';

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
    RegisterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    fakeBackendProvider
  ],
  bootstrap: [AppComponent],
  exports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class AppModule { }
