let N = Int(readLine()!)!
let tower = readLine()!.split { $0 == " " }.map { Int($0)! }
var ans = Array(repeating: 0, count: N)
var stack = [(Int,Int)]()

for i in stride(from: N-1, through: 0, by: -1) {
    let now = tower[i]
    
    while !stack.isEmpty, stack.last!.0 <= now {
        ans[stack.removeLast().1] = i+1
    }
    stack.append((now,i))
}

ans.forEach { print($0, terminator: " ") }