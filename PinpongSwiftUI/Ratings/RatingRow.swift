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
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 5.0) {
                Text(rating.name).color(.black)
                Text(String(rating.value)).color(.gray)
            }
        }
    }
}
