//
//  Parsing.swift
//  Minils
//
//  Created by chams on 06/11/2019.
//

import Foundation


// MARK: - Option
public enum Option: Character {
    case list = "l"
    case recurisve = "R"
    case dotDirectory = "a"
    case reverse = "r"
    case lastModified = "t"
}


// MARK: - ArgumentParser
public struct ArgumentParser {
    public var files: [String] = []
    var options: Set<Character> = []

    public init(arguments: [String]) {
        guard !arguments.isEmpty else { return }
        for i in arguments.indices {
            if arguments[i] == "--" {
                let startFileIndex = arguments.index(after: i)
                files.append(contentsOf: Array(arguments[startFileIndex...]))
                break
            } else if arguments[i].hasPrefix("-") {
                let startIndex = arguments[i].firstIndex(where: { $0 != Character("-") })!
                let opts = Array<Character>(arguments[i][startIndex...])
                opts.forEach { options.insert($0) }
                continue
            } else {
                files.append(contentsOf: Array(arguments[i...]))
                break
            }
        }
    }
}

