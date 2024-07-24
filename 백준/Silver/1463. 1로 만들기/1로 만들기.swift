var num = Int(readLine()!)!
var arr = Array(repeating: 0, count: num+1)
for i in 1...num {
    var n = i
    var count = 0
    while n > 1 {
        if arr[n] > 0 {
            break
        }
        if n % 3 == 0 && n % 2 == 0 {
            arr[n/3] < arr[n/2] ? (n /= 3) : (n /= 2)
            count += 1
            continue
        }
        if n % 3 == 0 {
            n /= 3
            count += 1
            continue
        }
        if n % 2 == 0 {
            n /= 2
            count += 1
            continue
        }
        n -= 1
        count += 1
    }
    arr[i] = min(arr[n] + count, arr[i-1] + 1)
}
print(arr[num])