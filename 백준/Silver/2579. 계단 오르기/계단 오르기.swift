let n = Int(readLine()!)!
var arr1 = Array(repeating: 0, count: n)
var arr2 = Array(repeating: 0, count: n)

for i in 0..<n {
    let now = Int(readLine()!)!
    
    if i == 0 { arr1[i] = now }
    else { arr1[i] = now + arr2[i-1] }
    
    if i < 2 { arr2[i] = now }
    else { arr2[i] = now + max(arr1[i-2], arr2[i-2]) }
}

print(max(arr1[n-1], arr2[n-1]))