var arr = Array(repeating: Array(repeating: false, count: 100), count: 100)

for _ in 0..<Int(readLine()!)! {
    let xy = readLine()!.split(separator: " ").map { Int($0)!-1 }
    let x = xy[0], y = xy[1]
    for i in y..<y+10 {
        arr[i][x..<x+10] = ArraySlice(repeating: true, count: 10)
    }
}
print(arr.map { $0.filter { $0 == true }.count }.reduce(0,+))