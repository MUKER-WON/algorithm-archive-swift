var arr = [Int]()
for _ in 0..<5 {
  let n = Int(readLine()!)!
  arr.append(n < 40 ? 40 : n)
}
print(arr.reduce(0,+)/5)