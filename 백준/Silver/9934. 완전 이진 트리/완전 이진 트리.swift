let K = Int(readLine()!)!
let list = readLine()!.split { $0 == " " }.map { Int($0)! }
var ans = Array(repeating: [Int](), count: K)

func task(_ L: Int, _ R: Int, _ C: Int) {
    if L > R { return }
    let mid = (L+R)/2
    ans[C].append(list[mid])
    task(L, mid-1, C+1)
    task(mid+1, R, C+1)
}

task(0, list.count-1, 0)

ans.forEach {
    $0.forEach { print($0, terminator: " ") }
    print()
}