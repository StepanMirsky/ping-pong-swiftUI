//
//  GamesProfileView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GamesProfileView: View {
    let user: UserViewModel
    let isHome: Bool
    var imageAligment: HorizontalAlignment {
        return isHome ? .leading : .trailing
    }
    
    var body: some View {
        VStack(alignment: imageAligment) {
            Image(uiImage: user.image)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                
                .shadow(radius: 10)
            Text("\(user.name)")
                .font(.headline)
            Text("Рейтинг: \(user.rating)")
                .font(.subheadline)
                .color(.gray)
        }
        .padding(10)
    }
}
