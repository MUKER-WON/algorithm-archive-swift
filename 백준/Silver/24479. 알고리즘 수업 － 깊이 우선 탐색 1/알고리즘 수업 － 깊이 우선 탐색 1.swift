import Foundation

let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M,R) = (I[0],I[1],I[2]) // N: 정점의 수, M: 간선의 수, R: 시작 정점
var setDic = [Int: Set<Int>]()
(0..<M).forEach { _ in
    let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
    setDic[arr[0], default: []].insert(arr[1])
    setDic[arr[1], default: []].insert(arr[0])
}
let dic = setDic.mapValues { $0.sorted() }

var ans = Array(repeating: 0, count: N+1)
var cnt = 1

func dfs(_ R: Int) {
    guard ans[R] == 0 else { return } // 방문 체크
    ans[R] = cnt
    cnt += 1
    if let P = dic[R] {
        P.forEach {
            dfs($0)
        }
    }
}

dfs(R)

(1...N).forEach {
    print(ans[$0])
}
