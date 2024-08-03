while let n = readLine(), let num = Int(n) {
    var x = 1, count = 1
    while x % num != 0 {
        x = (x*10+1) % num
        count += 1
    }
    print(count)
}