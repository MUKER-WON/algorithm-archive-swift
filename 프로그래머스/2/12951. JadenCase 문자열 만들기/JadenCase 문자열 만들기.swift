func solution(_ s:String) -> String {
    var input = s.components(separatedBy: " ")
    for i in 0..<input.count {
        if input[i].first?.isLetter == Optional(true) { input[i] = input[i].capitalized }
        else { input[i] = input[i].lowercased() }
    }
    return input.joined(separator: " ")
}