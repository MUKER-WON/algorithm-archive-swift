var arr = Array(repeating: 0, count: 26)
for i in readLine()! { arr[Int(i.asciiValue!)-97] += 1 }
arr.forEach{print($0,terminator: " ")}