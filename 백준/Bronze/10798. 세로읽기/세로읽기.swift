var arr = Array(repeating: "", count: 15)
for _ in 0..<5 { readLine()!.enumerated().forEach { arr[$0.offset].append($0.element) } }
print(arr.joined())