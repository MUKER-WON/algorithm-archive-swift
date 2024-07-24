import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted { $0[1] < $1[1] }
    var targetSize = 0
    var count = 0
    for i in 0..<targets.count {
        if targets[i][0] >= targetSize {
            targetSize = targets[i][1]
            count += 1
        }
    }
    return count
}