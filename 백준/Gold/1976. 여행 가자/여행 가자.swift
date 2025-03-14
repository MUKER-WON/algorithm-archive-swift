let N = Int(readLine()!)!
let M = Int(readLine()!)!
var V = Array(repeating: false, count: N)
var C = [Int: [Int]]()

(0..<N).forEach { i in
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    (0..<N).forEach { j in
        if I[j] == 1 { C[i, default: []].append(j) }
    }
}

var trip = readLine()!.split { $0 == " " }.map { Int($0)!-1 }
var stack = [trip[0]]
V[trip[0]] = true

while !stack.isEmpty {
    let n = stack.removeLast()
    for i in C[n] ?? [] {
        if !V[i] {
            stack.append(i)
            V[i] = true
        }
    }
}
print(trip.allSatisfy { V[$0] } ? "YES" : "NO")