import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';  
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { first, take } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';
import { User } from '../services/user.model';
import { DataService } from '../services/data.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  loading = false;
  submitted = false;
  returnUrl: string;

  constructor(
    private authenticationService: AuthService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private dataService: DataService
  ) { }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    }); 

    // get return url from route parameters or default to '/'
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  } 

  // convenience getter for easy access to form fields
  get f() { return this.loginForm.controls; }
  
  onSubmit() {
    this.submitted = true; 
    console.log(this.loginForm);
    // stop here if form is invalid
    if (this.loginForm.invalid) {
        return;
    }
    console.log("here");
 
    this.authenticationService.login(this.f.username.value, this.f.password.value)
      .pipe(take(1))
      .subscribe(
          user  => { 
            this.authenticationService.currentUserSubject.next(user);
            localStorage.setItem('currentUser', JSON.stringify(user));
            this.dataService.nfc_id = user.nfc_id;
            this.router.navigate([this.returnUrl]);
          },
          error => {  
              alert('Wrong Credentials');
          }
        );
      // console.log(this.f.username.value, this.f.password.value);
  }
}
