let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!.map { String($0) }
var (cnt,ans,i) = (0,0,0)

while i<M-2 {
    if S[i] == "I" && S[i+1] == "O" && S[i+2] == "I" {
        cnt += 1
        if cnt == N { ans += 1; cnt -= 1 }
        i += 1
    } else { cnt = 0 }
    i += 1
}
print(ans)