let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var dic = [Int: [Int]]()
var ans = (0, Int.max)

for _ in 1...M {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    dic[I[0], default: []].append(I[1])
    dic[I[1], default: []].append(I[0])
}

for i in 1...N {
    var q = dic[i]!.map { ($0,1) }
    var visited = Array(repeating: false, count: N+1)
    var score = 0
    
    while !q.isEmpty {
        let (n,v) = q.removeFirst()
        if visited[n] { continue }
        visited[n] = true
        score += v
        
        for j in dic[n]! {
            if visited[j] { continue }
            q.append((j,v+1))
        }
    }
    ans = ans.1 >= score 
    ? (ans.1 == score ? (min(ans.0, i), score)
    : (i, score)) : ans
}

print(ans.0)