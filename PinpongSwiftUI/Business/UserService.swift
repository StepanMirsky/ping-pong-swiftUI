//
//  UserService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

enum APIError: Error {
    case textualError(String)
}

typealias ResultClosure<T> = (Result<T, APIError>) -> ()

protocol UserService {
    func getUsers(_ result: @escaping ResultClosure<[User]>)

    func getCurrentUser(_ result: @escaping ResultClosure<User>)
}

class UserServiceImpl: UserService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard

    func getUsers(_ result: @escaping ResultClosure<[User]>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            result(.success(self.storage.users))
        }
    }

    func getCurrentUser(_ result: @escaping ResultClosure<User>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            if let token = self.userDefaults.string(forKey: "token"),
                let user = self.storage.users.first(where: { $0.name == token }) {
                result(.success(user))
            } else {
                result(.failure(.textualError("Пользователь не найден")))
            }
        }
    }
}
