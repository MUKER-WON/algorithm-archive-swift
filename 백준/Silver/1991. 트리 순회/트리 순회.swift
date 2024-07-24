var (cnt, ans, tree) = (Int(readLine()!)!, ["", "", ""], [String:[String]]())

for _ in 0..<cnt {
	let i = readLine()!.split{$0==" "}.map{String($0)}
	tree[i[0]] = [i[1], i[2]]
}

func dfs(_ n: String) {
	if n == "." {return}
	ans[0] += n
	dfs(tree[n]![0])
	ans[1] += n
	dfs(tree[n]![1])
	ans[2] += n
}
dfs("A")

for r in ans { print(r) }