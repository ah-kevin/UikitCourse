//
//  String+Ex.swift
//  MyLocations
//
//  Created by bjke on 2023/5/31.
//

import UIKit
extension String {
    mutating func add(
        text: String?,
        separatedBy separator: String = ""
    ) {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
