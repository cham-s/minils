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
        for i in arguments.indices {
            if arguments[i] == "--" {
                let startFileIndex = arguments.index(after: i)
                files.append(contentsOf: Array(arguments[startFileIndex...]))
                break
            } else if arguments[i].hasPrefix("-") {
                options.append(arguments[i])
                continue
            } else {
                files.append(contentsOf: Array(arguments[i...]))
                break
            }
        }
    }
}

