import hyperPayPlugin, { HyperpayPlugin } from './../myPlugin/StatusBar';
import { Component } from '@angular/core';
import { Platform } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  statusBarHeight = '00px';

  merchantID: String = "merchant.com.hmgwebservices.uat";
  countryCode: String = "SA";
  currencyCode: String = "SAR";
  amount: number = 110.0;
  checkoutID: String = "EC1D7EB1B3EA1E5EEFE3B30DE46834D6.uat01-vm-tx03";

  constructor(private platform: Platform) { }

  async getStatusBarHeight() {
    try {
      let paymentstatus: any = await hyperPayPlugin.startApplePay({ checkoutID: this.checkoutID, merchantID: this.merchantID, countryCode: this.countryCode, currencyCode: this.currencyCode, amount: this.amount });
      console.log("PAYMENT STATUS");
      console.log(paymentstatus.resourcePath);
    } catch (error) {
      console.log(error);
    }
  }
}