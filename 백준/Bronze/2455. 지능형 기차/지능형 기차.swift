var p = 0, m = 0
for _ in 0..<4 {
    let n = readLine()!.split {$0==" "}.map {Int($0)!}
    p -= n[0]
    p += n[1]
    m = max(m,p)
}
print(m)