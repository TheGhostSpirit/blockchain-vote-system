import { Injectable } from '@angular/core';
import Web3 from 'web3';
import Web3Modal from 'web3modal';
import WalletConnectProvider from '@walletconnect/web3-provider';
import { Subject } from 'rxjs';

import * as VoteFactory from '../contracts/VoteFactory.json';

@Injectable({
  providedIn: 'root'
})
export class ContractService {
  private web3js: any;
  private provider: any;
  private accounts: any[] = [];
  contract: any;
  web3Modal: Web3Modal;

  private accountStatusSource = new Subject<any>();
  accountStatus$ = this.accountStatusSource.asObservable();
  private newOrganization = new Subject<any>();
  newOrganization$ = this.newOrganization.asObservable();

  constructor() {
    console.log(VoteFactory);
    const providerOptions = {
      walletconnect: {
        package: WalletConnectProvider,
        options: {
          infuraId: '9c62614895c8482c924edd7726a1eaae'
        }
      }
    };

    this.web3Modal = new Web3Modal({
      network: 'rinkeby',
      cacheProvider: true,
      providerOptions,
      theme: {
        background: 'rgb(39, 49, 56)',
        main: 'rgb(199, 199, 199)',
        secondary: 'rgb(136, 136, 136)',
        border: 'rgba(195, 195, 195, 0.14)',
        hover: 'rgb(16, 26, 32)'
      }
    });
  }

  async connectAccount() {
    this.web3Modal.clearCachedProvider();

    this.provider = await this.web3Modal.connect();
    this.web3js = new Web3(this.provider);
    this.accounts = await this.web3js.eth.getAccounts();
    this.accountStatusSource.next(this.accounts);
  }

  async getReferendumResults() {
    this.provider = await this.web3Modal.connect();
    this.web3js = new Web3(this.provider);

    this.contract = new this.web3js.eth.Contract(VoteFactory.abi, '0x91B7989AD406547cAd9fB38d128302261d685416');

    const results = await this.contract
      .methods.getReferendumResults()
      .send({ from: '0x79ab4356fc5Adb7029e8ec35F0DDEE3463dD17bE' });
    return results;
  }

}
