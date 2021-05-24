export class TrackVisits {
    constructor(public date: string, 
        public service: string, 
        public operator: string, 
        public cost: number) {}
    
        toString() {
        return 'date: ' + this.date + 
                ', service: ' + this.service +
                ', operator: ' + this.operator +
                ', cost: ' + this.cost;
    }
}