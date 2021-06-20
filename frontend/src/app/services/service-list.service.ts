import { Injectable } from "@angular/core";

@Injectable({ providedIn: 'root' })
export class ServiceListService {
    services = [
        ' ',  
        'gym', 
        'saouna',
        'meeting room'
    ]

    allServices = [
        ' ',  
        'gym', 
        'saouna',
        'meeting room',
        'accomondation room',
        'food-cocktail in bar',
        'food-cocktail in restaurant' ,
        'hair saloon'
    ]
}