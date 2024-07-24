func solution(_ msg:String) -> [Int] {
    var dicIndex = 1 // 사전 번호
    var dic = [String: Int]()
    (65...90).map { String(UnicodeScalar($0)) }.forEach { // 사전 초기화
        dic[$0] = dicIndex
        dicIndex += 1 }
    let arr = msg.map { $0 }
    var result = [Int]()
    
    var temp = "" // result에 넣을 문자열 기억
    var count = 0
    while arr.count > count {
        let start = count // 시작 index
        while arr.count > count {
            let str = String(arr[start...count].map { $0 })
            if dic[str] != nil {
                temp = str // 마지막 str 기억
                count += 1
                continue
            }
            else {
                dic[str] = dicIndex
                result.append(dic[temp]!)
                dicIndex += 1
                break
            }
        }
    }
    return result + [dic[temp]!]
}