//
//  PinpongApi.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

//=======>>>>>
//Examples https://github.com/Moya/Moya/blob/master/docs/Examples/Basic.md
//=======<<<<<

import Foundation
import Moya

enum PinpongRequest {
    case auth(login: String, password: String)
    case getGames
    case getGame(id: Int)
    case updateGame(id: Int)
    case createGame
    case getUser(id: Int)
    case getUsers
    case createUser
    case myProfile
}

extension PinpongRequest: TargetType {
    var baseURL: URL {
        return URL(string: "https://young-wave-17813.herokuapp.com")!
        
    }
    
    var path: String {
        switch self {
        case .auth:
            return "/users/sign_in"
        case .getGames:
            return "/games"
        case .createGame:
            return "/games/create"
        case .getGame(let id), .updateGame(let id):
            return "/gemes\(id)"
        case .getUser(let id):
            return "/users/\(id)"
        case .createUser:
            return "/users/registration"
        case .getUsers:
            return "/users"
        case .myProfile:
            return "/users/me"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGames, .getGame(_), .getUser(_), .getUsers, .myProfile:
            return .get
        case .createGame, .createUser, .auth(_, _):
            return .post
        case .updateGame(_):
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case .getGames, .getGame(_), .getUser(_), .getUsers, .myProfile:
            return .requestPlain
        case .auth(let login, let password):
            return .requestParameters(parameters: ["login": login, "password": password], encoding: JSONEncoding.default)
        case .createGame:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .createUser:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .updateGame(let id):
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
