import { registerPlugin } from '@capacitor/core';

export interface HyperpayPlugin {
    startApplePay(options: { checkoutID: String, merchantID: String, countryCode: String, currencyCode: String, amount: number })
      : Promise<{ results: any[] }>;
}

const hyperPayPlugin = registerPlugin<HyperpayPlugin>('HyperpayPlugin');

export default hyperPayPlugin;