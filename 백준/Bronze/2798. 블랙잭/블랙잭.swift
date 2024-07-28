var NM = readLine()!.split(separator: " ").map { Int($0)! }
var card = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = [Int]()
main: for i in 0..<NM[0] {
    for j in i+1..<NM[0] {
        for k in j+1..<NM[0] {
            let sum = card[i]+card[j]+card[k]
            if sum <= NM[1] {
                if sum == NM[1] {
                    result.removeAll()
                    result.append(sum)
                } else {
                    result.append(sum)
                }
            }
        }
    }
}
print(result.max()!)