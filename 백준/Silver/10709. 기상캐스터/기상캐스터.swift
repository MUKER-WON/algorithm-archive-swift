let HW = readLine()!.split { $0 == " " }.map { Int($0)! }, H = HW[0], W = HW[1]

for _ in 0..<H {
    var w = Array(readLine()!)
    var result = Array(repeating: -1, count: W)
    var count = 0
    while !w.allSatisfy({ $0 == "." }) {
        for i in 0..<W {
            if w[i] == "c" && result[i] == -1 {
                result[i] = count
            }
        }
        count += 1
        w.insert(".", at: 0)
        w.removeLast()
    }
    print(result.map { String($0) }.joined(separator: " "))
}