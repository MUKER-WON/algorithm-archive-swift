let c = Int(readLine()!)!
for i in 1...c {
    print(String(repeating: " ", count: c-i) + String(repeating: "*", count: 2*i-1))
}
