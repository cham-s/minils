// MARK: - Start

import Foundation


let arguments = Array(CommandLine.arguments[1...])


public struct Lister {
    var parser: ArgumentParser
    
    init(_ arguments: [String]) {
        self.parser = ArgumentParser(arguments)
    }
    
    /*
     
     */
    private func printIllegalOption() {
        let options = parser.invalidOptions.joined(separator: " ")
        print("illegal options: \(options)")
    }
    
    public func list() {
        let fm = FileManager()
        
        if !parser.invalidOptions.isEmpty {
            printIllegalOption()
        }
        if !parser.invalidFiles.isEmpty {
            parser.invalidFiles.forEach {
                print("minils: \($0):  No such file or directory")
            }
        }
        
        if parser.validURLs.count == 1 && fm.currentDirectoryPath == parser.validURLs[0].path {
            let currentDirURL = URL(fileURLWithPath: fm.currentDirectoryPath)
            for file in try! fm.contentsOfDirectory(at: currentDirURL, includingPropertiesForKeys: nil) {
                print(file.lastPathComponent, terminator: " ")
            }
            print("")
        }
    }
}

let lister = Lister(arguments)


lister.list()





