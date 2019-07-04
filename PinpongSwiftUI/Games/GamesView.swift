//
//  GamesView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GamesView : View {
    var userId: String?
    
    @State var arr = [
        Game(
            homeUser: User(name: "Саня", rating: 100, image: UIImage(named: "personOne")!, lastGames: []),
            awayUser: User(name: "СаняЯЯЯЯЯЯ", rating: 100, image: UIImage(named: "personTwo")!, lastGames: []),
            homeScore: 1,
            awayScore: 6,
            isFinished: true
        ),
        Game(
            homeUser: User(name: "Серега", rating: 100, image: UIImage(named: "personOne")!, lastGames: []),
            awayUser: User(name: "Саня", rating: 100, image: UIImage(named: "personTwo")!, lastGames: []),
            homeScore: 1,
            awayScore: 11,
            isFinished: true
        ),
        Game(
            homeUser: User(name: "Степан", rating: 100, image: UIImage(named: "personOne")!, lastGames: []),
            awayUser: User(name: "Виталий", rating: 100, image: UIImage(named: "personTwo")!, lastGames: []),
            homeScore: 11,
            awayScore: 9,
            isFinished: true
        )
    ]
    
    var body: some View {
        List {
            ForEach(arr) { game in
                HistoryRow(game: game)
            }
        }.listStyle(.grouped)
        
    }
}

