let N = Int(readLine()!)!
var arr = [[Int]]()
var count = [0, 0, 0]
for _ in 0..<N { arr.append(readLine()!.split(separator: " ").map { Int($0)! }) }

func solution(_ paper: [[Int]], _ size: Int, _ row: Int, _ col: Int) {
    let check = paper[row][col]
    for i in row..<row+size {
        for j in col..<col+size {
            if paper[i][j] != check {
                let newSize = size / 3
                for k in 0..<3 {
                    for l in 0..<3 {
                        solution(paper, newSize, row + k * newSize, col + l * newSize)
                    }
                }
                return
            }
        }
    }
    count[check + 1] += 1
}
solution(arr, N, 0, 0)

for i in 0..<3 {
    print(count[i])
}