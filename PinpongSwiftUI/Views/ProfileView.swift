//
//  ProfileView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct User {
    let name: String
    let rating: Int
    let image: UIImage
}

struct ProfileView : View {
    var user: User = User.init(name: "Sergey", rating: 1000, image: UIImage(named: "defaultImage")!)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Image(uiImage: user.image)
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .gesture(TapGesture.init())
                Text(user.name)
                    .font(Font.system(size: 25, design: .rounded))
                Text("\(user.rating)")
                    .font(Font.system(size: 25, design: .rounded))
            }
        }
    }
    
}
