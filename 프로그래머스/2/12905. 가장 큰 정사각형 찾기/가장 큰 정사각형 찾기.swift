import Foundation

func solution(_ board:[[Int]]) -> Int {
    var myBoard = board
    let N = board.count
    let M = board[0].count
    for i in 1..<N {
        for j in 1..<M {
            if myBoard[i][j] > 0 {
                myBoard[i][j] += min(myBoard[i][j-1],myBoard[i-1][j-1],myBoard[i-1][j])
            }
        }
    }
    let num = myBoard.flatMap({$0}).max()!
    return num * num
}
