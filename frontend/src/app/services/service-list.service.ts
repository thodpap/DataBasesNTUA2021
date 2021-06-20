import { Injectable } from "@angular/core";

@Injectable({ providedIn: 'root' })
export class ServiceListService {
    services = [
        ' ',  
        'Gym', 
        'Saouna',
        'Meeting Room'
    ]

    allServices = [
        ' ',  
        'Gym', 
        'Saouna',
        'Meeting Room',
        'Accomondation room',
        'Food-cocktail in bar',
        'Food-cocktail in Restaurant' ,
        'Hair Saloon'
    ]
}