//
//  RatingsView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct ShortGame: Hashable {
    let id = UUID()
    let isWin: Bool
}

struct User: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let rating: Int
    let image: UIImage
    let lastGames: [ShortGame]
}

struct RatingsList: View {
    var users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink(
                destination: ProfileView(user: user, isMe: false)) {
                RatingRow(user: user)
            }
        }.listStyle(.grouped)
    }
}

struct RatingsView : View {
    var users = Storage.shared.users
    
    var body: some View {
        RatingsList(users: users)
    }
}
