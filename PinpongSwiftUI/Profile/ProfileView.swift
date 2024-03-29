//
//  ProfileView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI
import UIKit

struct ProfileView : View {
    let userService: UserService = UserServiceImpl()
    let coordinator = Coordinator1()
    @State var hide: Bool = false
    
    var imagePicker: ImagePickerView {
        return ImagePickerView(delegate: coordinator, dismissed: $hide)
    }
    
    @State var user: UserViewModel!
    @State var showingAlert: Bool = false
    @State var errorMessage: String = ""

    var isMe: Bool

    @State var isAuthorized: Bool = UserDefaults.standard.string(forKey: "cookie") != nil


    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                if (isAuthorized || !isMe) && user != nil {
                    if isMe {
                        Image(uiImage: user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                        
                        PresentationLink(destination: imagePicker) {
                            Text("Изменить фото")
                                .color(Color.ratingColor(user.rating))
                                .font(Font.system(.headline, design: .rounded))
                        }
                    } else {
                        Image(uiImage: user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                    }
                    Text(user.name)
                        .font(Font.system(.largeTitle, design: .rounded))
                    Text("\(Int(user.rating))")
                        .color(Color.ratingColor(user.rating))
                        .font(Font.system(.headline, design: .rounded))
                    LastGamesView(lastGames: user.lastGames)
                    if !isMe && isAuthorized {
                        NavigationLink(destination: GameView(game: nil, awayUser: self.user)) {
                            Text("Вызвать")
                                .font(.system(.headline, design: .rounded))
                        }
                    }
                    Spacer()
                    NavigationLink(destination: GamesView(userName: user.name)) {
                        Text("Посмотреть все игры")
                            .font(.system(.headline, design: .rounded))
                    }
                } else {
                    PresentationLink(destination: LoginView() ) {
                        Text("Войти или зарегистрироваться")
                            .font(.system(.headline, design: .rounded))
                            .navigationBarItems(
                                trailing: Button("Обновить") {
                                    self.userService.getCurrentUser { (result) in
                                        switch result {
                                        case .success(let user):
                                            self.user = user
                                        case .failure(let error):
                                            self.errorMessage = error.localizedDescription
                                            self.showingAlert = true
                                        }
                                        self.isAuthorized = UserDefaults.standard.string(forKey: "cookie") != nil
                                    }
                                }
                        ).navigationBarTitle(Text("Профиль"))
                    }
                }
            }
            .onAppear {
                self.coordinator.successImagePicked = { image in
                    self.hide = true
                    self.user.image = image
                }
                self.coordinator.cancellPicker = {
                     self.hide = true
                }
                
                if self.user == nil {
                    self.userService.getCurrentUser { (result) in
                        switch result {
                        case .success(let user):
                            self.user = user

                        case .failure(let error):
                            self.errorMessage = error.localizedDescription
                            self.showingAlert = true
                        }
                        self.isAuthorized = UserDefaults.standard.string(forKey: "cookie") != nil
                    }
                }
            }
        }
    }
}

//MARK: UIImagePickerControllerDelegate
class Coordinator1: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var successImagePicked: ((UIImage) -> Void)?
    var cancellPicker: (()-> Void)?

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        cancellPicker?()
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            successImagePicked?(pickedImage)
        }
    }
}
