let f = readLine()!.split(separator: " ").map { Int($0)!}
var a = Set((0..<f[0]).map { _ in readLine()! })
print((0..<f[1]).map { _ in readLine()! }.filter { a.contains($0) }.count)