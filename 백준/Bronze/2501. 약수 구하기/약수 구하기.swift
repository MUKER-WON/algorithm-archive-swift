let n = readLine()!.split(separator: " ").map { Int($0)! }
let arr = (1...n[0]).filter { n[0]%$0 == 0 }
arr.count >= n[1] ? print(arr[n[1]-1]) : print(0)