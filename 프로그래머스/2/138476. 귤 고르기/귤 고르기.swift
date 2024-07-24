import Foundation

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    return Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
        .reduce((0,0)) { $0.1 >= k ? $0 : ($0.0 + 1, $0.1 + $1.count) }.0
}