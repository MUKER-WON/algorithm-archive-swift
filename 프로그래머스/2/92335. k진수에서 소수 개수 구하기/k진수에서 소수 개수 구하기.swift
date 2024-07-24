import Foundation
// 소수판별 함수
func isPrimeNumber(x: Int) -> Bool {
    if x < 4 { return x == 1 ? false : true }
    for i in 2...Int(sqrt(Double(x))) {
        if (x % i == 0) { return false }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let arr = String(n,radix: k).split(separator: "0").map { Int($0)! }
    var result = 0
    for i in arr {
        if isPrimeNumber(x: i) { result += 1 }
    }
    return result
}