func solution(_ str1:String, _ str2:String) -> Int {
    let unrefinedStr1 = str1.uppercased().utf8.map { $0 } // 아스키코드로 변환
    let unrefinedStr2 = str2.uppercased().utf8.map { $0 }
    var refinedStr1 = [String]() // A~Z만 포함된 정제된 배열
    var refinedStr2 = [String]()
    var result = [0,0]
    for i in 0..<unrefinedStr1.count-1 { // str1에서 A~Z만 포함한 문자열 정제
        let a = Int(unrefinedStr1[i])
        let b = Int(unrefinedStr1[i+1])
        if (65...90).contains(a) && (65...90).contains(b) {
            refinedStr1.append(String(UnicodeScalar(a)!) + String(UnicodeScalar(b)!))
        }
    }
    for i in 0..<unrefinedStr2.count-1 { // str2에서 A~Z만 포함한 문자열 정제
        let a = Int(unrefinedStr2[i])
        let b = Int(unrefinedStr2[i+1])
        if (65...90).contains(a) && (65...90).contains(b) {
            refinedStr2.append(String(UnicodeScalar(a)!) + String(UnicodeScalar(b)!))
        }
    }
    let dic1 = Dictionary(grouping: refinedStr1, by: { $0 })
    let dic2 = Dictionary(grouping: refinedStr2, by: { $0 })
    let intersection = Set(refinedStr1).intersection(refinedStr2) // 교집합
    let union = Set(refinedStr1).union(refinedStr2) // 합집합
    for i in intersection { // 교집합에서 min인 숫자를 result[0]에 넣기
        result[0] += min(dic1[i]!.count,dic2[i]!.count)
    }
    for i in union { // 합집합에서 max인 숫자를 result[1]에 넣기
        result[1] += max(dic1[i]?.count ?? 0,dic2[i]?.count ?? 0)
    }
    guard result != [0,0] else { return 65536 }
    return Int(Double(result[0]) / Double(result[1]) * 65536)
}