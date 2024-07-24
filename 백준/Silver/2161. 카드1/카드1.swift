var arr = Array(1...Int(readLine()!)!)
while arr.count != 1 {
    print(arr.removeFirst(),terminator: " ")
    arr.append(arr.removeFirst())
}
print(arr[0])