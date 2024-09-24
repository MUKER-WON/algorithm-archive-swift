let N = Int(readLine()!)!
let A = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted(by: >)
let B = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted(by: <)
print((0..<N).map { A[$0]*B[$0] }.reduce(0,+))