_ = readLine()!
let A = Set(readLine()!.split(separator: " ").map { Int($0)! })
let B = Set(readLine()!.split(separator: " ").map { Int($0)! })
print(A.filter { !B.contains($0) }.count + B.filter { !A.contains($0) }.count)