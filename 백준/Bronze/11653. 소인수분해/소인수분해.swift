var n = Int(readLine()!)!
var arr = [Int]()
while n > 1 {
    for i in 2... {
        if n % i == 0 {
            n = n / i
            arr.append(i)
            break
        }
    }
}
arr.forEach { print($0) }