let n = Int(readLine()!)!
for i in 1...n { print(String(repeating: "*",count: i)) }
for i in 1..<n { print(String(repeating: "*", count: n-i)) }