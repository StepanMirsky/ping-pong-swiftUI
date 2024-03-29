//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct LoginView : View {
    let authService: AuthService = AuthServiceImpl()
    let userDefaults = UserDefaults.standard

    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    @State var login: String = ""
    @State var password: String = ""
    @State var error: Error?

    var body: some View {
        NavigationView {
            VStack {
                Text("Введите логин")
                    .font(.system(.subheadline, design: .rounded))
                    .navigationBarTitle("Войдите")
                TextField("", text: $login)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 16)
                Text("Введите пароль")
                    .font(.system(.subheadline, design: .rounded))
                SecureField("", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 16)
                Text(error?.localizedDescription ?? "")
                    .font(.system(.subheadline, design: .rounded))
                    .color(.red)
                HStack {
                    Button("Войти") {
                        self.signin()
                    }
                    .padding(16)
                        .font(.system(.headline, design: .rounded))
                        .disabled(password.isEmpty)

                    NavigationLink(destination: RegistrationView()) {
                        Text("Зарегистрироваться")
                            .color(.blue)
                            .font(.system(.headline, design: .rounded))
                    }
                    .padding(16)
                }
            }
        }.onAppear{
            print("Profile appeared")
        }.onDisappear{
            print("Profile disappeared")
        }
    }

    func signin() {
        let credentials = Credentials(login: login, password: password)
        authService.login(credentials) { result in
            switch result {
            case .success(_):
                self.isPresented?.value = false
            case .failure(let error):
                self.error = error
            }
            self.isPresented?.value = false
        }
    }
}

#if DEBUG
struct Login_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
