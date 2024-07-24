let a = Int(readLine()!)!
var count = 0
var num = 1

while true {
    count += 1
    if num >= a {
        break
    } else {
        num += count * 6
    }
}
print(count)