func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dic = [String: Int]()
    for i in 0..<want.count { dic[want[i]] = number[i] } // 딕셔너리 초기화
    var result = 0
    for i in 0...discount.count-10 {
        var tempDic = dic
        for i in discount[i..<i+10] {
            if tempDic[i] != nil && tempDic[i]! > 0 {
                tempDic[i]! -= 1
            } else {
                break
            }
        }
        if tempDic.values.reduce(0){$0+$1} == 0 { result += 1 }
    }
    return result
}