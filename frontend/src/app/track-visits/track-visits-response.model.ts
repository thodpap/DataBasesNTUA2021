export class TrackVisitsResponse {
    constructor(public service: string,
        public cost: string,
        public date: string,
        public firstName: string,
        public lastName: string,
        public age: string) {}
}