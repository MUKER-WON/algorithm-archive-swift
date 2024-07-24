var r = Int(readLine()!)!
var c = 1
while true {
    r = r - c
    if r <= 0 {
        break
    }
    c += 1
}
if c % 2 == 1 {
    print("\(-r + 1)/\(r + c)")
} else {
    print("\(r + c)/\(-r + 1)")
}