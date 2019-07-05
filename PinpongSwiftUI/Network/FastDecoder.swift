//
//  Decoder.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

struct FastDecoder {
    static func decode<T: Decodable>(_ data: Data) -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(Date.dateFormater())
        
        return try! decoder.decode(T.self, from: data)
    }
}

struct PinpongResponse<T: Decodable>: Decodable {
    let data: T
}
