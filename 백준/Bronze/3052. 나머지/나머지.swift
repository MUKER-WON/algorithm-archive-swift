var arr = [Int]()

for _ in 0...9 {
    let num = Int(readLine()!)! % 42
    if arr.firstIndex(of: num) == nil {
        arr.append(num)
    }
}

print(arr.count)