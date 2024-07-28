var sugarKg = Int(readLine()!)!
var count = 0

while sugarKg > 2 {
    if sugarKg % 5 == 0 {
        count += sugarKg / 5
        sugarKg = 0
        break
    }
    sugarKg -= 3
    count += 1
}

sugarKg == 0 ? print(count) : print(-1)
