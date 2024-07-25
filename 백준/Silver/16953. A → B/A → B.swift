let I = readLine()!.split { $0 == " " }.map { Int($0)! }
var (A,B) = (I[0],I[1])

for i in 1... {
    if B == A {
        print(i) 
        break
    }
    if B % 2 == 0 {
        B /= 2
    } else if B % 10 == 1 && B > A {
        B /= 10
    } else {
        print(-1)
        break
    }
}