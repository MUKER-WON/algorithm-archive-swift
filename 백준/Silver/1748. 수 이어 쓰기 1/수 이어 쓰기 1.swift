var n = Int(readLine()!)!
let cnt = String(n).count
var result = 0
var now = 9
for i in 1...cnt {
    if i==cnt { result += n*cnt }
    else {
        n -= now
        result += now * i
        now *= 10
    }
}
print(result)
