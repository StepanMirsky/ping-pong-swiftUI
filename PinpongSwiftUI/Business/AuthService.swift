//
//  AuthService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Moya

struct Credentials {
    let login: String
    let password: String
}

protocol AuthService {
    func register(_ credentials: Credentials, result: @escaping ResultClosure<User>)

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>)
}

class AuthServiceImpl: AuthService {
    let storage = Storage.shared

    func register(_ credentials: Credentials, result: @escaping ResultClosure<User>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.createUser(credentials)) { result in
            switch result {
            case .success(let responce):
                let someObj: DecodableObj = FastDecoder.decode(responce.data)
            //do something
            default:
                break
            }
        }
    }

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>) {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
//            if self.storage.users.lazy.filter({ $0.name == credentials.login }).isEmpty {
//                result(.failure(.textualError("Неправильный логин или пароль")))
//            } else {
//                result(.success(credentials.login))
//            }
//        }
    }
}
