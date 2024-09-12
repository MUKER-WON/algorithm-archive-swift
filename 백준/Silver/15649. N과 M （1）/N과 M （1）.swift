let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var used = Array(repeating: false, count: N+1)
var result = ""

func backtrack(s: String, count: Int) {
    if count == M {
        result.append(s+"\n")
        return
    }
    for i in 1...N {
        if !used[i] {
            used[i] = true
            backtrack(s: s+"\(i) ", count: count+1)
            used[i] = false
        }
    }
}
backtrack(s: "", count: 0)
print(result)