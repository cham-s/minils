//
//  Parsing.swift
//  Minils
//
//  Created by chams on 06/11/2019.
//

import Foundation


public struct Checker {
    
}


// MARK: - ArgumentParser
public struct ArgumentParser {
    public var files: [String] = []
    private var optionSet: Set<Character> = []
    public var invalidOptions: [String] {
        optionSet.filter { Option(rawValue: $0) == nil }.map { String($0) }
    }
    public var validOtionsOptions: [Option] {
        optionSet.compactMap { Option(rawValue: $0) }
    }

    public init(_ arguments: [String]) {
        guard !arguments.isEmpty else { return }
        for i in arguments.indices {
            if arguments[i] == "--" {
                let startFileIndex = arguments.index(after: i)
                files.append(contentsOf: Array(arguments[startFileIndex...]))
                break
            } else if arguments[i].hasPrefix("-") {
                let startIndex = arguments[i].firstIndex(where: { $0 != Character("-") })!
                let opts = Array<Character>(arguments[i][startIndex...])
                opts.forEach { optionSet.insert($0) }
                continue
            } else {
                files.append(contentsOf: Array(arguments[i...]))
                break
            }
        }
    }
}

