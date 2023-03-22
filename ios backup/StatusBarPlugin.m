//
//  StatusBarPlugin.m
//  App
//
//  Created by Haroon Amjad on 20/03/2023.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(StatusBarPlugin, "MyStatusBar",
           CAP_PLUGIN_METHOD(getHeight, CAPPluginReturnPromise);
)
