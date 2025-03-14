let N = Int(readLine()!)!
let M = Int(readLine()!)!
var visited = Array(repeating: false, count: N)
var city = [Int: [Int]]()

(0..<N).forEach { i in
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    (0..<N).forEach { j in
        if I[j] == 1 {
            city[i, default: []].append(j)
        }
    }
}

var trip = readLine()!.split { $0 == " " }.map { Int($0)!-1 }
var stack = [trip[0]]
visited[trip[0]] = true

while !stack.isEmpty {
    let n = stack.removeLast()
    
    for i in city[n] ?? [] {
        if !visited[i] {
            stack.append(i)
            visited[i] = true
        }
    }
}
print(trip.allSatisfy { visited[$0] } ? "YES" : "NO")