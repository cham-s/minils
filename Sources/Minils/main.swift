// MARK: - Start

import Foundation


let arguments = Array(CommandLine.arguments[1...])
let parser = ArgumentParser(arguments: arguments)

print("options: \(parser.options)\nfiles: \(parser.files)")
