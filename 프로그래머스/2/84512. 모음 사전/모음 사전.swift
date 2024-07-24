import Foundation

func solution(_ word:String) -> Int {
    let alphabet = ["A","E","I","O","U"]
    var arr = [String]()
    func backtrack(_ s: String) {
        arr.append(s)
        if s.count == alphabet.count { return }
        for i in 0..<alphabet.count {
            backtrack(s+alphabet[i])
        }
    }
    backtrack("")
    return arr.firstIndex(of: word)!
}