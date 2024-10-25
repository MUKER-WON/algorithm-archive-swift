for _ in 0..<Int(readLine()!)! {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (M,N,x,y) = (I[0],I[1],I[2],I[3])
    var (ans,n) = (-1,x)
    
    while n <= M * N {
        if (n-1) % N+1 == y { ans = n; break }
        n += M
    }
    
    print(ans)
}