let N = Int(readLine()!)!
let garden = (0..<N).map { _ in
    readLine()!.split { $0 == " " }.map { Int($0)! }
}
var cost = Array(repeating: Array(repeating: 201, count: N), count: N)
var result = Int.max
// 꽃 모양 배열
let dr = [(0,0),(0,1),(0,-1),(1,0),(-1,0)]

for i in 1..<N-1 {
    for j in 1..<N-1 {
        cost[i][j] = dr.map { garden[i+$0.0][j+$0.1] }.reduce(0,+)
    }
}

func search(_ upCost: [[Int]], _ sum: [Int], _ y: Int) {
    if sum.count == 3 {
        let sumN = sum.reduce(0,+)
        result = result > sumN ? sumN : result
        return
    }
    for i in y..<N-1 {
        for j in 1..<N-1 {
            let now = upCost[i][j]
            let sumN = (sum+[now]).reduce(0,+)
            // 가지치기, 현재값이 result보다 커졌다면 continue
            if result <= sumN { continue }
            // 202는 방문 체크
            if upCost[i-1][j] != 202 && upCost[i+1][j] != 202 && upCost[i][j-1] != 202 && upCost[i][j+1] != 202 {
                var upCost = upCost
                for (dy, dx) in dr {
                    upCost[i+dy][j+dx] = 202
                }
                search(upCost, sum+[now], i)
            }
        }
    }
}
search(cost, [], 1)
print(result)