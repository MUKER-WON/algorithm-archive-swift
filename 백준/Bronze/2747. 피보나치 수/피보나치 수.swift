let n = Int(readLine()!)!
var arr = [0,1]
if n>=2 {
    for i in 2...n {
        arr.append(arr[i-1]+arr[i-2])
    }
}
print(arr[n])