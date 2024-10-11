for _ in 0..<Int(readLine()!)! {
    let I = readLine()!.split {$0==" "}.map{Int($0)!}
    for _ in 0..<I[1] {_ = readLine()}
    print(I[0]-1)
}