//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("BackGround")
    static let con = Color("Icon")
    static let txt = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initialising DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}
extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {return Date()}
        
        return parsedDate
    }
}
