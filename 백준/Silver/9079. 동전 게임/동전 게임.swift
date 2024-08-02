let D = [
    [(0, 0), (0, 1), (0, 2)],
    [(1, 0), (1, 1), (1, 2)],
    [(2, 0), (2, 1), (2, 2)],
    [(0, 0), (1, 0), (2, 0)],
    [(0, 1), (1, 1), (2, 1)],
    [(0, 2), (1, 2), (2, 2)],
    [(0, 0), (1, 1), (2, 2)],
    [(0, 2), (1, 1), (2, 0)]
]

func bfs(_ arr: [[String]], _ visited: [Int], _ count: Int) -> Int {
    var minCnt = Int.max
    if allSame(arr) { return count }
    var arr = arr
    for (y,x) in D[visited.last!] {
        arr[y][x] = arr[y][x] == "H" ? "T" : "H"
    }
    for i in 0..<D.count {
        guard !visited.contains(i) else { continue }
        minCnt = min(minCnt, bfs(arr, visited+[i], count+1))
    }
    return minCnt
}

func allSame(_ arr: [[String]]) -> Bool {
    let arr = arr.flatMap { $0 }
    return arr.allSatisfy { $0 == "H" } || arr.allSatisfy { $0 == "T" }
}

for _ in 0..<Int(readLine()!)! {
    let arr = (0...2).map { _ in
        readLine()!.split { $0 == " " }.map { String($0) }
    }
    var cnt = Int.max
    
    for i in 0..<D.count {
        cnt = min(cnt, bfs(arr, [i], 0))
    }
    print(cnt == Int.max ? -1 : cnt)
}