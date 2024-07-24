import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var dic = [Int: Int]()
    var count = 1
    
    for i in 0..<speeds.count {
        while progresses[i]+speeds[i]*count<100 {
            count+=1
        }
        dic[count] = (dic[count] ?? 0) + 1
    }
    
    return dic.sorted { $0.key < $1.key }.map { $0.value }
}