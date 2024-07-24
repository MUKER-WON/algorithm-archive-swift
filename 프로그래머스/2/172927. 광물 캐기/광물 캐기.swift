func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var arr = [[String]](), pick = picks, result = 0
    
    
    var slice = picks.reduce(0,+)
    for i in stride(from: 0, to: minerals.count, by: 5) {  // 광물 5개씩 끊어주기
        guard slice != 0 else { break }
        if i+4 >= minerals.count { arr.append(Array(minerals[i...]))}
        else { arr.append(Array(minerals[i...i+4]))}
        slice -= 1
    }
    
    arr = arr.sorted { arr1, arr2 in
        if arr1.filter { $0=="diamond" }.count == arr2.filter { $0=="diamond" }.count {
            return arr1.filter { $0=="iron" }.count > arr2.filter { $0=="iron" }.count
        } else {
            return arr1.filter { $0=="diamond" }.count > arr2.filter { $0=="diamond" }.count
        }
    }
    
    for mineral in arr { // 곡갱이 골라서 광물 5개씩 순서대로 캐기
        guard pick.reduce(0,+) != 0 else { break }
        var pickax = -1, count = Int.max
        for i in 0..<3 {
            guard pick[i] != 0 else { continue }
            let work = mineral.map {
                if $0=="diamond" {
                    switch i {
                        case 0: return 1
                        case 1: return 5
                        default: return 25
                    }
                } else if $0=="iron" {
                    switch i {
                        case 0: return 1
                        case 1: return 1
                        default: return 5
                    }
                } else {
                    switch i {
                        case 0: return 1
                        case 1: return 1
                        default: return 1
                    }
                }
            }.reduce(0,+)
            if count >= work {
                pickax = i
                count = work
            }
        }
        pick[pickax] -= 1
        result += count
    }
    return result
}