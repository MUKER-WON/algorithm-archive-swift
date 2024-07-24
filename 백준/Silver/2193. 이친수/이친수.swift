let N = Int(readLine()!)!
var arr = [1,1]

while arr.count < N {
    arr.append(arr[arr.count-1]+arr[arr.count-2])
}
print(arr.last!)