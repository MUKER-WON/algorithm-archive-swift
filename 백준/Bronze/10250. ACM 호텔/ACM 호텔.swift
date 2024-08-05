for _ in 0..<Int(readLine()!)! {
    let i = readLine()!.split(separator: " ").map { Int($0)! }
    let H = String((i[2]-1) % i[0]+1)
    var W = String((i[2]-1) / i[0]+1)
    if W.count <= 1 { W = "0"+W }
    print(H+W)
}