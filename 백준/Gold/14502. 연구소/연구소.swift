let r = [(0,1),(0,-1),(1,0),(-1,0)]
let NM = readLine()!.split {$0==" "}.map {Int($0)!}, N = NM[0], M = NM[1]
var arr = [[Int]](), virus = [(Int,Int)](), result = 0
for i in 0..<N {
    let str = readLine()!.split {$0==" "}.map {Int($0)!}
    arr.append(str)
    for j in str.indices {if str[j]==2 { virus.append((i,j))}}
}

func bfs(b1: (Int,Int), b2: (Int,Int), b3: (Int,Int)) {
    guard arr[b1.0][b1.1]==0 && arr[b2.0][b2.1]==0 && arr[b3.0][b3.1]==0 else {return}
    var arr2 = arr
    (arr2[b1.0][b1.1],arr2[b2.0][b2.1],arr2[b3.0][b3.1]) = (1,1,1)
    var queue = virus
    while !queue.isEmpty {
        let vi = queue.removeFirst()
        for i in 0..<4 {
            let my = vi.0+r[i].0, mx = vi.1+r[i].1
            guard my>=0 && my<N && mx>=0 && mx<M else {continue}
            guard arr2[my][mx]==0 else {continue}
            arr2[my][mx] = 2
            queue.append((my,mx))
        }
    }
    result = max(result, arr2.flatMap {$0}.filter {$0==0}.count)
}

for i in 0..<N*M-2 {
    for j in i+1..<N*M-1 {
        for k in j+1..<N*M {
            bfs(b1: (i/M,i%M), b2: (j/M,j%M), b3: (k/M,k%M))
        }
    }
}
print(result)