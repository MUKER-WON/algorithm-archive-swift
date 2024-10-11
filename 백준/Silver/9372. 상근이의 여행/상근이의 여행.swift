for _ in 0..<Int(readLine()!)! {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (N,M) = (I[0],I[1]) // N: 국가의 수, M: 비행기의 종류
    var dic = [Int: [Int]]()
    var visited = Array(repeating: false, count: N+1)
    var ans = 0
    
    for _ in 0..<M {
        let I = readLine()!.split { $0 == " " }.map { Int($0)! }
        dic[I[0], default: []].append(I[1])
        dic[I[1], default: []].append(I[0])
    }
    
    var arr = dic[1]!
    
    while !arr.isEmpty {
        let n = arr.removeLast()
        if visited[n] { continue }
        ans += 1
        visited[n] = true
        for i in dic[n]! {
            if !visited[i] && !arr.contains(i) {
                arr.append(i)
            }
        }
    }
    
    print(ans-1)
}