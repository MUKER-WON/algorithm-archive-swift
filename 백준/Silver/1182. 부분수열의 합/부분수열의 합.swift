let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var ans = 0
func dfs(_ i: Int, _ s: Int) {
    if i >= I[0] { return }
    let ns = s + arr[i]
    if ns == I[1] { ans += 1 }
    dfs(i+1, s)
    dfs(i+1, ns)
}
dfs(0, 0)
print(ans)