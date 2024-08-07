let N = Int(readLine()!)!
var dic = [Int: Int]()
(1...N).forEach { i in dic[i] = Int(readLine()!)! }
var visited = Array(repeating: false, count: N+1)
var ans = Set<Int>()
func dfs(_ index: Int, _ indexArr: [Int], _ valueArr: [Int]) {
    if indexArr.contains(index) {
        if indexArr.sorted() == valueArr.sorted() {
            indexArr.forEach { ans.insert($0) }
        }
        return
    }
    visited[index] = true
    guard let value = dic[index] else { return }
    dfs(value, indexArr+[index], valueArr+[value])
}
for i in 1...N { dfs(i,[],[]) }
print(ans.count)
ans.sorted().forEach { print($0) }