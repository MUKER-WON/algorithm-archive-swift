let I = readLine()!.split {$0==" "}.map {Int($0)!}, N = I[0], M = I[1]
var arr = (0..<N).map { _ in Array(readLine()!).map {Int(String($0))!}}
var result = 1

for size in 1..<min(N,M) {
    for y in 0..<N-size {
        for x in 0..<M-size {
            let p1 = arr[y][x]
            let p2 = arr[y][x+size]
            let p3 = arr[y+size][x]
            let p4 = arr[y+size][x+size]
            
            if p1 == p2 && p2 == p3 && p3 == p4 {
                result = (size+1)*(size+1)
            }
        }
    }
}
print(result)