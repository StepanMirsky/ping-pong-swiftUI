//
//  Date+Formatter.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

extension Date {
    static func dateFormater() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //узнать формат даты
        return dateFormatter
    }
    
}
