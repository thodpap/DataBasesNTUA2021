import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  isLoggedin = false;
  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {
    this.authService.currentUser.subscribe(x => {
      if (x == null) {
        this.isLoggedin = false;
      } else {
        this.isLoggedin = true;
      }
    })
  }

  logout() {
    this.router.navigate(['/']);
    this.authService.logout();
  }
  profile() {
    this.router.navigate(['/profile']);
  }
}
