import Foundation

func solution(_ storey:Int) -> Int {
    var result = 0
    var intArr = String(storey).map {Int(String($0))!} // [9,5,5,4]
    
    for i in (0..<intArr.count).reversed() {
        let n = intArr[i]
        if i == 0 { // 제일 높은 층 일 때
            if n > 5 { 
                result += 11-n
            } else {
                result += n
            }
        } else { // 나머지 층
            if n == 5 { // 5층일 때
                if intArr[i-1] > 4 {
                    result += 10-n
                    intArr[i-1] += 1
                } else {
                    result += n
                }
            } else if n > 5 {
                result += 10-n
                intArr[i-1] += 1
            } else {
                result += n
            }
        }
    }
    return result
}