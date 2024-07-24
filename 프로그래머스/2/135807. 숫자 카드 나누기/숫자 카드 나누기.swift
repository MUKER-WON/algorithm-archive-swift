import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a%b == 0 { return b }
        return gcd(b,a%b)
    }
    
    var aN = arrayA[0], bN = arrayB[0]
    for i in 0..<arrayA.count {
        aN = gcd(aN, arrayA[i])
        bN = gcd(bN, arrayB[i])
    }
    
    var result = 0
    
    if bN != 1 && arrayA.filter { $0 % bN == 0 }.count == 0 {
        result = max(result,bN)
    }
    if aN != 1 && arrayB.filter { $0 % aN == 0 }.count == 0 {
        result = max(result,aN)
    }
    
    return result
}