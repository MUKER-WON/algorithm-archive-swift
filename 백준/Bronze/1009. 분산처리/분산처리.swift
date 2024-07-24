for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split {$0==" "}.map {Int($0)!}, a=ab[0], b=ab[1]
    var n = 1
    for _ in 0..<b {
        n = n*a%10
    }
    print(n==0 ? 10 : n)
}