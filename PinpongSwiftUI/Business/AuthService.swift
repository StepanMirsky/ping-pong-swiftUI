//
//  AuthService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import UIKit

struct Credentials {
    let login: String
    let password: String
}

protocol AuthService {
    func register(_ credentials: Credentials, result: @escaping ResultClosure<String>)

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>)
}

class AuthServiceImpl: AuthService {
    let storage = Storage.shared

    func register(_ credentials: Credentials, result: @escaping ResultClosure<String>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            self.storage.users.append(User(name: credentials.login, rating: 1000, image: UIImage(named: "defaultImage")!, lastGames: []))
            result(.success(credentials.login))
        }
    }

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            if self.storage.users.lazy.filter({ $0.name == credentials.login }).isEmpty {
                result(.failure(.textualError("Неправильный логин или пароль")))
            } else {
                result(.success(credentials.login))
            }
        }
    }
}
