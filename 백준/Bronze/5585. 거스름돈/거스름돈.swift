var change = 1000 - Int(readLine()!)!
var count = 0
while change != 0 {
    while change >= 500 {
        change -= 500
        count += 1
    }
    while change >= 100 {
        change -= 100
        count += 1
    }
    while change >= 50 {
        change -= 50
        count += 1
    }
    while change >= 10 {
        change -= 10
        count += 1
    }
    while change >= 5 {
        change -= 5
        count += 1
    }
    while change >= 1 {
        change -= 1
        count += 1
    }
}
print(count)