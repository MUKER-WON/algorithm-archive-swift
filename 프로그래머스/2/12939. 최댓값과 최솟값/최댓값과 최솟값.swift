func solution(_ s:String) -> String {
    let input = s.split(separator: " ").map { Int($0)! }
    return "\(input.min()!) \(input.max()!)"
}