func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var blocks = board.map { $0.map { String($0) } }
    let searchY = [0,1,1]
    let searchX = [1,0,1]
    var erased = [(Int,Int)]()
    repeat {
        erased = []
        for cycleY in (0..<m) {
            for cycleX in 0..<n {
                if blocks[cycleY][cycleX] == "*" { continue }
                var same = 0
                for i in 0..<3 {
                    let newY = searchY[i] + cycleY
                    let newX = searchX[i] + cycleX
                    guard newY >= 0 && newY < m && newX >= 0 && newX < n else { continue }
                    let now = blocks[cycleY][cycleX]
                    let new = blocks[newY][newX]
                    if now == new { same += 1 }
                }
                if same >= 3 {
                    erased.append((cycleY,cycleX))
                }
                
            }
        }
        for i in erased {
            blocks[i.0][i.1] = "*"
            for j in 0..<3 {
                let y = searchY[j] + i.0
                let x = searchX[j] + i.1
                blocks[y][x] = "*"
            }
        }
        for cycleY in (0..<m-1).reversed() {
            for cycleX in 0..<n {
                var count = 0
                while blocks[cycleY+1+count][cycleX] == "*" {
                    blocks[cycleY+1+count][cycleX] = blocks[cycleY+count][cycleX]
                    blocks[cycleY+count][cycleX] = "*"
                    count += 1
                    if cycleY+1+count > m-1 { break }
                }
            }
        }
    }
    while erased.count != 0;
    
    return blocks.map { $0.filter { $0 == "*" }.count }.reduce(0,+)
}