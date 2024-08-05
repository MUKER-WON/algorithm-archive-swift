for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let choice = [0]+readLine()!.split(separator: " ").map { Int($0)! }
    var visited = Array(repeating: false, count: n+1)
    var finish = Array(repeating: false, count: n+1)
    var result = n
    
    func dfs(_ num: Int) {
        visited[num] = true
        let next = choice[num]
        
        if !visited[next] { dfs(next) }
        else if !finish[next] {
            var i = next
            
            while i != num {
                result -= 1
                i = choice[i]
            }
            result -= 1
        }
        finish[num] = true
    }
    
    for i in 1...n {
        if !visited[i] {
            dfs(i)
        }
    }
    print(result)
}