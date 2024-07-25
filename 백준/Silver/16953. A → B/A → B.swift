let I = readLine()!.split { $0 == " " }.map { Int($0)! }
var (A,B) = (I[0],I[1])

for i in 1... {
    if B == A {
        print(i) 
        break
    }
    var n = String(B)
    if B % 2 == 0 {
        B /= 2
    } else if n.last == "1" && B > A {
        n.removeLast()
        B = Int(n)!
    } else {
        print(-1)
        break
    }
}