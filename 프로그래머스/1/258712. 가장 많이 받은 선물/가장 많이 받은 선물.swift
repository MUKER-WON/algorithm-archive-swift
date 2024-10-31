import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var graph = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var numbers = [String: Int]()
    var quotient = [Int: (get: Int, give: Int, Int)]()
    var nextMonth = Array(repeating: 0, count: friends.count)
    
    // 친구들 번호 지정해주기
    for (index, friend) in friends.enumerated() {
        numbers[friend] = index
    }
    
    // 선물 주고 받기
    for gift in gifts {
        let name = gift.split { $0 == " " }.map { String($0) }
        graph[numbers[name[0]]!][numbers[name[1]]!] += 1
    }
    
    // 지수 계산
    for i in 0..<friends.count {
        var get = (0..<friends.count).map { j in graph[j][i] }.reduce(0,+)
        var give = graph[i][0..<friends.count].map { Int($0) }.reduce(0,+)
        quotient[i] = (get, give, give-get)
    }
    
    // 다음 달 주고 받을 선물 계산
    for i in 0..<friends.count-1 {
        for j in i+1..<friends.count {
            if graph[i][j] == graph[j][i] {
                if quotient[i]?.2 == quotient[j]?.2 { continue }
                quotient[i]!.2 > quotient[j]!.2 ? (nextMonth[i] += 1) : (nextMonth[j] += 1)
            } else {
                graph[i][j] > graph[j][i] ? (nextMonth[i] += 1) : (nextMonth[j] += 1)
            }
        }
    }

    return nextMonth.max()!
}