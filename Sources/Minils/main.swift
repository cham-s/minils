// MARK: - Start

import Foundation


let arguments = Array(CommandLine.arguments[1...])


public struct Lister {
    var parser: ArgumentParser
    
    init(_ arguments: [String]) {
        self.parser = ArgumentParser(arguments)
    }
    
    private func printIllegalOption() {
        let options = parser.invalidOptions.joined(separator: " ")
        print("illegal options: \(options)")
    }
    
    public func list() {
        let fm = FileManager()
        
        if !parser.invalidOptions.isEmpty {
            printIllegalOption()
        }
        
        let longestLength = parser.validFiles.max()!.count
        for path in parser.validFiles {
            let files = try? fm.contentsOfDirectory(atPath: path)
            
        }
    }
}

let lister = Lister(arguments)

lister.list()


