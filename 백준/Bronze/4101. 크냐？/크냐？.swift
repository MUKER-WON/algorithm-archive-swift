while true {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    guard arr != [0,0] else { break }
    arr[0] > arr[1] ? print("Yes") : print("No")
}