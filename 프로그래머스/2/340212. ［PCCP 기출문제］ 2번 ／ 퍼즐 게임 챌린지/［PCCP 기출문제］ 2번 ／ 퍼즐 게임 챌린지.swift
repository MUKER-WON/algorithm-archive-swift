import Foundation

func solution(
    _ diffs: [Int],
    _ times: [Int],
    _ limit: Int64
) -> Int {
    var low = 1
    var high = Int(1e9)
    
    while low <= high {
        let mid = (low + high) / 2
        var prev = 0
        var total = 0
        
        for i in 0..<diffs.count {
            let gap = diffs[i] - mid
            if gap > 0 {
                total += (prev + times[i]) * gap + times[i]
            } else {
                total += times[i]
            }
            prev = times[i]
        }
        
        if total > limit {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return low
}