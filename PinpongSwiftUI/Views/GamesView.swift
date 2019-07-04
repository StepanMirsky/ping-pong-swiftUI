//
//  GamesView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GameHistory: Identifiable, Hashable {
    var id = UUID()
    
    var personOne: String
    var personTwo: String
    var personOneScore: String
    var personTwoScore: String
    var personOneImageUrl: String
    var personTwoImageUrl: String
    var personOneIsWinner: Bool {
        return personOneScore > personTwoScore
    }
    var personTwoIsWinner: Bool {
        return !personOneIsWinner
    }
    
}

struct HistoryRow: View {
    let game: GameHistory
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Image(game.personOneImageUrl)
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            Text("\(game.personOne)")
            Spacer()
            Text("\(game.personOneScore) : \(game.personTwoScore)")
            Spacer()
            Text("\(game.personTwo)")
            Image(game.personTwoImageUrl)
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 4)
            Spacer()
        }
    }
}

struct GamesView : View {
    @State var arr = [
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Серега",
            personTwo: "Саня",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
        ),
        GameHistory(
            personOne: "Саня",
            personTwo: "Серега",
            personOneScore: "9",
            personTwoScore: "11",
            personOneImageUrl: "personOne",
            personTwoImageUrl: "personTwo"
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
