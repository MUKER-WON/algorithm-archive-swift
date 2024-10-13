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
    var vis = Array(repeating: false, count: N+1)
    var scr = 0
    while !q.isEmpty {
        let (n,v) = q.removeFirst()
        if vis[n] { continue }
        vis[n] = true
        scr += v
        for j in dic[n]! where !vis[j] { q.append((j,v+1)) }
    }
    ans = ans.1 >= scr ? (ans.1 == scr ? (min(ans.0, i), scr) : (i, scr)) : ans
}
print(ans.0)