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
        printIllegalOption()
        
    }
}

let lister = Lister(arguments)

lister.list()


