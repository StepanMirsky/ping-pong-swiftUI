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

struct Rating: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let value: Int
    let image: UIImage
    let lastWins: [ShortGame]
}

struct RatingsList: View {
    var ratings: [Rating]
    
    var body: some View {
        List(ratings) { rating in
            NavigationLink(
                destination: ProfileView(user:
                    User(name: rating.name, rating: rating.value, image: rating.image), isMe: false)) {
                RatingRow(rating: rating)
            }
        }.listStyle(.grouped)
    }
}

struct RatingsView : View {
    var ratings = [
        Rating(
            name: "Серега",
            value: 500,
            image: UIImage(named: "defaultImage")!,
            lastWins: [
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: false)
            ]
        ),
        Rating(
            name: "Федя",
            value: 1000,
            image: UIImage(named: "personOne")!,
            lastWins: [
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: false),
                ShortGame(isWin: true),
                ShortGame(isWin: true)
            ]
        ),
        Rating(
            name: "Антон",
            value: 1500,
            image: UIImage(named: "defaultImage")!,
            lastWins: [
                ShortGame(isWin: true),
                ShortGame(isWin: true),
                ShortGame(isWin: false),
                ShortGame(isWin: true)
            ]
        ),
        Rating(
            name: "Вика",
            value: 800,
            image: UIImage(named: "personTwo")!,
            lastWins: [
                ShortGame(isWin: true),
                ShortGame(isWin: false)            ]
        ),
        Rating(
            name: "Гриша",
            value: 450,
            image: UIImage(named: "defaultImage")!,
            lastWins: []
        )
    ]
    
    var body: some View {
        RatingsList(ratings: ratings)
    }
}
