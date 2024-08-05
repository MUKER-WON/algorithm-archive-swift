let N = Int(readLine()!)!
var v1 = Array(repeating: 0, count: N)
var v2 = Array(repeating: 0, count: N*2)
var v3: Set<Int> = []
var ans = 0

func dfs(y: Int) {
	if y == N {
		ans += 1
		return
	}
	for x in 0..<N {
		if (v1[x],v2[y+x]) == (0,0) && !v3.contains(x-y) {
			(v1[x], v2[y+x]) = (1,1)
			v3.insert(x-y)
			dfs(y: y+1)
			(v1[x], v2[y+x]) = (0,0)
			v3.remove(x-y)
		}
	}
}
dfs(y: 0)
print(ans)