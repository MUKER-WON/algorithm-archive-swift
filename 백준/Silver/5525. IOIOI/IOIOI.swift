let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!.map { String($0) }
let str = "I"+String(repeating: "OI", count: N)
print((0..<M-N*2).filter { str == S[$0...$0+N*2].joined() }.count)