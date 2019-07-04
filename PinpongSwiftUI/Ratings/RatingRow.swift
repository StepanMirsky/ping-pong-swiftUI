//
//  RatingRow.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct LastGamesView : View {
    var lastGames: [ShortGame]
    
    var body: some View {
        HStack() {
            ForEach(lastGames.identified(by: \.id)) { game in
                Image(uiImage: UIImage.from(color: game.isWin ? .green : .red))
                    .resizable()
                    .frame(width: 5, height: 5)
                    .cornerRadius(2.0)
            }
        }
    }
}

struct RatingRow : View {
    var rating: Rating
    
    var body: some View {
        HStack {
            Image(uiImage: rating.image)
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                Text(rating.name)
                    .color(.black)
                    .font(Font.system(.headline, design: .rounded))
                Text(String(rating.value))
                    .color(.ratingColor(rating.value))
                    .font(Font.system(.subheadline, design: .rounded))
            }
            LastGamesView(lastGames: rating.lastWins)
        }
    }
}

extension Color {
    static func ratingColor(_ ratingValue: Int) -> Color {
        return (ratingValue > 1000) ? .green : (ratingValue < 500 ? .red : .gray)
    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
