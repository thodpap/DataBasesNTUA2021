import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { take } from 'rxjs/operators';
import { DataService } from '../services/data.service';
import { ProfileData } from './profile.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  profileData: ProfileData; 

  profileForm = new FormGroup({
    firstName: new FormControl(''),
    lastName: new FormControl(''),
    email: new FormControl(''),
    number: new FormControl(''),
    password: new FormControl('')
  });

  constructor(private dataService: DataService, 
    private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.profileForm = this.formBuilder.group({
      firstName: [ {value: '', disabled: true}, Validators.required],
      lastName: [ {value: '', disabled: true}, Validators.required],
      email: [ {value: '', disabled: true}, Validators.required],
      number: [{value: '', disabled: true}, Validators.required],
      password: ['', Validators.required]
    }); 
    this.dataService.getUserData().pipe(take(1)).subscribe(res => {
      this.profileData = new ProfileData(res.firstName, res.lastName, res.email, res.number);
      this.profileForm.patchValue({
        firstName: this.profileData.firstName,
        lastName: this.profileData.lastName,
        email: this.profileData.email,
        number: this.profileData.number
      }); 
    });
  }
  // convenience getter for easy access to form fields
  get f() { return this.profileForm.controls; }
  onSave() { 
    // stop here if form is invalid
    if (this.profileForm.invalid) {
        return;
    }
    this.dataService.changePassword(this.f.password.value).pipe(take(1)).subscribe(res => {});
  }

}
