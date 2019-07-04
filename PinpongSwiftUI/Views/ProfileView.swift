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
    let image: URL?
}

struct ProfileView : View {
    var user: User = User.init(name: "Sergey", image: nil)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack.init(alignment: .center, spacing: 0) {
                    Image("defaultImage")
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fill)
                        
                        .clipShape(Circle())
                    Text(user.name)
                        .fontWeight(.heavy)
                        .font(Font.system(size: 30, design: .rounded))
                }
            }
            .navigationBarTitle("Профиль")
        }
    }
}
