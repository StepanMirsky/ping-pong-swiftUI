//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
    
    var body: some View {
        TabbedView(selection: $selection) {
            RatingsView().tabItem {
                VStack {
                    Image("ratings")
                    Text("Raings")
                }
            }.tag(0)
            GamesView().tabItem {
                VStack {
                    Image("games")
                    Text("Games")
                }
            }.tag(1)
            ProfileView().tabItem {
                VStack {
                    Image("profile")
                    Text("Profile")
                }
            }.tag(2)
        }
    }
}
