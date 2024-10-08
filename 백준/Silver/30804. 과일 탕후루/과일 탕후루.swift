let N = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var (l,r,c) = (0,0,0)
var dic = [Int: Int]()
var ans = 1

while r < N {
    if dic[arr[r], default: 0] == 0 { c += 1 }
    dic[arr[r], default: 0] += 1
    r += 1
    while c > 2 {
        dic[arr[l], default: 0] -= 1
        if dic[arr[l]] == 0 { c -= 1 }
        l += 1
    }
    ans = max(ans, r-l)
}

print(ans)