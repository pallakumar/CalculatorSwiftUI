//
//  CalculatorSwiftUI.swift
//  CalculatorSwiftUI
//
//  Created by apple on 30/06/25.
//

import Foundation


enum CalculatorSwiftUIError: Error, CustomStringConvertible {
    case negativeNumbersNotAllowed([Int])

    var description: String {
        switch self {
        case .negativeNumbersNotAllowed(let negatives):
            return "negative numbers not allowed \(negatives.map(String.init).joined(separator: ","))"
        }
    }
}

class CalculatorSwiftUI {
    func add(_ numbers: String) throws -> Int {
        if numbers.isEmpty { return 0 }

        var delimiters = [",", "\n"]
        var numberString = numbers

        // Handle custom delimiter
        if numbers.hasPrefix("//") {
            let lines = numbers.components(separatedBy: "\n")
            if lines.count > 1 {
                let customDelimiter = String(lines[0].dropFirst(2))
                delimiters.append(customDelimiter)
                numberString = lines.dropFirst().joined(separator: "\n")
            }
        }

        // Create regex-safe delimiter pattern
        let pattern = delimiters.map { NSRegularExpression.escapedPattern(for: $0) }.joined(separator: "|")
        let components = numberString.components(separatedBy: CharacterSet(charactersIn: delimiters.joined()))
        let intValues = components.compactMap { Int($0) }

        let negatives = intValues.filter { $0 < 0 }
        if !negatives.isEmpty {
            throw CalculatorSwiftUIError.negativeNumbersNotAllowed(negatives)
        }

        return intValues.reduce(0, +)
    }
}
