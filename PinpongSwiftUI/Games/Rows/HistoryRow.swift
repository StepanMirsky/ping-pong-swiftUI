//
//  HistoryRow.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct HistoryRow: View {
    let game: Game
    var body: some View {
        ZStack {
            HStack() {
                GamesProfileView(user: game.homeUser, isHome: true)
                Spacer()
                GamesProfileView(user: game.awayUser, isHome: false)            }
            GamesScoreView(game: game)
        }
    }
}
