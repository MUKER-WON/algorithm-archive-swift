func solution(_ n:Int) -> Int {
    var result = [0,1]
    for i in 2...n {
        result.append((result[i-1] + result[i-2]) % 1234567 )
    }
    return result[n]
}