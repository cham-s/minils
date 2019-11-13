//
//  Parsing.swift
//  Minils
//
//  Created by chams on 06/11/2019.
//

import Foundation


public extension URL {
    /// Check if the path of the URL is a directory or not.
    /// It performs the version check for the platform, whether
    /// hasDirectoryPath
    /// - Returns: true if the the URL is of type directory, false
    /// if not.
    var isDirectory: Bool {
        if #available(OSX 10.11, *) {
            return self.hasDirectoryPath
        } else {
            let fm = FileManager.default
            var pathIsDirectory: ObjCBool = false
            fm.fileExists(atPath: self.path, isDirectory: &pathIsDirectory)
            return pathIsDirectory.boolValue
        }
    }
}

// MARK: - ArgumentParser
public struct ArgumentParser {
    private var files: [String] = []
    public var validURLs: [URL] {
        let fm = FileManager()
        return files
                .filter { fm.fileExists(atPath: $0) }
                .map { URL(fileURLWithPath: $0) }
    }
    public var invalidFiles: [String] {
        let fm = FileManager()
        return files.filter { !fm.fileExists(atPath: $0) }
    }
    private var optionSet: Set<Character> = []
    public var invalidOptions: [String] {
        optionSet.filter { Option(rawValue: $0) == nil }.map { String($0) }
    }
    public var validOtionsOptions: [Option] {
        optionSet.compactMap { Option(rawValue: $0) }
    }

    public init(_ arguments: [String]) {
        guard !arguments.isEmpty else {
            files.append(".")
            return
        }
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

