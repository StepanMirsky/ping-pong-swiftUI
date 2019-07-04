//
//  GamesScoreView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GamesScoreView: View {
    let game: Game
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 20) {
                HStack {
                    Spacer()
                    Text("\(game.homeScore)")
                        .font(.largeTitle)
                        .color(game.homeScoreColor)
                        .bold()
                }
                
                HStack {
                    Text("\(game.awayScore)")
                        .font(.largeTitle)
                        .color(game.awayScoreColor)
                        .bold()
                    Spacer()
                }
            }
            Text(":")
                .font(.largeTitle)
                .bold()
        }
    }
}

private extension Game {
    var homeScoreColor: Color {
        return homeIsWinner ? .green : .red
    }
    
    var awayScoreColor: Color {
        return awayIsWinner ? .green : .red
    }
}
