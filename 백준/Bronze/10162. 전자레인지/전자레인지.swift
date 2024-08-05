var T = Int(readLine()!)!
let Button = [300,60,10]
var result = [0,0,0]
for i in 0..<3 {
    result[i] = T / Button[i]
    T = T % Button[i]
}
if T == 0 { for i in result { print(i) } } else { print(-1) }