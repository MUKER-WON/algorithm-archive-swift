let n = Int(readLine()!)!
(0..<n).forEach { print(String(repeating: " ", count: $0) + String(repeating: "*", count: (n-$0)*2-1)) }