func solution(_ n:Int) -> Int {
    var arr = [1,2]
    while arr.count < n { arr.append((arr[arr.count-1]+arr[arr.count-2]) % 1234567) }
    return arr[n-1]
}