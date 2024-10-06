let N = Int(readLine()!)!
let size = readLine()!.split { $0 == " " }.map { Int($0)! }
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (T,P) = (I[0],I[1])

print(size.map { i in
    var n = i/T
    if i%T != 0 { n += 1 }
    return n
}.reduce(0,+))

print(N/P, N%P)