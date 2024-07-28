let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    let k = Int(readLine()!)! // 층
    let n = Int(readLine()!)! // 호수
    var arr = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14]]
    while arr.count < k {
        var temp = Array(repeating: 0, count: n)
        for i in 0..<n {
            temp[i] = arr.last![0...i].reduce(0,+)
        }
        arr.append(temp)
    }
    print(arr.last![0...n-1].reduce(0,+))
}