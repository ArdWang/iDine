//
//  iDineApp.swift
//  iDine
//
//  Created by RND on 2021/1/18.
//

import SwiftUI

@main
struct iDineApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            //ContentView().environmentObject(order)
            AppView().environmentObject(order)
        }
    }
}
