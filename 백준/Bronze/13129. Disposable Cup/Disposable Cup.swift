let I = readLine()!.split { $0 == " " }.map { Int($0)! }
(0..<I[2]).map { (I[2]-$0)*(I[1]+I[0]) + $0*I[0] }.sorted()
    .forEach { print($0, terminator: " ") }