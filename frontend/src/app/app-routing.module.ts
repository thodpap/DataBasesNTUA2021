import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AgeGroupComponent } from './age-group/age-group.component';
import { CovidServiceListComponent } from './covid-service-list/covid-service-list.component';
import { CovidTracebackComponent } from './covid-traceback/covid-traceback.component';
import { HomeComponent } from './home/home.component';
import { ListCustomersComponent } from './list-customers/list-customers.component';
import { LoginComponent } from './login/login.component';
import { ProfileComponent } from './profile/profile.component'; 
import { SellsPerServiceComponent } from './sells-per-service/sells-per-service.component';
import { AuthGuard } from './services/auth.guard';
import { TrackVisitsComponent } from './track-visits/track-visits.component';

const routes: Routes = [
  { path: '', pathMatch: 'full' ,component: HomeComponent},  
  { path: 'login', component: LoginComponent},   
  { path: 'profile', component: ProfileComponent},  
  { path: 'q1', component: TrackVisitsComponent, canActivate: [AuthGuard]}, 
  { path: 'q2', canActivate: [AuthGuard],  children: [
    { path: 'a', pathMatch: 'full',component: SellsPerServiceComponent } ,
    { path: 'b', component: ListCustomersComponent}
  ]
  },
  { path: 'q3', component: CovidServiceListComponent, canActivate: [AuthGuard]},
  { path: 'q4', component: CovidTracebackComponent, canActivate: [AuthGuard]},
  { path: 'q5', component: AgeGroupComponent, canActivate: [AuthGuard]}, 
  { path: '**', redirectTo: '/'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
