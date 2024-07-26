for _ in 0..<Int(readLine()!)! {
    var arr = [0,0,0,0]
    var n = Int(readLine()!)!
    if n / 25 >= 1 {
        arr[0] = n / 25
        n %= 25
    }
    if n / 10 >= 1 {
        arr[1] = n / 10
        n %= 10
    }
    if n / 5 >= 1 {
        arr[2] = n / 5
        n %= 5
    }
    arr[3] = n
    arr.forEach { print($0,terminator: " ") }
}