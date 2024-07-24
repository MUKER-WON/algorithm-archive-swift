func solution(_ s:String) -> Bool {
    var arr = [Character]()

    for i in s {
        if i == "(" {
            arr.append("(")
        }
        else {
            guard !arr.isEmpty else { return false }
            if arr.last! == "(" { arr.removeLast() }
            else { return false }
        }
    }
    if arr.isEmpty { return true }
    else { return false }
}