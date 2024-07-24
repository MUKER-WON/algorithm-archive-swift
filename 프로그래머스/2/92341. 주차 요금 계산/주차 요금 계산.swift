import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var enterTime = [String: String]() // 출입시간
    var totalTime = [String: Int]() // 총출입시간
    var result = [Int]()
    
    for i in records { // 주차시간 계산
        let record = i.split(separator: " ").map { String($0) }
        if record[2] == "IN" {
            enterTime[record[1]] = record[0]
            if !totalTime.keys.contains(record[1]) {
                totalTime[record[1]] = 0
            }
        } else {
            let comeIn = enterTime[record[1]]!.split(separator: ":").map { Int($0)! } // 들어온 시간
            let comeOut = record[0].split(separator: ":").map { Int($0)! } // 나온 시간
            let time = (comeOut[0]-comeIn[0])*60 + (comeOut[1]-comeIn[1])
            totalTime[record[1]]! += time
            enterTime[record[1]] = nil
        }
    }
    
    for i in enterTime { // 23:59분까지 안나간 차량 주차시간 계산
        let comeIn = i.value.split(separator: ":").map { Int($0)! }
        totalTime[i.key]! += (23-comeIn[0])*60 + (59-comeIn[1])
    }
    
    for i in totalTime.sorted(by: { $0.key < $1.key }) { // 요금 계산
        if i.value > fees[0] {
            result.append(fees[1] + Int(ceil(Double(i.value-fees[0]) / Double(fees[2]))) * fees[3])
        } else {
            result.append(fees[1])
        }
    }
    return result
}