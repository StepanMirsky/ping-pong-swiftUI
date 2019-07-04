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
            NavigationView {
                RatingsView()
            }.tabItem {
                VStack {
                    Image("ratings")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                    Text("Raings")
                }
            }.tag(0)

            NavigationView {
                GamesView()
            }.tabItem {
                VStack {
                    Image("games")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                    Text("Games")
                }
            }.tag(1)
            
            NavigationView {
                ProfileView()
            }.tabItem {
                VStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                    Text("Profile")
                }
            }.tag(2)
        }
    }
}
