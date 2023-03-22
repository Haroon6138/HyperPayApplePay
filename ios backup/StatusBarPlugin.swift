//
//  StatusBarPlugin.swift
//  App
//
//  Created by Haroon Amjad on 20/03/2023.
//

import Foundation
import Capacitor

@objc(StatusBarPlugin)
public class StatusBarPlugin: CAPPlugin {
    
    var provider:OPPPaymentProvider = OPPPaymentProvider(mode: OPPProviderMode.test)
    
    @objc func getHeight(_ call: CAPPluginCall) {
//        var statusBarHeight: CGFloat = 0
//        if #available(iOS 13.0, *) {
//            let scenes = UIApplication.shared.connectedScenes
//            let windowScene = scenes.first as? UIWindowScene
//            let window = windowScene?.windows.first
//            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//        } else {
//            statusBarHeight = UIApplication.shared.statusBarFrame.height
//        }
//
//        if statusBarHeight > 0 {
//            call.resolve([
//                "height": statusBarHeight
//            ])
//        } else {
//            call.reject("Status bar height not obtained")
//        }
        
        self.appleMerchantId = args["appleMerchantId"] as! String
                self.countryCode = args["countryCode"] as! String
                self.currencyCode = args["currencyCode"] as! String
                self.amount = args["amount"] as! Double
                
                let paymentRequest = OPPPaymentProvider.paymentRequest(
                    withMerchantIdentifier: self.appleMerchantId,
                    countryCode: self.countryCode)
                
                paymentRequest.currencyCode = self.currencyCode
                
                paymentRequest.paymentSummaryItems = [
                    PKPaymentSummaryItem(label: "Hyperpay",
                                         amount: NSDecimalNumber(value: self.amount))
                ]
                
                if OPPPaymentProvider.canSubmitPaymentRequest(paymentRequest) {
                    if let vc = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest) as PKPaymentAuthorizationViewController? {
                        vc.delegate = self
                        UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true, completion: nil)
                    } else {
                        NSLog("Apple Pay not supported.");
                    }
                }
        
    }
}

