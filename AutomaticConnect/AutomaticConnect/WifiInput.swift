//
//  WifiInput.swift
//  AutomaticConnect
//
//  Created by Bob Squad Intern on 22/09/22.
//

import SwiftUI
import NetworkExtension
import Foundation

struct WifiInput: View {
    @State private var wifiIDssid: String = ""
    @State private var wifiIDpass: String = ""
    
    

    
    var body: some View {
        List{
            HStack{
                Text("Wifi Name").bold()
                Divider()
                TextField("Name", text: $wifiIDssid)
            }
            HStack{
                Text("Password").bold()
                Divider()
                TextField("Password", text: $wifiIDpass)

            }
            Button("Connect"){
                wifiConnects(ssid: wifiIDssid, pass: wifiIDpass)
            }
        
        }
    }

}


struct WifiInput_Previews: PreviewProvider {
    static var previews: some View {
        WifiInput()
    }
}
