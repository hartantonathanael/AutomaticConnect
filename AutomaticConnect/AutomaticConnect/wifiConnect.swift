//
//  wifiItem.swift
//  AutomaticConnect
//
//  Created by Bob Squad Intern on 27/09/22.
//

import Foundation

import NetworkExtension

func wifiConnects (ssid: String, pass: String) -> Void {
    let configuration = NEHotspotConfiguration.init(ssid: ssid, passphrase: pass, isWEP: false)
    configuration.joinOnce = false
    
    
    
    NEHotspotConfigurationManager.shared.apply(configuration) { (error) in
        if error != nil {
            if error?.localizedDescription == "already associated."
            {
                print("Connected")
            }
            else{
                print("No Connection")
            }
        }
        else {
            print("Connected")
        }
    }
    
}

