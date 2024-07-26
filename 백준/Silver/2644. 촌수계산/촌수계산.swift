var visited = (0...Int(readLine()!)!).map{ _ in false }
let people = readLine()!.split { $0 == " " }.map { Int($0)! }
var family = [Int: [Int]]()
var result = -1

for _ in 0..<Int(readLine()!)! {
    let i = readLine()!.split { $0 == " " }.map { Int($0)! }
    family[i[0], default: []].append(i[1])
    family[i[1], default: []].append(i[0])
}

func dfs(num: Int, depth: Int) {
    visited[num] = true
    if num == people[1] {
        result = depth
        return
    }
    guard let list = family[num] else { return }
    list.forEach {
        if visited[$0] { return }
        dfs(num: $0, depth: depth+1)
    }
}

dfs(num: people[0], depth: 0)
print(result)