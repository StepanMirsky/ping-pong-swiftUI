//
//  UserService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import Moya

enum APIError: Error {
    case textualError(String)
}

struct ErrorModel: Decodable {
    let errors: Errors
}

struct Errors: Decodable {
    let detail: String
}

typealias ResultClosure<T> = (Result<T, APIError>) -> ()

protocol UserService {
    func getUsers(_ result: @escaping ResultClosure<[UserViewModel]>)

    func getCurrentUser(_ result: @escaping ResultClosure<UserViewModel>)
}

class UserServiceImpl: UserService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard

    func getUsers(_ result: @escaping ResultClosure<[UserViewModel]>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.getUsers) { requestResult in
            switch requestResult {
            case .success(let response):
                if let users: [User] = try? JSONDecoder().decode([User].self, from: response.data) {
                    let userViewModels = users.compactMap { UserViewModel(from: $0) }
                    result(.success(userViewModels))
                }
                
                if let error: ErrorModel = try? JSONDecoder().decode(
                    ErrorModel.self,
                    from: response.data) {
                    result(.failure(.textualError(error.errors.detail)))
                }
            case .failure(let error):
                result(.failure(.textualError(error.errorDescription ?? "")))
            }
        }
    }

    func getCurrentUser(_ result: @escaping ResultClosure<UserViewModel>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.myProfile) { requestResult in
            switch requestResult {
            case .success(let responce):
                if let user: User = try? JSONDecoder().decode(User.self, from: responce.data) {
                    result(.success(UserViewModel(from: user)))
                }
                
                if let error: ErrorModel = try? JSONDecoder().decode(
                    ErrorModel.self,
                    from: responce.data) {
                    result(.failure(.textualError(error.errors.detail)))
                }
                
                
            //do something
            case .failure(let error):
                result(.failure(.textualError(error.errorDescription ?? "")))
            }
        }
    }
}
