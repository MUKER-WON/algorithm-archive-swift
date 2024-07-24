let N = Int(readLine()!)!
var arr = [1,2]
for i in 1..<N { arr += [(arr[i]+arr[i-1])%15746] }
print(arr[N-1])