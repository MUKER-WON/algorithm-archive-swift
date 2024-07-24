let input = Int(readLine()!)!
var farm = [[Bool]]()
var visited = [[Bool]]()
let dirX = [1, -1, 0, 0]
let dirY = [0, 0, 1, -1]

func dfs(_ y: Int, _ x: Int) {
    visited[y][x] = true
    for i in 0...3 {
        let newX = x + dirX[i]
        let newY = y + dirY[i]
        if farm[newY][newX] && !visited[newY][newX] {
            dfs(newY, newX)
        }
    }
}

for _ in 0..<input {
    let WHK = readLine()!.split(separator: " ").map { Int($0)! }
    farm = Array(repeating: Array(repeating: false, count: WHK[0]+2), count: WHK[1]+2)
    visited = farm
    var result = 0

    for _ in 0..<WHK[2] {
        let bug = readLine()!.split(separator: " ").map { Int($0)! }
        farm[bug[1]+1][bug[0]+1] = true
    }

    for i in 1...WHK[1] {
        for j in 1...WHK[0] {
            if farm[i][j] && !visited[i][j] {
                dfs(i,j)
                result += 1
            }
        }
    }
    print(result)
}