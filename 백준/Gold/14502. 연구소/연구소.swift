let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (I[0], I[1])
var virus = [(Int, Int)]()
var lab = (0..<N).map { i -> [Int] in
    let row = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    (0..<M).forEach { j in
        if row[j] == 2 {
            virus.append((i, j))
        }
    }
    return row
}
var ans = 0

func buildWall(wallCount: Int, idx: Int) {
    if wallCount == 3 {
        spreadVirus()
        return
    }
    if idx >= N * M {
        return
    }
    
    let (r, c) = (idx / M, idx % M)
    
    if lab[r][c] == 0 {
        lab[r][c] = 1
        buildWall(wallCount: wallCount + 1, idx: idx + 1)
        lab[r][c] = 0
    }
    buildWall(wallCount: wallCount, idx: idx + 1)
}

func spreadVirus() {
    let D = [(0,1), (0,-1), (1,0), (-1,0)]
    var lab = lab
    var virus = virus
    
    while !virus.isEmpty {
        let (y, x) = virus.removeFirst()
        
        for (dy, dx) in D {
            let (ny, nx) = (y + dy, x + dx)
            
            guard ny >= 0 && ny < N && nx >= 0 && nx < M else {
                continue
            }
            guard lab[ny][nx] == 0 else {
                continue
            }
            
            lab[ny][nx] = 2
            virus.append((ny,nx))
        }
    }
    
    var safeZone = 0
    
    for i in 0..<N*M {
        if lab[i / M][i % M] == 0 {
            safeZone += 1
        }
    }
    ans = max(ans, safeZone)
}

buildWall(wallCount: 0, idx: 0)
print(ans)