let D = [(0,1),(0,-1),(1,0),(-1,0)]
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (M,N) = (I[0],I[1])
var tomato = [(Int,Int)]()
var graph = (0..<N).map { i -> [Int] in
    let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
    (0..<M).forEach { j in if arr[j] == 1 { tomato.append((i,j))} }
    return arr
}

var index = 0
while index != tomato.count {
    let (cy, cx) = tomato[index]
    index += 1
    for d in D {
        let (dy, dx) = (cy+d.0, cx+d.1)
        guard dy >= 0 && dy < N && dx >= 0 && dx < M else { continue }
        guard graph[dy][dx] == 0 else { continue }
        graph[dy][dx] = graph[cy][cx] + 1
        tomato.append((dy, dx))
    }
}
let ripeTomato = graph.flatMap { $0 }
print(ripeTomato.contains(0) ? -1 : ripeTomato.max()!-1)