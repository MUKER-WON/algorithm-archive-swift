let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
var A = readLine()!.split { $0 == " " }.map { Int($0)! }
var B = readLine()!.split { $0 == " " }.map { Int($0)! }
var (p1,p2) = (0,0)
var C = [Int]()

for _ in 0..<N+M {
    if p1 >= N {
        C += [B[p2]]
        p2 += 1
    } else if p2 >= M {
        C += [A[p1]]
        p1 += 1
    } else if A[p1] > B[p2] {
        C += [B[p2]]
        p2 += 1
    } else {
        C += [A[p1]]
        p1 += 1
    }
}
print(C.map { String($0) }.joined(separator: " "))