func solution(_ word:String) -> Int {
    let alphabet = ["A", "E", "I", "O", "U"]
    var cnt = 0
    var ans = 0
    
    func dfs(stack: [String]) {
        if stack.joined() == word {
            ans = cnt
        }
        cnt += 1

        if stack.count == 5 {
            return
        }
        
        (0..<alphabet.count).forEach {
            dfs(stack: stack + [alphabet[$0]])
        }
    }
    dfs(stack: [])
    return ans
}