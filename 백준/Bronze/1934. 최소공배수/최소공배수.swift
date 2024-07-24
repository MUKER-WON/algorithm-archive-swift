func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a%b)
}

for _ in 0..<Int(readLine()!)! {
    let f = readLine()!.split(separator: " ").map { Int($0)! }
    let A = f[0], B = f[1]
    print(A*B/gcd(A, B))
}