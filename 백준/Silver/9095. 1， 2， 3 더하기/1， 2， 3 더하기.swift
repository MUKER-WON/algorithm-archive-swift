var D = [1,2,4]+Array(repeating: 0, count: 7)
for i in 3..<10 { D[i] = D[i-3]+D[i-2]+D[i-1] }
for _ in 0..<Int(readLine()!)! { print(D[Int(readLine()!)!-1]) }