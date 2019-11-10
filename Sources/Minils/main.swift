// MARK: - Start

import Foundation


let arguments = Array(CommandLine.arguments[1...])
let parser = ArgumentParser(arguments)

public struct Lister {
    public var arguments: [Option]
    public var paths: [String]
    
    init(paths: [String], arguments: [String]) {
        self.paths = paths
        
    }
    
    public func list() {
        let fm = FileManager()
        
    }
}

