myWhile: while true {
    let input = readLine()!
    guard input != "." else { break }
    var bracket = [Character]()
    
    for i in input {
        if i == "(" { bracket.append("(") }
        if i == "[" { bracket.append("[") }
        if i == ")" { if bracket.last == "(" { bracket.removeLast(); continue } else { print("no"); continue myWhile } }
        if i == "]" { if bracket.last == "[" { bracket.removeLast(); continue } else { print("no"); continue myWhile} }
    }
    bracket.isEmpty ? print("yes") : print("no")
}