export class TrackVisitsResponse {
    constructor(public service: string, 
        public firstName: string,
        public lastName: string,
        public arrivalDate: string,
        public departureDate: string) {}
}