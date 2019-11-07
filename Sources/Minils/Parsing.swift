//
//  Parsing.swift
//  Minils
//
//  Created by chams on 06/11/2019.
//

import Foundation


// MARK: - String input type
public enum InputType {
    case filename
    case option
    case endOfOption
}

// MARK: - Option
public enum Option: String {
    case list = "l"
    case recurisve = "R"
    case dotDirectory = "a"
    case reverse = "r"
    case lastModified = "t"
}


// MARK: - ArgumentParser
public struct ArgumentParser {
    public var files: [String] = []
    var options: [String] = []
    
    
    public init(arguments: [String]) {
        guard !arguments.isEmpty else { return }
        
        let indexStopOption = arguments.firstIndex(of: "--")
        if let endArgumentIndex = indexStopOption {
            let next = arguments.index(after: endArgumentIndex)
            options = Array(arguments[..<endArgumentIndex])
            files = Array(arguments[next...])
        } else {
            let lastArgumentIndex = arguments.lastIndex { $0.hasPrefix("-") }
            if let lastIndex = lastArgumentIndex,  let first = arguments.first,
            first.hasPrefix("-") {
                let next = arguments.index(after: lastIndex)
                options = Array(arguments[...lastIndex])
                files = Array(arguments[next...])
            } else {
                files = arguments
            }
        }
    }
}

