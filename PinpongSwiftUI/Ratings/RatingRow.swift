//
//  RatingRow.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

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
                    .color((rating.value > 1000) ? .green : (rating.value < 500 ? .red : .gray))
                    .font(Font.system(.subheadline, design: .rounded))
            }
        }
    }
}
