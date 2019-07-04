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
    var users = [
        User(
            name: "Серега",
            rating: 500,
            image: UIImage(named: "defaultImage")!,
            lastGames: [
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: false)
            ]
        ),
        User(
            name: "Федя",
            rating: 1000,
            image: UIImage(named: "personOne")!,
            lastGames: [
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: false),
                ShortGame(isWin: true),
                ShortGame(isWin: true)
            ]
        ),
        User(
            name: "Антон",
            rating: 1500,
            image: UIImage(named: "defaultImage")!,
            lastGames: [
                ShortGame(isWin: true),
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: true)
            ]
        ),
        User(
            name: "Вика",
            rating: 800,
            image: UIImage(named: "personTwo")!,
            lastGames: [
                ShortGame(isWin: true),
                ShortGame(isWin: false)            ]
        ),
        User(
            name: "Гриша",
            rating: 450,
            image: UIImage(named: "defaultImage")!,
            lastGames: []
        )
    ]
    
    var body: some View {
        RatingsList(users: users)
    }
}
