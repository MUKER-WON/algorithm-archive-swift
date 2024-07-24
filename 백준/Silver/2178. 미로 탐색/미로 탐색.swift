let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N,M) = (NM[0],NM[1])
var maze = [[Int]]()
let moveX = [0,0,1,-1]
let moveY = [1,-1,0,0]
var queue = [(0,0)]
var visited = [(Int,Int)]()
var result = 1

for _ in 0..<N {
    maze.append(readLine()!.map { Int(String($0))! })
}

while !queue.isEmpty {
    let pop = queue.removeFirst()
    for i in 0..<4 {
        let nowY = pop.0+moveY[i]
        let nowX = pop.1+moveX[i]
        guard nowY >= 0 && nowY < N && nowX >= 0 && nowX < M else { continue }
        if maze[nowY][nowX] == 1 {
            maze[nowY][nowX] = maze[pop.0][pop.1] + 1
            queue.append((nowY,nowX))
        }
    }
}

print(maze[N-1][M-1])