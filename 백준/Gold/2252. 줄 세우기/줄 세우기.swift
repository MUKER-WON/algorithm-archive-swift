let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var cnt = [Int](repeating: 0, count: N+1)
var arr = Array(repeating: [Int](), count: N+1)
(0..<M).forEach { _ in
    let s = readLine()!.split { $0 == " " }.map { Int($0)! }
    cnt[s[1]] += 1
    arr[s[0]] += [s[1]]
}
var ans = [Int]()
var queue = cnt.enumerated()
    .filter { $0.element == 0 && $0.offset != 0 }
    .map { $0.offset }

while !queue.isEmpty {
    let n = queue.removeFirst()
    ans.append(n)
    for i in arr[n] {
        cnt[i] -= 1
        if cnt[i] == 0 { queue += [i] }
    }
}

print(ans.map { String($0) }.joined(separator: " "))