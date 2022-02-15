import { Component } from '@angular/core';
import { ContractService } from './contract.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  title = 'Vote Simulator';

  constructor(private service: ContractService) {}

  connect() {
    return this.service.connectAccount();
  }

  async getResults() {
    const results  = await this.service.getReferendumResults();
    console.log(results);
  }


}
